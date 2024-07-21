
-- RENAME TABLES WITH EQUAL NAMES:
ALTER TABLE PERSON RENAME TO OUR_PERSON;
ALTER TABLE TRAINER RENAME TO OUR_TRAINER;

-- Add/modify columns in OUR_PERSON:
ALTER TABLE OUR_PERSON MODIFY firstname VARCHAR2(30);
ALTER TABLE OUR_PERSON MODIFY CITY null;
ALTER TABLE OUR_PERSON RENAME COLUMN address TO street;
ALTER TABLE OUR_PERSON MODIFY street null;
ALTER TABLE OUR_PERSON MODIFY gender null;

-- Insert into OUR_PERSON the data from PERSON:
INSERT INTO OUR_PERSON (personid, firstname, lastname, birthdate, city, street, housenum, email, gender)
SELECT person_id, first_name, last_name, birth_date, city, street, house_number, email, null as gender
FROM person;

-- Insert into PERSON_PHONE the data from PERSON and from PERSON_ANOTHER_PHONE:
INSERT INTO PERSON_PHONE (personid, phone)
SELECT person_id, TO_CHAR(main_phone)
FROM person;

INSERT INTO PERSON_PHONE (personid, phone)
SELECT person_id, TO_CHAR(another_phone)
FROM person_another_phone;

-- Add/modify columns in OUR_TRAINER:
ALTER TABLE OUR_TRAINER RENAME COLUMN experience TO seniority;
ALTER TABLE OUR_TRAINER MODIFY license null;

-- Insert into OUR_TRAINER the data from TRAINER:
INSERT INTO OUR_TRAINER (personid, seniority, license)
SELECT person_id, seniority,null as license 
FROM trainer;

-- Insert into GYM_MEMBER the data from TRAINEE:
INSERT INTO GYM_MEMBER (personid, joindate, leavedate)
SELECT person_id , joining_date ,null as leavedate 
FROM trainee;

-- Insert into GYM_MEMBER_MEDICAL_CONSTRAINS the data from TRAINEE:
INSERT INTO gym_member_medical_constrains (personid, medicalconstrains)
SELECT 
    gm.personid,
    CASE 
        WHEN t.health_condition = 'Overweight' THEN 'Obesity (morbid)'
        WHEN t.health_condition = 'Poor' THEN 'Severe chronic fatigue syndrome'
        WHEN t.health_condition = 'Unhealthy lifestyle' THEN 'Severe metabolic syndrome'
        WHEN t.health_condition = 'Elderly' THEN 'Severe cognitive impairment'
        WHEN t.health_condition = 'Depressed' THEN 'Severe depression'
        WHEN t.health_condition = 'Underweight' THEN 'Severe anemia'
        WHEN t.health_condition = 'Recovering from surg' THEN 'Recent surgery'
        WHEN t.health_condition = 'Pregnant' THEN 'Pregnancy'
        WHEN t.health_condition = 'Stressed' THEN 'Severe anxiety'
        WHEN t.health_condition = 'Disabled' THEN 'Severe musculoskeletal disorders'
        WHEN t.health_condition = 'Undergoing treatment' THEN 'Severe chronic kidney disease'
        WHEN t.health_condition = 'Anxious' THEN 'Severe anxiety'
        WHEN t.health_condition = 'with chronic disease' THEN 'Chronic obstructive pulmonary disease (COPD)'
        WHEN t.health_condition = 'with occasional issu' THEN 'Severe IBS'
        WHEN t.health_condition = 'with severe health i' THEN 'Severe chronic kidney disease'
    END AS medicalconstrains
FROM 
    gym_member gm
    JOIN trainee t ON gm.personid = t.person_id
WHERE 
    t.health_condition NOT IN ('Excellent', 'Good', 'Fair', 'Unknown', 'Athlete', 'Healthy lifestyle')
    AND t.health_condition IN (
        'Overweight', 'Poor', 'Unhealthy lifestyle', 'Elderly', 'Depressed', 
        'Underweight', 'Recovering from surg', 'Pregnant', 'Stressed', 'Disabled', 
        'Undergoing treatment', 'Anxious', 'with chronic disease', 'with occasional issu', 
        'with severe health i'
    );

 
-- Insert into GYM_CLASS the data from TRAINING:
INSERT INTO GYM_CLASS (classid, classname, minage, maxage, duration)
SELECT t.training_code, t.training_type, 1 AS minage, 120 AS maxage, t.duration 
FROM training t
WHERE NOT EXISTS (
    SELECT 1 
    FROM GYM_CLASS gc 
    WHERE gc.classid = t.training_code
);

