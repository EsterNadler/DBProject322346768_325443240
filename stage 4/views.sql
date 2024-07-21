-- A view to summarize lesson information
CREATE OR REPLACE VIEW LessonSummary AS
SELECT 
    l.ClassId AS ClassId,
    gc.ClassName AS ClassName,
    COUNT(*) AS LessonCount,
    ROUND(AVG(l.Rating), 2) AS AvgRating,
    AVG(r.Capacity) AS AvgCapacity,
    COUNT(DISTINCT l.PersonId) AS TrainerCount
FROM 
    Lesson l
JOIN Room r ON l.RoomNum = r.RoomNum
JOIN Gym_Class gc ON l.ClassId = gc.ClassId
GROUP BY 
    l.ClassId, gc.ClassName;

-- simple Query:
select * from LessonSummary;


-- Identify the most popular and highly-rated class types:
SELECT 
    ClassId, ClassName, LessonCount, AvgRating
FROM LessonSummary
ORDER BY LessonCount DESC, AvgRating DESC;

-- Find classes with potential capacity issues:
SELECT ClassId,ClassName,AvgCapacity,LessonCount,TrainerCount,(LessonCount / TrainerCount) AS LessonsPerTrainer
FROM LessonSummary
WHERE AvgCapacity < 10 OR (LessonCount / TrainerCount) > 20
ORDER BY AvgCapacity ASC, LessonsPerTrainer DESC;

-- A view to summarize personal trainings information
CREATE OR REPLACE VIEW PersonalTrainingSummary AS
SELECT 
    pt.ClassId AS ClassId,
    gc.ClassName AS ClassName,
    COUNT(*) AS SessionCount,
    ROUND(AVG(pt.TrainingCost),2) AS AvgCost,
    COUNT(DISTINCT pt.TrainerId) AS TrainerCount,
    COUNT(DISTINCT pt.MemberId) AS MemberCount
FROM Personal_Training pt
JOIN Gym_Class gc ON pt.ClassId = gc.ClassId
GROUP BY pt.ClassId, gc.ClassName;
    
-- simple query:
select * from PersonalTrainingSummary order by SessionCount DESC ;

-- Analyze the popularity and profitability of different personal training types:   
SELECT ClassId,ClassName,SessionCount,AvgCost,(SessionCount * AvgCost) AS EstimatedRevenue
FROM PersonalTrainingSummary
ORDER BY EstimatedRevenue DESC;    

-- Select the top 10 popular personal trainings
SELECT ClassId,SessionCount,TrainerCount,MemberCount
FROM PersonalTrainingSummary
ORDER BY SessionCount DESC fetch first 10 rows only;

