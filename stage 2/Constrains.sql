-- Add CHECK constraint to Gym_Class table
ALTER TABLE Gym_Class
ADD CONSTRAINT chk_age_range CHECK (MinAge < MaxAge);

-- Add DEFAULT constraint to Person table
ALTER TABLE Person
MODIFY (City DEFAULT 'Unknown');

-- Add NOT NULL constraint to Room table
ALTER TABLE Room
MODIFY (RoomType NOT NULL);
