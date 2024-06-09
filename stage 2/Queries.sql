--Select class name, room number, lesson date, and number of participants for each lesson that had at least 
--6 participants, ordered by the lesson date.
SELECT GC.ClassName, L.RoomNum, L.LessonDate, Participation.NumParticipants
FROM Lesson L
JOIN Gym_Class GC ON L.ClassId = GC.ClassId
JOIN (SELECT TL.LessonId, TL.ClassId, COUNT(TL.PersonId) AS NumParticipants
     FROM Takes_Lesson TL
     GROUP BY TL.LessonId, TL.ClassId
     HAVING COUNT(TL.PersonId) >= 6
    ) Participation 
    ON L.LessonId = Participation.LessonId AND L.ClassId = Participation.ClassId
ORDER BY L.LessonDate;

--Select all members who have taken all available classes:
SELECT P.FirstName,P.LastName
FROM Gym_Member GM
JOIN Person P ON GM.PersonId = P.PersonId
WHERE NOT EXISTS (
        SELECT GC.ClassId
        FROM Gym_Class GC
        WHERE NOT EXISTS (
            SELECT 1
            FROM Takes_Lesson TL
            WHERE TL.ClassId = GC.ClassId AND TL.PersonId = GM.PersonId
        )
    );

--Select class names and their average ratings, ordered by rating
SELECT ClassDetails.ClassName, AvgRating
FROM (SELECT GC.ClassId,GC.ClassName,AVG(L.Rating) AS AvgRating
      FROM Lesson L
      JOIN Gym_Class GC ON L.ClassId = GC.ClassId
      GROUP BY GC.ClassId, GC.ClassName
    ) ClassDetails
WHERE AvgRating <= ALL (
      SELECT AVG(L.Rating) AS AvgRating
      FROM Lesson L
      JOIN Trainer T ON L.PersonId = T.PersonId
      WHERE T.PERSONID IN (SELECT L.PersonID
                           FROM LESSON L
                           WHERE L.CLASSID = ClassDetails.ClassId)
      GROUP BY T.PersonId
    );

-- Select the experience level and the count of trainers who have that experience level.
SELECT RES.Experience, COUNT(RES.PersonId) AS NumTainers
FROM (SELECT T.PersonId, P.FirstName, P.LastName, T.Experience, COUNT(L.ClassId) AS NumClasses
      FROM Trainer T
      JOIN Person P ON T.PersonId = P.PersonId
      JOIN Lesson L ON T.PersonId = L.PersonId
      GROUP BY T.PersonId, P.FirstName, P.LastName, T.Experience
      ORDER BY T.Experience) RES
GROUP BY RES.Experience;

-- Update trainer experience if the trainer tought at least 1 lesson on the last year
UPDATE Trainer
SET Experience = Experience + 1
WHERE PersonId IN (
    SELECT DISTINCT l.PersonId
    FROM Lesson l
    WHERE EXTRACT(YEAR FROM l.LessonDate) = EXTRACT(YEAR FROM SYSDATE) - 1
);

-- Update the leave date of all members who have not participated in any lesson for an entire year to the current date
UPDATE Gym_Member
SET LeaveDate = SYSDATE
WHERE PersonId NOT IN (
    SELECT DISTINCT gm.PersonId
    FROM Gym_Member gm
    JOIN Takes_Lesson tl ON gm.PersonId = tl.PersonId
    JOIN Lesson l ON tl.LessonId = l.LessonId AND tl.ClassId = l.ClassId
    WHERE l.LessonDate >= ADD_MONTHS(SYSDATE, -12)
);

-- Step 1: Drop existing foreign key constraint (if it exists)
ALTER TABLE Lesson
DROP CONSTRAINT SYS_C00711881;

ALTER TABLE Takes_Lesson 
DROP CONSTRAINT SYS_C00711887;

ALTER TABLE Takes_Lesson
DROP CONSTRAINT SYS_C00711886;

ALTER TABLE GYM_MEMBER_MEDICAL_CONSTRAINS
DROP CONSTRAINT SYS_C00709992;

-- Step 2: Add foreign key constraint with ON DELETE CASCADE
ALTER TABLE Lesson
ADD CONSTRAINT SYS_C00711881
FOREIGN KEY (PersonId) REFERENCES Trainer(PersonId) ON DELETE CASCADE;

ALTER TABLE Takes_Lesson
ADD CONSTRAINT SYS_C00711887
FOREIGN KEY (PersonId)
REFERENCES GYM_MEMBER(PersonId) ON DELETE CASCADE;

ALTER TABLE Takes_Lesson
ADD CONSTRAINT SYS_C00711886
FOREIGN KEY (LessonId, ClassId)
REFERENCES Lesson(LessonId, ClassId) ON DELETE CASCADE;

ALTER TABLE GYM_MEMBER_MEDICAL_CONSTRAINS
ADD CONSTRAINT SYS_C00709992
FOREIGN KEY (PersonId) REFERENCES GYM_MEMBER(PersonId) ON DELETE CASCADE;

--Delete all trainers with less than one year of experience who have not conducted any lessons in the past year
DELETE FROM Trainer
WHERE PersonId IN (
    SELECT t.PersonId
    FROM Trainer t
    LEFT JOIN Lesson l ON t.PersonId = l.PersonId
    WHERE t.Experience < 1
      AND (l.LessonDate IS NULL OR l.LessonDate < ADD_MONTHS(SYSDATE, -12))
);

--Delete all members who left the club more than two years ago and have not rejoined since
DELETE FROM Gym_Member
WHERE PersonId IN (
    SELECT gm.PersonId
    FROM Gym_Member gm
    WHERE gm.LeaveDate IS NOT NULL
      AND gm.LeaveDate < ADD_MONTHS(SYSDATE, -24)
      AND gm.PersonId NOT IN (
          SELECT gm2.PersonId
          FROM Gym_Member gm2
          WHERE gm2.JoinDate > gm.LeaveDate
      )
);