INSERT INTO gym_class_medical_constrains (classid, medical_constrains)
SELECT t.training_code, 
    CASE 
        WHEN t.constrains = 'health condition obesity' THEN 'Obesity (morbid)'
        WHEN t.constrains = 'health condition asthma' THEN 'Severe asthma'
        WHEN t.constrains = 'health condition heart condition' THEN 'Heart disease'
        WHEN t.constrains = 'health condition hypertension' THEN 'High blood pressure'
        WHEN t.constrains = 'health condition diabetes' THEN 'Diabetes (uncontrolled)'
        WHEN t.constrains = 'physical state pregnant' THEN 'Pregnancy'
        WHEN t.constrains = 'physical state injured' THEN 'Recent surgery'
        WHEN t.constrains = 'physical state disabled' THEN 'Severe musculoskeletal disorders'
        WHEN t.constrains = 'physical state recovering' THEN 'Recent surgery'
    END
FROM training t
WHERE t.constrains LIKE 'health condition%' 
   OR t.constrains LIKE 'physical state%'
   AND t.constrains NOT IN ('physical state healthy');
   
   
-- RENAME TABLE ACTUAL_TRAINING:
ALTER TABLE ACTUAL_TRAINING RENAME TO PERSONAL_TRAINING;

-- Add/modify columns 
alter table PERSONAL_TRAINING rename column training_hour to TRAININGHOUR;
alter table PERSONAL_TRAINING rename column training_date to TRAININGDATE;
alter table PERSONAL_TRAINING rename column training_location to TRAININGLOCATION;
alter table PERSONAL_TRAINING rename column training_cost to TRAININGCOST;
alter table PERSONAL_TRAINING rename column actual_training_code to classid;
alter table PERSONAL_TRAINING modify classid INTEGER;
alter table PERSONAL_TRAINING rename column person_id1 to memberid;
alter table PERSONAL_TRAINING rename column person_id2 to trainerid;
alter table PERSONAL_TRAINING rename column training_code to personaltrainingid;
alter table PERSONAL_TRAINING modify personaltrainingid INTEGER;

-- Create/Recreate primary, unique and foreign key constraints 
alter table PERSONAL_TRAINING
  drop constraint SYS_C00722728 cascade;
alter table PERSONAL_TRAINING
  add primary key (CLASSID, PERSONALTRAININGID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
  
DELETE FROM PERSONAL_TRAINING
WHERE CLASSID IN (
    SELECT pt.CLASSID
    FROM PERSONAL_TRAINING pt
    LEFT JOIN gym_class gc ON pt.CLASSID = gc.CLASSID
    WHERE gc.CLASSID IS NULL
);
 
alter table PERSONAL_TRAINING
  drop constraint SYS_C00722729;
alter table PERSONAL_TRAINING
  add foreign key (CLASSID)
  references gym_class (CLASSID) on delete cascade;
alter table PERSONAL_TRAINING
  drop constraint SYS_C00722730;
alter table PERSONAL_TRAINING
  add foreign key (MEMBERID)
  references gym_member (PERSONID) on delete cascade;
alter table PERSONAL_TRAINING
  drop constraint SYS_C00722731;
alter table PERSONAL_TRAINING
  add foreign key (TRAINERID)
  references our_trainer (PERSONID) on delete cascade;
-- Create/Recreate check constraints 
alter table PERSONAL_TRAINING
  drop constraint DIFFERENT_IDS;
alter table PERSONAL_TRAINING
  add constraint DIFFERENT_IDS
  check (memberid<>trainerid);

--- ITEM table:
-- Add/modify columns 
alter table ITEM rename column item_code to ITEMID;
alter table ITEM rename column item_name to ITEMNAME;
alter table ITEM rename column item_length to ITEMLENGTH;
-- Create/Recreate primary, unique and foreign key constraints 
alter table ITEM
  drop constraint SYS_C00722736 cascade;
alter table ITEM
  add primary key (ITEMID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
  
--- USES table:
-- Add/modify columns 
alter table USES rename column training_code to CLASSID;
alter table USES rename column item_code to ITEMID;
-- Create/Recreate primary, unique and foreign key constraints 
alter table USES
  drop constraint SYS_C00722743 cascade;
alter table USES
  add primary key (CLASSID, ITEMID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USES
  drop constraint SYS_C00722744;
alter table USES
  add foreign key (CLASSID)
  references gym_class (CLASSID);
alter table USES
  add foreign key (ITEMID)
  references ITEM (ITEMID);
  
-- drop all the combined and not needed tables:
DROP TABLE person_another_phone;
DROP TABLE trainee;
DROP TABLE trainer;
DROP TABLE training;
DROP TABLE person; 

-- RENAME TABLES WITH EQUAL NAMES:
ALTER TABLE OUR_PERSON RENAME TO PERSON;
ALTER TABLE OUR_TRAINER RENAME TO TRAINER;


