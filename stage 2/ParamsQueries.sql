--Select all members who have a birthday in a specific month and have attended any lesson in the past year
SELECT p.PersonId, p.FirstName, p.LastName, p.BirthDate
FROM Person p
JOIN Gym_Member gm ON p.PersonId = gm.PersonId
JOIN Takes_Lesson tl ON gm.PersonId = tl.PersonId
JOIN Lesson l ON tl.LessonId = l.LessonId AND tl.ClassId = l.ClassId
WHERE EXTRACT(MONTH FROM p.BirthDate) IN (&<name="select month:" list="1,2,3,4,5,6,7,8,9,10,11,12" multiselect="true">)
  AND l.LessonDate >= ADD_MONTHS(SYSDATE, -12);
SELECT * FROM LESSON;
--find the number of lessons a specific trainer conducted in a given month:  
SELECT t.PersonId, EXTRACT(MONTH FROM l.LessonDate) AS LessonMonth, COUNT(l.LessonId) AS LessonCount
FROM Trainer t
JOIN Lesson l ON t.PersonId = l.PersonId
WHERE t.PersonId = &<name="insert trainer id:" type="integer" list="select personID from TRAINER" hint="trainer id is number with 8 digits" 
required="true">
  AND EXTRACT(MONTH FROM l.LessonDate) = &<name="select month:" list="1,2,3,4,5,6,7,8,9,10,11,12">
GROUP BY t.PersonId, EXTRACT(MONTH FROM l.LessonDate);

--selects all classes in a certain age range
SELECT gc.ClassId, gc.ClassName, gc.MinAge, gc.MaxAge
FROM Gym_Class gc
WHERE gc.MinAge >= &<name="insert min age:" type="integer" default="0">  
AND gc.MaxAge <= &<name="insert max age:" type="integer" default="99">;

-- Selects all lessons on a certain date and the number of participants in each one
SELECT l.LessonId, l.LessonDate, COUNT(tl.PersonId) AS ParticipantCount
FROM Lesson l
LEFT JOIN Takes_Lesson tl ON l.LessonId = tl.LessonId AND l.ClassId = tl.ClassId
WHERE trunc(l.LessonDate) = &<name="lesson_date" type=date>
GROUP BY l.LessonId, l.LessonDate; 


