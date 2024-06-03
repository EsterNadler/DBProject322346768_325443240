
-------------------SELECT QUERIES-----------------------

--Select all lessons with their corresponding class name, room number, and lesson date, sorted by lesson date:
SELECT GC.ClassName, L.RoomNum, L.LessonDate
FROM Lesson L
JOIN Gym_Class GC ON L.ClassId = GC.ClassId
ORDER BY L.LessonDate;

--Select class names and their average ratings, ordered by rating
SELECT GC.ClassName, AVG(L.Rating) AS AvgRating
FROM Lesson L
JOIN Gym_Class GC ON L.ClassId = GC.ClassId
GROUP BY GC.ClassName
ORDER BY AvgRating DESC;

-- Select all trainers along with their experience and the number of classes they teach
SELECT T.PersonId, P.FirstName, P.LastName, T.Experience, COUNT(L.ClassId) AS NumClasses
FROM Trainer T
JOIN Person P ON T.PersonId = P.PersonId
JOIN Lesson L ON T.PersonId = L.PersonId
GROUP BY T.PersonId, P.FirstName, P.LastName, T.Experience;

-- Select all members who joined the gym in the last month
SELECT p.FirstName, p.LastName, gm.JoinDate
FROM Gym_Member gm
JOIN Person p ON gm.PersonId = p.PersonId
WHERE gm.JoinDate >= ADD_MONTHS(SYSDATE, -1) AND  gm.JoinDate <= SYSDATE;

-------------------UPDATE QUERIES-----------------------

-- Update trainer experience if the trainer taught at least 1 lesson on the last year
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

-------------------DELETE QUERIES-----------------------

-- Step 1: Drop existing foreign key constraint (if it exists)
ALTER TABLE Lesson
DROP CONSTRAINT SYS_C00711881;

ALTER TABLE Takes_Lesson
DROP CONSTRAINT SYS_C00711886;
-- Step 2: Add foreign key constraint with ON DELETE CASCADE
ALTER TABLE Lesson
ADD CONSTRAINT SYS_C00711881
FOREIGN KEY (PersonId) REFERENCES Trainer(PersonId) ON DELETE CASCADE;

ALTER TABLE Takes_Lesson
ADD CONSTRAINT SYS_C00711886
FOREIGN KEY (LessonId, ClassId)
REFERENCES Lesson(LessonId, ClassId) ON DELETE CASCADE;

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
