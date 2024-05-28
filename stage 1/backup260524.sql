prompt Creating GYM_CLASS...
create table GYM_CLASS
(
  classid   INTEGER not null,
  classname VARCHAR2(50) not null,
  minage    INTEGER not null,
  maxage    INTEGER not null,
  duration  INTEGER not null
)
;
alter table GYM_CLASS
  add primary key (CLASSID);

prompt Creating GYM_CLASS_MEDICAL_CONSTRAINS...
create table GYM_CLASS_MEDICAL_CONSTRAINS
(
  medical_constrains VARCHAR2(50) not null,
  classid            INTEGER not null
)
;
alter table GYM_CLASS_MEDICAL_CONSTRAINS
  add primary key (MEDICAL_CONSTRAINS, CLASSID);
alter table GYM_CLASS_MEDICAL_CONSTRAINS
  add foreign key (CLASSID)
  references GYM_CLASS (CLASSID);

prompt Creating PERSON...
create table PERSON
(
  personid  INTEGER not null,
  birthdate DATE not null,
  firstname VARCHAR2(20) not null,
  lastname  VARCHAR2(30) not null,
  city      VARCHAR2(30) not null,
  address   VARCHAR2(50) not null,
  housenum  INTEGER not null,
  email     VARCHAR2(40),
  gender    VARCHAR2(1) not null
)
;
alter table PERSON
  add primary key (PERSONID);

prompt Creating GYM_MEMBER...
create table GYM_MEMBER
(
  joindate  DATE not null,
  leavedate DATE,
  personid  INTEGER not null
)
;
alter table GYM_MEMBER
  add primary key (PERSONID);
alter table GYM_MEMBER
  add foreign key (PERSONID)
  references PERSON (PERSONID);

prompt Creating GYM_MEMBER_MEDICAL_CONSTRAINS...
create table GYM_MEMBER_MEDICAL_CONSTRAINS
(
  medicalconstrains VARCHAR2(50) not null,
  personid          INTEGER not null
)
;
alter table GYM_MEMBER_MEDICAL_CONSTRAINS
  add primary key (MEDICALCONSTRAINS, PERSONID);
alter table GYM_MEMBER_MEDICAL_CONSTRAINS
  add foreign key (PERSONID)
  references GYM_MEMBER (PERSONID);

prompt Creating ROOM...
create table ROOM
(
  capacity INTEGER not null,
  roomnum  INTEGER not null,
  roomtype VARCHAR2(50) not null
)
;
alter table ROOM
  add primary key (ROOMNUM);

prompt Creating TRAINER...
create table TRAINER
(
  license    VARCHAR2(20) not null,
  experience FLOAT not null,
  personid   INTEGER not null
)
;
alter table TRAINER
  add primary key (PERSONID);
alter table TRAINER
  add foreign key (PERSONID)
  references PERSON (PERSONID);

prompt Creating LESSON...
create table LESSON
(
  lessondate DATE not null,
  lessonid   INTEGER not null,
  rating     FLOAT not null,
  classid    INTEGER not null,
  roomnum    INTEGER not null,
  personid   INTEGER not null
)
;
alter table LESSON
  add primary key (LESSONID, CLASSID);
alter table LESSON
  add foreign key (CLASSID)
  references GYM_CLASS (CLASSID);
alter table LESSON
  add foreign key (ROOMNUM)
  references ROOM (ROOMNUM);
alter table LESSON
  add foreign key (PERSONID)
  references TRAINER (PERSONID);

prompt Creating PERSON_PHONE...
create table PERSON_PHONE
(
  phone    VARCHAR2(20) not null,
  personid INTEGER not null
)
;
alter table PERSON_PHONE
  add primary key (PHONE, PERSONID);
alter table PERSON_PHONE
  add foreign key (PERSONID)
  references PERSON (PERSONID);

prompt Creating TAKES_LESSON...
create table TAKES_LESSON
(
  lessonid INTEGER not null,
  classid  INTEGER not null,
  personid INTEGER not null
)
;
alter table TAKES_LESSON
  add primary key (LESSONID, CLASSID, PERSONID);
alter table TAKES_LESSON
  add foreign key (LESSONID, CLASSID)
  references LESSON (LESSONID, CLASSID);
alter table TAKES_LESSON
  add foreign key (PERSONID)
  references GYM_MEMBER (PERSONID);

prompt Disabling triggers for GYM_CLASS...
alter table GYM_CLASS disable all triggers;
prompt Disabling triggers for GYM_CLASS_MEDICAL_CONSTRAINS...
alter table GYM_CLASS_MEDICAL_CONSTRAINS disable all triggers;
prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for GYM_MEMBER...
alter table GYM_MEMBER disable all triggers;
prompt Disabling triggers for GYM_MEMBER_MEDICAL_CONSTRAINS...
alter table GYM_MEMBER_MEDICAL_CONSTRAINS disable all triggers;
prompt Disabling triggers for ROOM...
alter table ROOM disable all triggers;
prompt Disabling triggers for TRAINER...
alter table TRAINER disable all triggers;
prompt Disabling triggers for LESSON...
alter table LESSON disable all triggers;
prompt Disabling triggers for PERSON_PHONE...
alter table PERSON_PHONE disable all triggers;
prompt Disabling triggers for TAKES_LESSON...
alter table TAKES_LESSON disable all triggers;
prompt Disabling foreign key constraints for GYM_CLASS_MEDICAL_CONSTRAINS...
alter table GYM_CLASS_MEDICAL_CONSTRAINS disable constraint SYS_C00706158;
prompt Disabling foreign key constraints for GYM_MEMBER...
alter table GYM_MEMBER disable constraint SYS_C00709988;
prompt Disabling foreign key constraints for GYM_MEMBER_MEDICAL_CONSTRAINS...
alter table GYM_MEMBER_MEDICAL_CONSTRAINS disable constraint SYS_C00709992;
prompt Disabling foreign key constraints for TRAINER...
alter table TRAINER disable constraint SYS_C00706149;
prompt Disabling foreign key constraints for LESSON...
alter table LESSON disable constraint SYS_C00711879;
alter table LESSON disable constraint SYS_C00711880;
alter table LESSON disable constraint SYS_C00711881;
prompt Disabling foreign key constraints for PERSON_PHONE...
alter table PERSON_PHONE disable constraint SYS_C00706162;
prompt Disabling foreign key constraints for TAKES_LESSON...
alter table TAKES_LESSON disable constraint SYS_C00711886;
alter table TAKES_LESSON disable constraint SYS_C00711887;
prompt Deleting TAKES_LESSON...
delete from TAKES_LESSON;
commit;
prompt Deleting PERSON_PHONE...
delete from PERSON_PHONE;
commit;
prompt Deleting LESSON...
delete from LESSON;
commit;
prompt Deleting TRAINER...
delete from TRAINER;
commit;
prompt Deleting ROOM...
delete from ROOM;
commit;
prompt Deleting GYM_MEMBER_MEDICAL_CONSTRAINS...
delete from GYM_MEMBER_MEDICAL_CONSTRAINS;
commit;
prompt Deleting GYM_MEMBER...
delete from GYM_MEMBER;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Deleting GYM_CLASS_MEDICAL_CONSTRAINS...
delete from GYM_CLASS_MEDICAL_CONSTRAINS;
commit;
prompt Deleting GYM_CLASS...
delete from GYM_CLASS;
commit;
prompt Loading GYM_CLASS...
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (1, 'Prenatal Yoga', 62, 69, 82);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (2, 'Postnatal Yoga', 49, 56, 61);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (3, 'Youth Sports Training', 43, 66, 50);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (4, 'Healthy Cooking', 60, 108, 43);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (5, 'Muscle Gain Strategies', 45, 91, 89);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (6, 'Spinning', 69, 71, 119);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (7, 'Nutrition 101', 53, 88, 36);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (8, 'Body Sculpt', 70, 104, 100);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (9, 'Water Aerobics', 64, 79, 93);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (10, 'Postnatal Yoga', 18, 57, 58);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (11, 'Cycling', 22, 84, 71);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (12, 'Tai Chi', 28, 84, 72);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (13, 'Gymnastics Conditioning', 61, 70, 53);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (14, 'HIIT', 16, 18, 32);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (15, 'Senior Fitness', 28, 41, 58);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (16, 'Healthy Cooking', 38, 97, 78);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (17, 'Tai Chi', 40, 68, 66);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (18, 'Kickboxing', 41, 47, 47);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (19, 'Bodybuilding Basics', 35, 86, 86);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (20, 'Aerobics', 23, 88, 30);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (21, 'Pilates for Beginners', 6, 8, 102);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (22, 'Flexibility Training', 41, 86, 120);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (23, 'Zumba Dance', 64, 78, 82);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (24, 'Nutrition 101', 22, 68, 119);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (25, 'Youth Sports Training', 19, 61, 102);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (26, 'Muscle Gain Strategies', 64, 118, 73);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (27, 'Aqua Zumba', 52, 92, 102);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (28, 'Weight Loss Tips', 2, 50, 39);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (29, 'Stretch and Flex', 10, 12, 68);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (30, 'Spinning', 39, 101, 52);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (31, 'Zumba Dance', 64, 112, 90);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (32, 'Water Aerobics', 10, 41, 110);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (33, 'HIIT', 35, 82, 42);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (34, 'Kids Yoga', 52, 116, 87);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (35, 'Trail Running', 60, 119, 92);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (36, 'Stretch and Flex', 39, 87, 79);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (37, 'Dance Aerobics', 43, 93, 49);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (38, 'Tai Chi', 8, 25, 43);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (39, 'Muscle Gain Strategies', 66, 84, 61);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (40, 'Bodybuilding Basics', 12, 53, 69);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (41, 'Kickboxing', 37, 62, 32);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (42, 'Nutrition 101', 70, 86, 108);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (43, 'Advanced Yoga', 11, 24, 42);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (44, 'Weight Loss Tips', 65, 94, 61);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (45, 'Meditation and Relaxation', 19, 30, 114);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (46, 'Powerlifting Basics', 12, 15, 56);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (47, 'Walking Group', 20, 29, 54);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (48, 'Running Club', 22, 87, 55);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (49, 'Rowing', 11, 22, 116);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (50, 'Bodybuilding Basics', 51, 90, 54);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (51, 'Core Strength', 70, 125, 89);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (52, 'Dance Aerobics', 65, 102, 72);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (53, 'Powerlifting Basics', 51, 113, 116);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (54, 'Boot Camp', 30, 56, 87);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (55, 'Aqua Zumba', 65, 71, 93);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (56, 'Sports Nutrition', 44, 58, 37);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (57, 'Mindfulness Meditation', 63, 66, 104);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (58, 'Trail Running', 46, 78, 105);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (59, 'Water Aerobics', 6, 70, 33);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (60, 'Gymnastics Conditioning', 41, 93, 39);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (61, 'Cycling', 50, 109, 95);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (62, 'Walking Group', 18, 70, 43);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (63, 'Meditation and Relaxation', 20, 43, 52);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (64, 'Advanced Yoga', 25, 28, 38);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (65, 'Tai Chi', 10, 23, 46);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (66, 'Aqua Zumba', 40, 69, 115);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (67, 'Obstacle Course Training', 4, 9, 46);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (68, 'Water Aerobics', 54, 115, 66);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (69, 'Functional Fitness', 67, 98, 110);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (70, 'Powerlifting Basics', 44, 90, 80);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (71, 'Weight Loss Tips', 58, 75, 120);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (72, 'Water Aerobics', 14, 75, 75);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (73, 'Rowing', 62, 111, 36);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (74, 'Strength Training', 50, 98, 66);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (75, 'Teen Fitness', 37, 54, 67);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (76, 'Sports Nutrition', 52, 99, 105);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (77, 'Obstacle Course Training', 50, 96, 83);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (78, 'Kids Yoga', 62, 93, 67);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (79, 'Postnatal Yoga', 67, 68, 53);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (80, 'Kids Yoga', 40, 54, 49);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (81, 'Dance Aerobics', 55, 119, 94);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (82, 'Boot Camp', 33, 44, 113);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (83, 'Zumba Dance', 58, 97, 78);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (84, 'Sports Nutrition', 8, 53, 109);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (85, 'Trail Running', 48, 74, 87);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (86, 'Dance Aerobics', 7, 71, 103);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (87, 'CrossFit Intro', 10, 43, 51);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (88, 'Flexibility Training', 22, 66, 95);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (89, 'Cardio Blast', 58, 104, 84);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (90, 'Senior Fitness', 22, 29, 45);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (91, 'Mindfulness Meditation', 61, 84, 70);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (92, 'Aerobics', 31, 64, 46);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (93, 'Postnatal Yoga', 20, 80, 101);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (94, 'Postnatal Yoga', 32, 63, 40);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (95, 'CrossFit Intro', 7, 60, 54);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (96, 'Aerobics', 19, 40, 57);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (97, 'Obstacle Course Training', 64, 84, 34);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (98, 'Kids Yoga', 2, 21, 84);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (99, 'Tai Chi', 27, 30, 73);
insert into GYM_CLASS (classid, classname, minage, maxage, duration)
values (100, 'Teen Fitness', 62, 94, 50);
commit;
prompt 100 records loaded
prompt Loading GYM_CLASS_MEDICAL_CONSTRAINS...
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe pancreatitis"', 1);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe pancreatitis"', 6);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe pancreatitis"', 19);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe pancreatitis"', 27);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe pancreatitis"', 42);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe pancreatitis"', 79);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe personality disorders"', 16);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe personality disorders"', 26);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe personality disorders"', 40);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe personality disorders"', 51);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe personality disorders"', 82);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe plantar fasciitis"', 19);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe plantar fasciitis"', 26);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe plantar fasciitis"', 30);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe plantar fasciitis"', 32);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe plantar fasciitis"', 33);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe plantar fasciitis"', 64);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe polyneuropathy"', 11);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe polyneuropathy"', 29);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe polyneuropathy"', 58);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe polyneuropathy"', 65);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe polyneuropathy"', 100);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe psoriasis arthritis"', 10);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe psoriasis arthritis"', 13);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe psoriasis arthritis"', 15);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe psoriasis arthritis"', 19);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe psoriasis arthritis"', 32);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe psoriasis arthritis"', 50);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe psoriasis arthritis"', 51);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe rheumatoid arthritis"', 5);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe rheumatoid arthritis"', 38);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe rheumatoid arthritis"', 62);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe rheumatoid arthritis"', 66);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe rheumatoid arthritis"', 82);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe rheumatoid arthritis"', 86);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe schizophrenia"', 25);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe schizophrenia"', 32);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe schizophrenia"', 37);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe schizophrenia"', 59);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe schizophrenia"', 75);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe schizophrenia"', 80);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe sinusitis"', 70);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe sinusitis"', 72);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe sinusitis"', 75);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe sinusitis"', 76);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe sinusitis"', 78);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe sinusitis"', 97);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe skin infections"', 28);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe skin infections"', 30);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe skin infections"', 52);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe skin infections"', 62);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe skin infections"', 70);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe skin infections"', 71);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe skin infections"', 85);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe skin infections"', 100);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe sleep apnea"', 6);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe sleep apnea"', 16);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe sleep apnea"', 32);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe sleep apnea"', 56);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe varicose veins"', 5);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe varicose veins"', 15);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe varicose veins"', 32);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe varicose veins"', 65);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe varicose veins"', 68);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vertigo"', 45);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vertigo"', 83);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vestibular disorders"', 14);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vestibular disorders"', 38);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vestibular disorders"', 41);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vestibular disorders"', 49);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vestibular disorders"', 51);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vestibular disorders"', 60);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vestibular disorders"', 74);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vision impairment"', 25);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vision impairment"', 77);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe vision impairment"', 87);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Spinal stenosis"', 32);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Spinal stenosis"', 55);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Tendonitis"', 23);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Tendonitis"', 25);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Tendonitis"', 28);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Tendonitis"', 55);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Tendonitis"', 64);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Tendonitis"', 70);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Tendonitis"', 82);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Tendonitis"', 92);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Ulcerative colitis (flare-ups)"', 17);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Ulcerative colitis (flare-ups)"', 35);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Ulcerative colitis (flare-ups)"', 37);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Ulcerative colitis (flare-ups)"', 77);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Ulcerative colitis (flare-ups)"', 90);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Uncontrolled epilepsy"', 1);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Uncontrolled epilepsy"', 14);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Uncontrolled epilepsy"', 17);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Uncontrolled epilepsy"', 55);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Uncontrolled epilepsy"', 78);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Uncontrolled epilepsy"', 79);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Uncontrolled epilepsy"', 80);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Uncontrolled epilepsy"', 90);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Uncontrolled epilepsy"', 96);
commit;
prompt 100 records committed...
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Uncontrolled epilepsy"', 100);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('High blood pressure', 24);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('High blood pressure', 27);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('High blood pressure', 34);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('High blood pressure', 60);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Alzheimer''s disease"', 71);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Alzheimer''s disease"', 83);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Angina"', 18);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Angina"', 46);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Angina"', 66);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Autism spectrum disorder (with severe sensory iss', 19);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Autism spectrum disorder (with severe sensory iss', 92);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Carpal tunnel syndrome"', 13);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Carpal tunnel syndrome"', 45);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Carpal tunnel syndrome"', 58);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Carpal tunnel syndrome"', 99);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Chronic obstructive pulmonary disease (COPD)"', 77);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Chronic obstructive pulmonary disease (COPD)"', 99);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Congenital heart defects"', 67);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Congenital heart defects"', 87);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Congenital heart defects"', 95);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Congestive heart failure"', 2);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Congestive heart failure"', 29);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Congestive heart failure"', 61);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Congestive heart failure"', 72);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Crohn''s disease (flare-ups)"', 16);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Crohn''s disease (flare-ups)"', 22);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Crohn''s disease (flare-ups)"', 55);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Crohn''s disease (flare-ups)"', 82);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Deep vein thrombosis"', 58);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Deep vein thrombosis"', 59);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Deep vein thrombosis"', 65);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Deep vein thrombosis"', 75);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Dementia"', 1);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Dementia"', 26);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Dementia"', 41);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Dementia"', 70);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Dementia"', 80);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Diabetes (uncontrolled)"', 23);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Diabetes (uncontrolled)"', 64);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Epilepsy"', 11);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Epilepsy"', 28);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Epilepsy"', 71);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Fibromyalgia (severe)"', 26);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Fibromyalgia (severe)"', 48);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Fibromyalgia (severe)"', 52);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Fibromyalgia (severe)"', 67);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Fibromyalgia (severe)"', 74);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Fibromyalgia (severe)"', 86);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Fibromyalgia (severe)"', 87);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Heart disease"', 23);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Heart disease"', 30);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Heart disease"', 38);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Heart disease"', 39);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Heart disease"', 77);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hemophilia"', 2);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hemophilia"', 31);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hemophilia"', 46);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hemophilia"', 54);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hemophilia"', 55);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hemophilia"', 64);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hemophilia"', 88);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hemophilia"', 96);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hemophilia"', 100);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Herniated disc"', 7);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Herniated disc"', 33);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Herniated disc"', 52);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypermobile joints"', 2);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypermobile joints"', 9);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypermobile joints"', 24);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypermobile joints"', 53);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hyperthyroidism"', 4);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hyperthyroidism"', 12);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hyperthyroidism"', 18);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hyperthyroidism"', 35);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hyperthyroidism"', 38);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hyperthyroidism"', 60);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hyperthyroidism"', 68);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hyperthyroidism"', 85);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypothyroidism"', 2);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypothyroidism"', 21);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypothyroidism"', 39);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypothyroidism"', 49);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypothyroidism"', 61);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypothyroidism"', 66);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypothyroidism"', 69);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Hypothyroidism"', 85);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Kidney failure"', 5);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Kidney failure"', 19);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Kidney failure"', 49);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Kidney failure"', 54);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Kidney failure"', 73);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Kidney failure"', 87);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Liver disease"', 1);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Liver disease"', 3);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Liver disease"', 19);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Liver disease"', 59);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Lupus"', 1);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Lupus"', 25);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Lupus"', 48);
commit;
prompt 200 records committed...
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Lupus"', 70);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Lupus"', 91);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Lupus"', 94);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Lupus"', 98);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Marfan syndrome"', 8);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Marfan syndrome"', 24);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Marfan syndrome"', 50);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Marfan syndrome"', 72);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Multiple sclerosis"', 5);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Multiple sclerosis"', 6);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Multiple sclerosis"', 11);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Multiple sclerosis"', 89);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Multiple sclerosis"', 98);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Obesity (morbid)"', 33);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Obesity (morbid)"', 41);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Obesity (morbid)"', 73);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Obesity (morbid)"', 86);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Obesity (morbid)"', 96);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Osteoporosis"', 13);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Osteoporosis"', 16);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Osteoporosis"', 37);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Osteoporosis"', 60);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Osteoporosis"', 92);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Osteoporosis"', 95);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Parkinson''s disease"', 4);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Parkinson''s disease"', 5);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Parkinson''s disease"', 21);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Parkinson''s disease"', 45);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Parkinson''s disease"', 71);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Parkinson''s disease"', 91);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Parkinson''s disease"', 100);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Polycystic ovary syndrome (PCOS) with severe symp', 47);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Polycystic ovary syndrome (PCOS) with severe symp', 76);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Pregnancy"', 17);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Pregnancy"', 36);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Pregnancy"', 49);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Pregnancy"', 65);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Pregnancy"', 83);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Psoriasis (severe)"', 1);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Psoriasis (severe)"', 48);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Psoriasis (severe)"', 91);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Pulmonary embolism"', 34);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Pulmonary embolism"', 80);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Pulmonary embolism"', 90);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Pulmonary embolism"', 98);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe eczema"', 20);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe eczema"', 31);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe eczema"', 32);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe eczema"', 81);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe eczema"', 87);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe endometriosis"', 19);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe endometriosis"', 27);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe endometriosis"', 30);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe endometriosis"', 43);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe endometriosis"', 45);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe endometriosis"', 60);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe endometriosis"', 76);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe endometriosis"', 79);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe environmental allergies"', 7);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe environmental allergies"', 30);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe environmental allergies"', 38);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe environmental allergies"', 58);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe environmental allergies"', 80);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe environmental allergies"', 90);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe food allergies"', 9);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe food allergies"', 18);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe food allergies"', 27);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe food allergies"', 38);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe food allergies"', 69);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe food allergies"', 90);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe food allergies"', 91);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe gallbladder disease"', 5);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe gallbladder disease"', 13);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe gallbladder disease"', 26);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe gallbladder disease"', 41);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe gallbladder disease"', 51);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe gallbladder disease"', 57);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe gallbladder disease"', 79);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe gallbladder disease"', 93);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hearing impairment"', 28);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hearing impairment"', 42);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hearing impairment"', 46);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hepatitis"', 50);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hyperglycemia"', 11);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hyperglycemia"', 47);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hyperglycemia"', 50);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hyperglycemia"', 52);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hyperglycemia"', 83);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hyperhidrosis"', 25);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hyperhidrosis"', 57);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hyperhidrosis"', 71);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hyperhidrosis"', 98);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hypoglycemia"', 9);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hypoglycemia"', 13);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hypoglycemia"', 21);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hypoglycemia"', 37);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hypoglycemia"', 43);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hypoglycemia"', 61);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hypoglycemia"', 63);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe hypoglycemia"', 67);
commit;
prompt 300 records committed...
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe immune disorders"', 8);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe immune disorders"', 76);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe immune disorders"', 99);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe joint pain"', 5);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe joint pain"', 45);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe joint pain"', 46);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe joint pain"', 55);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe joint pain"', 73);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lupus nephritis"', 38);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lupus nephritis"', 43);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lupus nephritis"', 45);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lupus nephritis"', 67);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lupus nephritis"', 77);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lupus nephritis"', 86);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lymphatic disorders"', 4);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lymphatic disorders"', 17);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lymphatic disorders"', 31);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lymphatic disorders"', 44);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lymphatic disorders"', 58);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lymphatic disorders"', 64);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe lymphatic disorders"', 91);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe metabolic syndrome"', 9);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe metabolic syndrome"', 26);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe metabolic syndrome"', 70);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe migraine"', 35);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe migraine"', 76);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe migraine"', 78);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe migraine"', 97);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe muscle spasms"', 15);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe muscle spasms"', 46);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe muscle spasms"', 54);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe muscle spasms"', 80);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe muscle spasms"', 100);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe musculoskeletal disorders"', 25);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe musculoskeletal disorders"', 35);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe musculoskeletal disorders"', 86);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe musculoskeletal disorders"', 87);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe myopathy"', 6);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe myopathy"', 15);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe myopathy"', 23);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe myopathy"', 28);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe myopathy"', 30);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe myopathy"', 68);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe myopathy"', 75);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe myopathy"', 79);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe myopathy"', 81);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe neuropathy"', 90);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe neuropathy"', 98);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe otitis media"', 8);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe otitis media"', 25);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe otitis media"', 32);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe otitis media"', 33);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe otitis media"', 37);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe otitis media"', 65);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe otitis media"', 73);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe otitis media"', 74);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Recent stroke"', 5);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Recent stroke"', 6);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Recent stroke"', 18);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Recent stroke"', 30);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Recent stroke"', 40);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Recent stroke"', 73);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Recent stroke"', 76);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Recent stroke"', 91);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Recent surgery"', 40);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Recent surgery"', 71);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Recent surgery"', 79);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Rotator cuff injury"', 18);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Rotator cuff injury"', 33);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Rotator cuff injury"', 56);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Rotator cuff injury"', 60);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Rotator cuff injury"', 99);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Scoliosis (severe)"', 26);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Scoliosis (severe)"', 76);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Scoliosis (severe)"', 86);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Scoliosis (severe)"', 99);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe ADHD"', 42);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe ADHD"', 59);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe GERD"', 1);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe GERD"', 2);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe GERD"', 37);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe GERD"', 53);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe GERD"', 83);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe IBS"', 3);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe IBS"', 9);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe IBS"', 18);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe IBS"', 23);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe IBS"', 71);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe IBS"', 89);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe OCD"', 5);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe OCD"', 12);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe OCD"', 49);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe PTSD"', 15);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe PTSD"', 18);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe PTSD"', 33);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe PTSD"', 42);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe PTSD"', 57);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe PTSD"', 100);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe Raynaud''s disease"', 21);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe Raynaud''s disease"', 32);
commit;
prompt 400 records committed...
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe Raynaud''s disease"', 33);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe Raynaud''s disease"', 40);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe Raynaud''s disease"', 50);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe Raynaud''s disease"', 99);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe Sjogren''s syndrome"', 17);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe Sjogren''s syndrome"', 28);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe Sjogren''s syndrome"', 39);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe Sjogren''s syndrome"', 56);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe allergic reactions"', 5);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe allergic reactions"', 23);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe allergic reactions"', 42);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe allergic reactions"', 50);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe allergic reactions"', 55);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe allergic reactions"', 76);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe allergic reactions"', 83);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe allergic reactions"', 88);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe allergic reactions"', 90);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe anemia"', 20);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe anemia"', 82);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe anxiety"', 44);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe anxiety"', 46);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe anxiety"', 86);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe anxiety"', 95);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe arthritis"', 54);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe arthritis"', 97);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe asthma"', 19);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe asthma"', 23);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe asthma"', 24);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe asthma"', 29);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe asthma"', 34);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe asthma"', 48);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe asthma"', 49);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe asthma"', 57);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe asthma"', 82);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe asthma"', 84);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe back pain"', 18);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe back pain"', 49);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe back pain"', 61);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe back pain"', 74);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe balance disorders"', 11);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe balance disorders"', 13);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe balance disorders"', 33);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe balance disorders"', 52);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe balance disorders"', 79);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe bipolar disorder"', 8);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe bipolar disorder"', 14);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe bipolar disorder"', 19);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe bipolar disorder"', 50);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe bipolar disorder"', 56);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe bipolar disorder"', 78);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe bipolar disorder"', 83);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe bipolar disorder"', 84);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe blood disorders"', 15);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe blood disorders"', 31);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe blood disorders"', 52);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe blood disorders"', 77);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe blood disorders"', 100);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe bronchitis"', 78);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cellulitis"', 14);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cellulitis"', 16);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cellulitis"', 85);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe chronic fatigue syndrome"', 52);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe chronic fatigue syndrome"', 72);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe chronic kidney disease"', 2);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe chronic kidney disease"', 20);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe chronic kidney disease"', 42);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe chronic kidney disease"', 55);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe chronic kidney disease"', 92);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cirrhosis"', 41);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cirrhosis"', 55);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cirrhosis"', 60);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cirrhosis"', 64);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cirrhosis"', 76);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cirrhosis"', 83);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cirrhosis"', 99);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cognitive impairment"', 1);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cognitive impairment"', 49);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cognitive impairment"', 55);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cognitive impairment"', 69);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe cognitive impairment"', 83);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe depression"', 12);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe depression"', 30);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe depression"', 35);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe depression"', 45);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe depression"', 57);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe depression"', 96);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe developmental disorders"', 2);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe developmental disorders"', 23);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe developmental disorders"', 48);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe developmental disorders"', 52);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe developmental disorders"', 80);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe developmental disorders"', 85);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe developmental disorders"', 91);
insert into GYM_CLASS_MEDICAL_CONSTRAINS (medical_constrains, classid)
values ('"Severe developmental disorders"', 92);
commit;
prompt 494 records loaded
prompt Loading PERSON...
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (69755509, to_date('14-02-1982', 'dd-mm-yyyy'), 'Martin', 'Franks', 'Annandale', '"haadmor migur"', 29, 'martinf@invisioncom.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (91060231, to_date('18-05-1902', 'dd-mm-yyyy'), 'Natascha', 'Aykroyd', 'Zuerich', '"eliyahu hanavi"', 38, 'nataschaa@profitline.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (52154939, to_date('18-11-1973', 'dd-mm-yyyy'), 'Mac', 'Johansson', 'Udine', '"haadmormis spinka"', 7, 'mac.johansson@signature.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (35548775, to_date('09-01-1971', 'dd-mm-yyyy'), 'Curt', 'Mirren', 'Vilafranca Penedes', '"bar kokhba"', 121, 'curt.mirren@harrison.es', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (70595940, to_date('21-05-2020', 'dd-mm-yyyy'), 'Josh', 'Roundtree', 'Utsunomiya', '"greenberg"', 79, 'josh@procurementcentre.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54985818, to_date('19-08-1993', 'dd-mm-yyyy'), 'Daniel', 'Haggard', 'Hartmannsdorf', '"admorei alexander"', 106, 'daniel.haggard@httprint.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (86272100, to_date('20-01-1928', 'dd-mm-yyyy'), 'Azucar', 'Robinson', 'Duluth', '"gnishovski"', 15, 'arobinson@dbprofessionals.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81005094, to_date('08-04-1921', 'dd-mm-yyyy'), 'Fred', 'Lennix', 'Cape town', '"beit horon"', 81, 'fred.lennix@aoe.za', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (40293735, to_date('06-03-1968', 'dd-mm-yyyy'), 'Natalie', 'Sampson', 'Cerritos', '"dakar"', 90, 'natalie.s@reckittbenckiser.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (6292018, to_date('30-04-1945', 'dd-mm-yyyy'), 'Victoria', 'Sellers', 'Juazeiro', '"bar kokhba"', 58, 'victoria.sellers@fns.br', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (9077728, to_date('02-06-1916', 'dd-mm-yyyy'), 'Embeth', 'Houston', 'Santa Clarat', '"eshel abraham"', 102, 'embeth.houston@safeway.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (69270812, to_date('10-01-1905', 'dd-mm-yyyy'), 'Elizabeth', 'Newton', 'Gdansk', '"haadmon minadvorna"', 114, 'e.newton@speakeasy.pl', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (35042992, to_date('21-08-1954', 'dd-mm-yyyy'), 'Jude', 'Pollack', 'Key Biscayne', '"ben gurion"', 32, 'jude.pollack@monarchcasino.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (4027718, to_date('02-08-1918', 'dd-mm-yyyy'), 'Dianne', 'Satriani', 'Douala', '"beit yosef"', 81, 'dsatriani@keith.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (6484710, to_date('24-02-1931', 'dd-mm-yyyy'), 'Maceo', 'Loggia', 'Sidney', '"amos"', 28, 'maceo.l@younginnovations.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (60776603, to_date('04-08-2021', 'dd-mm-yyyy'), 'Rob', 'Mahood', 'Belmont', 'abarbanel', 132, 'rob.mahood@manhattanassociates.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (67481341, to_date('23-11-1946', 'dd-mm-yyyy'), 'Adrien', 'Parish', 'Timonium', '"eshel abraham"', 23, 'adrien.parish@employerservices.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23114002, to_date('15-05-1928', 'dd-mm-yyyy'), 'Davey', 'Humphrey', 'Oklahoma city', '"haarmor miradzymin"', 37, 'davey@commworks.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (10481000, to_date('11-03-1965', 'dd-mm-yyyy'), 'Gwyneth', 'Lorenz', 'Billerica', '"aviad"', 9, 'g.lorenz@unilever.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (8796425, to_date('20-01-1979', 'dd-mm-yyyy'), 'Maura', 'Aaron', 'San Ramon', '"david pinkas"', 88, 'maura@streetglow.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (31471077, to_date('17-02-1968', 'dd-mm-yyyy'), 'Franz', 'Robbins', 'New Fairfield', '"givat pinhas"', 113, 'franz.robbins@abs.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22819264, to_date('11-10-1928', 'dd-mm-yyyy'), 'Tony', 'Clark', 'Valladolid', '"ahiya hashiloni"', 138, 'tonyc@grt.es', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (58647622, to_date('30-04-1980', 'dd-mm-yyyy'), 'Selma', 'Mellencamp', 'Redwood Shores', '"derekh sheshet hayamim"', 123, 'selma.mellencamp@wci.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23386909, to_date('10-04-1988', 'dd-mm-yyyy'), 'Sally', 'Teng', 'S. Bernardo do Campo', '"elkabetz"', 12, 'sally.teng@talx.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (29291564, to_date('15-06-1960', 'dd-mm-yyyy'), 'Bebe', 'Conroy', 'Horsham', '"habarzel"', 9, 'bebe@wav.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (67461875, to_date('17-09-1994', 'dd-mm-yyyy'), 'William', 'Lennix', 'Cypress', '"amiel"', 58, 'william.lennix@staffforce.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (28089404, to_date('06-01-2005', 'dd-mm-yyyy'), 'Alana', 'Coverdale', 'Maarssen', '"haarmor miradzymin"', 15, 'alana.coverdale@adeasolutions.nl', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (77623385, to_date('27-06-1920', 'dd-mm-yyyy'), 'Pat', 'Klein', 'Sacramento', '"ben azay"', 142, 'patk@scjohnson.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (68928002, to_date('02-09-1961', 'dd-mm-yyyy'), 'Alana', 'Baker', 'Karachi', '"alkalai"', 58, 'alana.b@fab.pk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (44597009, to_date('21-04-1902', 'dd-mm-yyyy'), 'Geena', 'Danger', 'Dallas', '"beit shammai"', 114, 'g.danger@solipsys.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (65058862, to_date('09-05-1924', 'dd-mm-yyyy'), 'Daryle', 'Thornton', 'Leimen', '"amiel"', 25, 'daryle.thornton@quicksilverresources.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (50968404, to_date('07-02-1936', 'dd-mm-yyyy'), 'Samantha', 'Woods', 'Lake Bluff', '"dakar"', 127, 'samanthaw@dynacqinternational.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (70178481, to_date('05-01-1931', 'dd-mm-yyyy'), 'Rosanna', 'Osbourne', 'Exeter', '"gerstenkorn"', 133, 'rosanna.osbourne@glacierbancorp.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (77425508, to_date('06-01-2015', 'dd-mm-yyyy'), 'Marty', 'Koteas', 'Livermore', '"givat pinhas"', 82, 'marty.koteas@parksite.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (37865911, to_date('19-06-1939', 'dd-mm-yyyy'), 'Kirsten', 'Lorenz', 'Sydney', '"haadmor mikotsk"', 38, 'kirsten.lorenz@socketinternet.au', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (44824683, to_date('29-06-1997', 'dd-mm-yyyy'), 'Mena', 'Brooke', 'South Weber', '"dr. broyer"', 43, 'mena.brooke@grt.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30884206, to_date('07-05-1959', 'dd-mm-yyyy'), 'Rhys', 'Edmunds', 'Harsum', '"beeri"', 59, 'rhys.edmunds@oneidafinancial.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (63595783, to_date('05-06-1906', 'dd-mm-yyyy'), 'Simon', 'Donovan', 'Lakewood', '"abu hatseira"', 89, 'simon@pearllawgroup.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (11221464, to_date('16-05-2012', 'dd-mm-yyyy'), 'Etta', 'Carmen', 'Wehrheim', '"dov hoz"', 36, 'etta.carmen@ssi.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (99988900, to_date('29-03-1922', 'dd-mm-yyyy'), 'Joaquim', 'Winger', 'Rosario', '"ami"', 111, 'joaquim.w@ccb.ar', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (93114433, to_date('05-06-1950', 'dd-mm-yyyy'), 'Cloris', 'Schneider', 'Dallas', '"amiel"', 103, 'cloris.schneider@ogi.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (40091598, to_date('12-03-1950', 'dd-mm-yyyy'), 'Ned', 'Lillard', 'Chur', '"amos"', 107, 'n.lillard@epiqsystems.ch', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (45412385, to_date('20-11-1966', 'dd-mm-yyyy'), 'Moe', 'Frost', 'Alessandria', '"donnolo"', 5, 'm.frost@nuinfosystems.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (6628587, to_date('29-10-2022', 'dd-mm-yyyy'), 'Selma', 'Hagar', 'Mount Olive', '"gordon"', 87, 'selma.hagar@servicelink.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (85383287, to_date('11-09-1933', 'dd-mm-yyyy'), 'Frances', 'Sinatra', 'Stoneham', '"ben ptachia"', 48, 'frances.s@catamount.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81325843, to_date('05-04-2017', 'dd-mm-yyyy'), 'Gailard', 'Negbaur', 'Birmingham', '"dov gruner"', 33, 'gailard.negbaur@pinnaclestaffing.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (21317536, to_date('28-05-2017', 'dd-mm-yyyy'), 'Taylor', 'Heslov', 'Mississauga', '"dr. broyer"', 128, 'taylor.heslov@biosite.ca', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (7488761, to_date('02-05-1990', 'dd-mm-yyyy'), 'Dianne', 'Osmond', 'Lake worth', '"eshel abraham"', 143, 'dosmond@eagleone.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (11451089, to_date('03-08-1909', 'dd-mm-yyyy'), 'Campbell', 'Cusack', 'Vilnius', '"aluf simchoni"', 66, 'campbell.cusack@shirtfactory.lt', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (73917560, to_date('16-09-1955', 'dd-mm-yyyy'), 'Denny', 'Kidman', 'Berkshire', '"golomb"', 125, 'denny.kidman@tracertechnologies.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (4370439, to_date('06-08-1987', 'dd-mm-yyyy'), 'Al', 'Ferrell', 'South Jordan', '"bar kokhba"', 88, 'al.ferrell@bps.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (5654694, to_date('29-02-1992', 'dd-mm-yyyy'), 'Taryn', 'Martin', 'Toledo', '"david pinkas"', 45, 'taryn.martin@marathonheater.es', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30062117, to_date('20-10-2022', 'dd-mm-yyyy'), 'Davis', 'Holm', 'Cesena', '"borochov"', 127, 'davis.holm@hfn.it', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (67015963, to_date('16-02-2012', 'dd-mm-yyyy'), 'Seann', 'Beckham', 'Jakarta', '"haadmor mibelz"', 42, 'seannb@cis.id', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (89122501, to_date('21-10-1956', 'dd-mm-yyyy'), 'Sophie', 'Banderas', 'Brussel', '"habarzel"', 2, 'sophie.banderas@lemproducts.be', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (90289319, to_date('26-03-1995', 'dd-mm-yyyy'), 'Jimmie', 'McGill', 'Dardilly', '"dov hoz"', 139, 'j.mcgill@gsat.fr', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (51948030, to_date('21-11-2018', 'dd-mm-yyyy'), 'Ron', 'Carlton', 'Sainte-foy', '"baal hatanya"', 133, 'ron.carlton@valleyoaksystems.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (33147678, to_date('10-02-1951', 'dd-mm-yyyy'), 'Sheryl', 'Butler', 'Eschen', '"baruch hirsch"', 107, 'sheryl@safehomesecurity.li', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (28260775, to_date('26-07-1998', 'dd-mm-yyyy'), 'Grace', 'Crudup', 'Olsztyn', '"haadmor miznaz"', 62, 'gracec@calence.pl', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (14725165, to_date('01-09-1944', 'dd-mm-yyyy'), 'Junior', 'Imperioli', 'Fairfax', '"aharon dov"', 4, 'junior.imperioli@mms.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (25539146, to_date('29-01-1992', 'dd-mm-yyyy'), 'Allan', 'Sharp', 'Oldenburg', '"aluf simchoni"', 101, 'allan.sharp@kramontrealty.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30463411, to_date('12-06-2022', 'dd-mm-yyyy'), 'Ernest', 'Tucci', 'Parma', '"chida"', 2, 'etucci@dvdt.it', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (50885464, to_date('01-05-1972', 'dd-mm-yyyy'), 'Rick', 'Thurman', 'Lefkosa', '"aluf simchoni"', 125, 'r.thurman@smi.tr', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (37921065, to_date('14-07-2012', 'dd-mm-yyyy'), 'Remy', 'Balin', 'Zafferana Etnea', '"federman"', 50, 'r.balin@bestever.it', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (99434739, to_date('07-04-1934', 'dd-mm-yyyy'), 'Rod', 'Crow', 'Linz', '"elkabetz"', 57, 'rod.crow@hiltonhotels.at', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (15600946, to_date('07-06-1991', 'dd-mm-yyyy'), 'Meryl', 'Rickman', 'Bellerose', '"elisha"', 103, 'meryl.rickman@pepsico.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (24290738, to_date('25-07-1939', 'dd-mm-yyyy'), 'Busta', 'Slater', 'Bielefeld', '"giborei israel"', 139, 'bslater@flavorx.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23890659, to_date('17-08-1999', 'dd-mm-yyyy'), 'Mos', 'Close', 'Buffalo', '"avodat israel"', 84, 'mos@qls.ca', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (39997409, to_date('22-11-1922', 'dd-mm-yyyy'), 'Lindsey', 'Diffie', 'Reno', '"habanim"', 68, 'lindseyd@gltg.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (29658657, to_date('04-03-1966', 'dd-mm-yyyy'), 'Larry', 'Coward', 'Santana do parna?ba', 'abarbanel', 28, 'larry@elite.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (83376974, to_date('20-06-1989', 'dd-mm-yyyy'), 'Phoebe', 'Salt', 'Tyne & Wear', '"beit yosef"', 52, 'p.salt@dataprise.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (41518918, to_date('24-04-1938', 'dd-mm-yyyy'), 'Ramsey', 'Simpson', 'Rio de janeiro', '"anilevich"', 112, 'ramseys@greene.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (39725987, to_date('25-11-1911', 'dd-mm-yyyy'), 'Albertina', 'Sandler', 'Murray', '"bin-nun"', 15, 'albertina@wrgservices.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (91089992, to_date('20-07-1910', 'dd-mm-yyyy'), 'Tobey', 'Dushku', 'Kanazawa', '"em hamoshavot"', 16, 'tobey.dushku@serentec.jp', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (96511274, to_date('16-01-1912', 'dd-mm-yyyy'), 'Gord', 'Popper', 'Giessen', '"david hamelekh"', 127, 'gord.popper@caliber.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (51397792, to_date('08-06-1981', 'dd-mm-yyyy'), 'Mili', 'Shawn', 'Sao paulo', '"haahim meir"', 136, 'mili@dbprofessionals.br', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (91349986, to_date('14-05-1909', 'dd-mm-yyyy'), 'Mira', 'Marshall', 'Sugar Land', '"bet hilel"', 49, 'mira.marshall@wyeth.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (52313162, to_date('16-05-1953', 'dd-mm-yyyy'), 'Christmas', 'Vinton', 'Rocklin', '"abba hillel silver"', 109, 'c.vinton@baesch.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22682672, to_date('17-03-1936', 'dd-mm-yyyy'), 'Manu', 'Beals', 'Stuttgart', '"don yoseph nasi"', 56, 'manu.beals@portageenvironmental.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (55125627, to_date('27-09-1951', 'dd-mm-yyyy'), 'Kitty', 'Llewelyn', 'Valladolid', '"admorei alexander"', 65, 'kitty@grayhawksystems.es', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (88649232, to_date('27-01-2018', 'dd-mm-yyyy'), 'Harry', 'Phillippe', 'Englewood', '"chida"', 129, 'harry.phillippe@lms.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (43049144, to_date('08-09-1920', 'dd-mm-yyyy'), 'Wade', 'Jay', 'Milano', '"aluf simchoni"', 122, 'wade.jay@vitacostcom.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (88239853, to_date('09-10-1962', 'dd-mm-yyyy'), 'Lou', 'Bosco', 'Coimbra', '"haadmon minadvorna"', 26, 'lou.bosco@talx.pt', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (49908274, to_date('08-05-1975', 'dd-mm-yyyy'), 'Bridget', 'Pitney', 'Visselh?vede', '"beer mayim hayim"', 134, 'b.pitney@ads.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (96970243, to_date('19-12-1999', 'dd-mm-yyyy'), 'Joaquin', 'Goodall', 'St. Louis', '"bin-nun"', 137, 'joaquin@servicesource.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81654249, to_date('31-01-1953', 'dd-mm-yyyy'), 'Dar', 'Popper', 'Fuerth', '"ezra"', 54, 'dar.popper@fds.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (13611451, to_date('17-03-1970', 'dd-mm-yyyy'), 'Mika', 'Lonsdale', 'Juneau', '"gotlieb"', 121, 'mika@kimberlyclark.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (65545343, to_date('08-02-1910', 'dd-mm-yyyy'), 'Hal', 'Makowicz', 'Edwardstown', '"etzel"', 13, 'hal.makowicz@nha.au', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23491578, to_date('12-06-2022', 'dd-mm-yyyy'), 'Carrie', 'Sizemore', 'Staten Island', '"baal hatanya"', 132, 'carries@pds.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (31874543, to_date('18-07-1917', 'dd-mm-yyyy'), 'Melba', 'Gallagher', 'Anchorage', '"greenberg"', 105, 'melba.gallagher@bradleypharmaceuticals.c', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (63322252, to_date('19-05-1997', 'dd-mm-yyyy'), 'Rhona', 'Squier', 'New York City', '"haadmor mibelz"', 61, 'r.squier@businessplus.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (19540472, to_date('26-05-1957', 'dd-mm-yyyy'), 'Leonardo', 'Mattea', 'Udine', '"haahim meir"', 81, 'leonardom@usdairyproducers.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (28429527, to_date('16-09-2019', 'dd-mm-yyyy'), 'Alana', 'Linney', 'Swannanoa', '"bet hilel"', 22, 'alana@ptg.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (31033551, to_date('13-01-1917', 'dd-mm-yyyy'), 'Sammy', 'Shue', 'Englewood Cliffs', '"ben arieh"', 31, 's.shue@sensortechnologies.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (4478557, to_date('03-06-1952', 'dd-mm-yyyy'), 'Celia', 'Bates', 'Koppl', '"elkabetz"', 39, 'cbates@solutionbuilders.at', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (99504749, to_date('07-03-1944', 'dd-mm-yyyy'), 'Graham', 'Rizzo', 'Toronto', '"haahim meir"', 139, 'graham.rizzo@aoe.ca', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (16423003, to_date('11-12-2000', 'dd-mm-yyyy'), 'Jann', 'Patillo', 'West Windsor', '"habayit"', 100, 'jann.patillo@smartronix.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (59194360, to_date('28-03-1956', 'dd-mm-yyyy'), 'Mili', 'Quinn', 'Loveland', '"admorei alexander"', 23, 'm.quinn@datawarehouse.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (64964720, to_date('12-06-1999', 'dd-mm-yyyy'), 'Maureen', 'Hawthorne', 'Bloemfontein', '"eshel abraham"', 37, 'maureen.h@bioreliance.za', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (5179001, to_date('01-01-1951', 'dd-mm-yyyy'), 'Manu', 'McGriff', 'Charleston', '"ben gurion"', 86, 'manu.mcgriff@airmethods.com', 'M');
commit;
prompt 100 records committed...
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (97024381, to_date('14-09-2003', 'dd-mm-yyyy'), 'Jody', 'Page', 'Kungki', '"baal hatanya"', 1, 'j.page@cyberthink.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (74544599, to_date('01-02-1959', 'dd-mm-yyyy'), 'Tal', 'Stigers', 'Coppell', '"aluf hanizachon"', 25, 'tal.stigers@bis.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (57023301, to_date('11-08-1998', 'dd-mm-yyyy'), 'Elle', 'Bradford', 'Sainte-foy', '"dakar"', 141, 'elle.b@ataservices.ca', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (15582812, to_date('19-01-1910', 'dd-mm-yyyy'), 'Adrien', 'Rodgers', 'Louisville', '"beer mayim hayim"', 52, 'adrien.rodgers@americanland.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54467502, to_date('14-08-1928', 'dd-mm-yyyy'), 'Victoria', 'Cole', 'New Hyde Park', '"giborei israel"', 7, 'victoria.cole@max.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (9972798, to_date('08-12-1959', 'dd-mm-yyyy'), 'Scott', 'Collette', 'Enfield', '"bet hilel"', 43, 'scottc@digitalmotorworks.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (20992923, to_date('14-11-2016', 'dd-mm-yyyy'), 'Ellen', 'Cocker', 'Brookfield', '"baruch hirsch"', 119, 'e.cocker@americanhealthways.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (80557356, to_date('06-12-1907', 'dd-mm-yyyy'), 'Meg', 'Polito', 'Dublin', 'abarbanel', 88, 'm.polito@horizon.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (6293456, to_date('11-08-1933', 'dd-mm-yyyy'), 'Carlene', 'Marin', 'P?tion-ville', '"greenberg"', 48, 'carlene@sbc.ht', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (6252115, to_date('13-08-2000', 'dd-mm-yyyy'), 'Temuera', 'Diesel', 'Dardilly', '"dangoor"', 98, 'temuerad@mitsubishimotors.fr', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (70453025, to_date('24-02-1971', 'dd-mm-yyyy'), 'Leo', 'Kramer', 'Tempe', '"haadmor merojin"', 84, 'leok@nlx.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (17739277, to_date('18-01-2013', 'dd-mm-yyyy'), 'Rosanna', 'Sedgwick', 'Horsham', '"golomb"', 30, 'rosanna.sedgwick@capellaeducation.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (25310202, to_date('27-12-1996', 'dd-mm-yyyy'), 'Lance', 'Hershey', 'Sparrows Point', '"anilevich"', 101, 'lance@pfizer.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (85575839, to_date('18-04-1933', 'dd-mm-yyyy'), 'Marley', 'Garcia', 'Hearst', '"elkabetz"', 38, 'marley.garcia@arkidata.ca', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (68142753, to_date('11-07-2004', 'dd-mm-yyyy'), 'Desmond', 'Nielsen', 'Bronx', '"beeri"', 102, 'desmond.n@bestbuy.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (82565214, to_date('18-10-1971', 'dd-mm-yyyy'), 'Curtis', 'Allan', 'Birmensdorf', '"admorei alexander"', 108, 'callan@universalsolutions.ch', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (14376940, to_date('09-08-2010', 'dd-mm-yyyy'), 'Miguel', 'Aaron', 'Battle Creek', '"aluf hanizachon"', 92, 'miguel.aaron@innovativelighting.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (38831552, to_date('17-07-1960', 'dd-mm-yyyy'), 'Merle', 'Lewis', 'Luedenscheid', '"ahronson"', 79, 'merle@wellsfinancial.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (36349653, to_date('12-12-2006', 'dd-mm-yyyy'), 'Red', 'Assante', 'Winnipeg', '"bradnshtetter"', 86, 'red.assante@progressivemedical.ca', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79127574, to_date('09-02-1900', 'dd-mm-yyyy'), 'Jeffrey', 'Neil', 'Huntington Beach', '"binyamin avraham"', 102, 'jneil@hitechpharmacal.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (46861565, to_date('28-02-1947', 'dd-mm-yyyy'), 'Mos', 'Burrows', 'Guadalajara', '"avraham ben david"', 41, 'mos.b@cimalabs.mx', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (44619573, to_date('03-01-1951', 'dd-mm-yyyy'), 'Wendy', 'Callow', 'Bras?lia', '"aviad"', 28, 'wendy.c@invisioncom.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (35114555, to_date('09-07-1951', 'dd-mm-yyyy'), 'Lennie', 'Sawa', 'San Diego', '"avraham ben david"', 53, 'lennie@sourcegear.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (52729386, to_date('10-10-1995', 'dd-mm-yyyy'), 'Ritchie', 'Jovovich', 'Neustadt', '"avraham ben david"', 67, 'r.jovovich@grt.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (95620746, to_date('25-10-1963', 'dd-mm-yyyy'), 'Lindsay', 'Anderson', 'New Hope', '"dangoor"', 40, 'lindsay.anderson@activeservices.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (74712183, to_date('25-07-1931', 'dd-mm-yyyy'), 'Matt', 'Englund', 'Ciudad del Este', '"ezra"', 30, 'matt.e@wav.py', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (97695307, to_date('18-02-1991', 'dd-mm-yyyy'), 'First', 'Jackson', 'Rochester', '"david pinkas"', 13, 'f.jackson@naturescure.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (97687978, to_date('11-11-1916', 'dd-mm-yyyy'), 'Buffy', 'Beatty', 'Palma de Mallorca', '"ben gurion"', 120, 'buffy.beatty@onesourceprinting.es', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (62913995, to_date('14-03-1934', 'dd-mm-yyyy'), 'Donal', 'Henstridge', 'Sao paulo', '"haadmor migur"', 144, 'donal.henstridge@paisley.br', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (75966451, to_date('07-05-1956', 'dd-mm-yyyy'), 'Humberto', 'Rourke', 'Hamburg', '"anilevich"', 114, 'humberto.rourke@acsis.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (15164192, to_date('29-08-1948', 'dd-mm-yyyy'), 'Buffy', 'Dukakis', 'Pomona', '"gotlieb"', 10, 'buffy.d@dillards.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23555997, to_date('26-11-1909', 'dd-mm-yyyy'), 'Debra', 'Sandler', 'Essex', '"beit shammai"', 12, 'debra.sandler@aventis.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (2303105, to_date('21-06-1943', 'dd-mm-yyyy'), 'Jill', 'Vega', 'Karachi', '"don yoseph nasi"', 137, 'jillv@newviewgifts.pk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (3069327, to_date('03-01-1963', 'dd-mm-yyyy'), 'Dylan', 'Colon', 'Heubach', '"gotlieb"', 71, 'dcolon@actechnologies.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (21552259, to_date('29-09-1993', 'dd-mm-yyyy'), 'Gilberto', 'Squier', 'Lublin', '"federman"', 46, 'gilberto.squier@solutionbuilders.pl', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (29724492, to_date('18-07-1954', 'dd-mm-yyyy'), 'Bernie', 'Bates', 'Streamwood', '"abba hillel silver"', 26, 'bernie.bates@employerservices.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (72046835, to_date('16-01-2001', 'dd-mm-yyyy'), 'Alfred', 'Culkin', 'Gdansk', '"bradnshtetter"', 148, 'a.culkin@qestrel.pl', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (71616931, to_date('29-06-1980', 'dd-mm-yyyy'), 'Karen', 'Ifans', 'Manchester', '"haadmor mivishoy"', 125, 'karen.ifans@naturescure.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (25508039, to_date('25-12-1976', 'dd-mm-yyyy'), 'Robin', 'Amos', 'Ani?res', '"avraham ben david"', 76, 'ramos@mai.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (778023, to_date('13-10-1922', 'dd-mm-yyyy'), 'Kelly', 'Buscemi', 'Boucherville', '"amos"', 73, 'kelly.buscemi@worldcom.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (28746745, to_date('11-05-1982', 'dd-mm-yyyy'), 'Edgar', 'Richards', 'Mexico City', '"david hamelekh"', 38, 'edgar@capitalbank.mx', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (31630267, to_date('18-07-1941', 'dd-mm-yyyy'), 'Rhea', 'Numan', 'Santa rita sapuca?', '"bruriya"', 83, 'rhea.numan@gagwear.br', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (15550671, to_date('22-09-1980', 'dd-mm-yyyy'), 'Clive', 'Heche', 'Tokushima', '"haadmor merojin"', 111, 'clive.h@wrgservices.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (42688439, to_date('21-04-1988', 'dd-mm-yyyy'), 'Daniel', 'Quinones', 'Bischofshofen', '"beeri"', 148, 'daniel@meghasystems.at', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (53237075, to_date('02-12-2015', 'dd-mm-yyyy'), 'Jonny Lee', 'Hayes', 'Adelaide', '"anilevich"', 48, 'jonnylee@officedepot.au', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54761032, to_date('05-02-1914', 'dd-mm-yyyy'), 'Eileen', 'Simpson', 'New Haven', '"amos"', 43, 'eileen.simpson@data.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (99203358, to_date('19-06-1907', 'dd-mm-yyyy'), 'Trace', 'Lennox', 'Northampton', '"eshel abraham"', 63, 'trace.lennox@accuship.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (39291731, to_date('26-09-1963', 'dd-mm-yyyy'), 'Shawn', 'Banderas', 'Market Harborough', '"haaliya hashniya"', 73, 'shawnb@marathonheater.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (61886377, to_date('01-12-1945', 'dd-mm-yyyy'), 'Whoopi', 'McCready', 'Washington', '"haadmor migur"', 68, 'whoopi.mccready@wellsfinancial.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (73593804, to_date('03-04-1911', 'dd-mm-yyyy'), 'Luis', 'Lofgren', 'Regina', '"avtalyon"', 123, 'luis@ecopy.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (62213084, to_date('02-09-2002', 'dd-mm-yyyy'), 'Robby', 'Kattan', 'Chennai', '"bin-nun"', 60, 'robby@lms.in', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (74098777, to_date('14-07-2015', 'dd-mm-yyyy'), 'Ronny', 'Evett', 'Herdecke', '"ben zoma"', 37, 'ronny.evett@unitedasset.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (1402178, to_date('05-01-1980', 'dd-mm-yyyy'), 'Jeff', 'Mellencamp', 'Neuch?tel', '"beit yosef"', 34, 'jeff.mellencamp@coridiantechnologies.ch', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (77422234, to_date('02-06-1948', 'dd-mm-yyyy'), 'Saffron', 'Lynskey', 'Haverhill', '"beit shammai"', 80, 'slynskey@marketbased.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (34899411, to_date('19-12-1965', 'dd-mm-yyyy'), 'Reese', 'Emmett', 'Ludbreg', '"admorei alexander"', 45, 'remmett@ach.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (57848591, to_date('14-08-2018', 'dd-mm-yyyy'), 'Donna', 'Renfro', 'Milpitas', '"anilevich"', 64, 'donna.renfro@spd.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (70753258, to_date('22-08-1944', 'dd-mm-yyyy'), 'Cevin', 'Pryce', 'South Jordan', '"baal shem tov"', 41, 'cevin.pryce@larkinenterprises.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (88640189, to_date('17-08-2007', 'dd-mm-yyyy'), 'Rutger', 'Boone', 'Reisterstown', '"gnishovski"', 82, 'rutger.boone@conagra.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (8532059, to_date('06-11-1914', 'dd-mm-yyyy'), 'Rory', 'LuPone', 'Los Angeles', '"dov hoz"', 84, 'rory.lupone@pfizer.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (14534729, to_date('21-06-1968', 'dd-mm-yyyy'), 'Howie', 'Lerner', 'Gliwice', '"emek jezreel"', 130, 'h.lerner@tropicaloasis.pl', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22799537, to_date('25-11-1909', 'dd-mm-yyyy'), 'Millie', 'Irving', 'Pa?o de Arcos', '"daniel"', 81, 'millie.irving@mqsoftware.pt', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (73453807, to_date('06-03-1944', 'dd-mm-yyyy'), 'Nicky', 'Gano', 'Port Macquarie', '"baruch hirsch"', 16, 'nickyg@americanvanguard.au', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (67291172, to_date('07-03-1988', 'dd-mm-yyyy'), 'Willie', 'Cromwell', 'Campinas', '"don yoseph nasi"', 53, 'willie.cromwell@banfeproducts.br', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (45697419, to_date('06-09-1982', 'dd-mm-yyyy'), 'Gaby', 'Franks', 'Pulheim-brauweiler', 'abarbanel', 63, 'gaby.franks@prosum.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23412617, to_date('21-11-1915', 'dd-mm-yyyy'), 'Alannah', 'Clark', 'Oldwick', '"avtalyon"', 40, 'alannah@stonetechprofessional.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (72778564, to_date('12-12-1949', 'dd-mm-yyyy'), 'Saffron', 'Crosby', 'Lima', '"giborei israel"', 146, 'saffron.crosby@qssgroup.pe', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (44938507, to_date('27-10-2008', 'dd-mm-yyyy'), 'Kurt', 'Beckham', 'Deerfield', '"avraham ben david"', 84, 'kurt.beckham@progressivemedical.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (65011242, to_date('19-12-1957', 'dd-mm-yyyy'), 'Deborah', 'Navarro', 'Paramus', '"esther hamalka"', 93, 'deborah.navarro@manhattanassociates.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (38494989, to_date('07-07-1945', 'dd-mm-yyyy'), 'Lindsay', 'McCain', 'Parsippany', '"haadmor mivishoy"', 6, 'lindsay.mccain@infinity.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (6217460, to_date('20-08-1960', 'dd-mm-yyyy'), 'Uma', 'Squier', 'Sugar Hill', '"haadmon minadvorna"', 69, 'uma.squier@hencie.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (88634045, to_date('09-05-2007', 'dd-mm-yyyy'), 'Oro', 'Leigh', 'Barbengo', '"ami"', 19, 'o.leigh@telepoint.ch', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (43436957, to_date('20-09-1915', 'dd-mm-yyyy'), 'Blair', 'Allen', 'Nashua', '"bar yohai"', 50, 'blair.allen@pharmafab.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (47362950, to_date('04-11-1968', 'dd-mm-yyyy'), 'David', 'Holiday', 'Bruxelles', '"amos"', 83, 'd.holiday@intel.be', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (49053838, to_date('06-07-1930', 'dd-mm-yyyy'), 'Wally', 'Bell', 'Ulm', '"eshel abraham"', 88, 'wally.bell@oneidafinancial.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (69838192, to_date('13-03-1910', 'dd-mm-yyyy'), 'Kurtwood', 'Lightfoot', 'Santa Clarita', '"ahiya hashiloni"', 2, 'kurtwoodl@granitesystems.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (36833753, to_date('27-01-1983', 'dd-mm-yyyy'), 'Kyra', 'Belushi', 'Herford', '"chida"', 3, 'kyra.belushi@eastmankodak.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (71263062, to_date('26-03-1903', 'dd-mm-yyyy'), 'Richie', 'Benoit', 'Aurora', '"beeri"', 100, 'richie.b@sysconmedia.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (94475922, to_date('20-05-2012', 'dd-mm-yyyy'), 'Jake', 'Esposito', 'Sutton', '"don yoseph nasi"', 59, 'jake.esposito@peerlessmanufacturing.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (70985710, to_date('13-06-1911', 'dd-mm-yyyy'), 'Merrill', 'Gambon', 'Peachtree City', '"bertanura"', 142, 'merrill.gambon@newmedia.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (91703316, to_date('11-03-1986', 'dd-mm-yyyy'), 'Chazz', 'Hirsch', 'M?nchen', '"gold"', 103, 'c.hirsch@cardtronics.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (46344277, to_date('13-01-1906', 'dd-mm-yyyy'), 'Rose', 'Polito', 'Cheshire', '"ahronson"', 126, 'rose.polito@wyeth.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (2505457, to_date('12-02-1967', 'dd-mm-yyyy'), 'Rhea', 'Flanagan', 'Monroe', '"achiezer"', 76, 'rhea.flanagan@dynacqinternational.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (10854394, to_date('28-01-1965', 'dd-mm-yyyy'), 'Juliette', 'Belles', 'Bernex', '"ami"', 91, 'juliette@americanhealthways.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (66242981, to_date('13-08-2021', 'dd-mm-yyyy'), 'Emmylou', 'Todd', 'Montr?al', '"gaonei brisk"', 46, 'emmylout@seafoxboat.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (31661429, to_date('09-01-2012', 'dd-mm-yyyy'), 'Jim', 'Culkin', 'Webster Groves', '"beer mayim hayim"', 6, 'jculkin@scooterstore.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (31024696, to_date('19-06-1931', 'dd-mm-yyyy'), 'Sylvester', 'Heslov', 'Luzern', '"borochov"', 144, 'sylvester@ass.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (24317288, to_date('18-07-1927', 'dd-mm-yyyy'), 'Stellan', 'Dench', 'Rueil-Malmaison', '"greenberg"', 96, 'stellan@lynksystems.fr', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (2591817, to_date('27-01-1982', 'dd-mm-yyyy'), 'Stockard', 'Crow', 'Brisbane', '"gotlieb"', 75, 'stockardc@deutschetelekom.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (47501817, to_date('31-10-1955', 'dd-mm-yyyy'), 'Raymond', 'Spiner', 'Ettlingen', '"golomb"', 4, 'raymond.spiner@reckittbenckiser.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (38125788, to_date('04-05-1931', 'dd-mm-yyyy'), 'Mos', 'Cale', 'Marietta', '"gnishovski"', 90, 'mos.c@aquascapedesigns.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (15992467, to_date('05-11-1962', 'dd-mm-yyyy'), 'Ike', 'Hutch', 'Sao jose rio preto', '"ben arieh"', 26, 'ike.hutch@logisticare.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (63229033, to_date('27-04-2022', 'dd-mm-yyyy'), 'Gloria', 'Avalon', 'Yavne', '"aharon dov"', 111, 'g.avalon@kingland.il', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (53737541, to_date('17-11-1965', 'dd-mm-yyyy'), 'Spencer', 'Gagnon', 'Saitama', '"bradnshtetter"', 4, 'sgagnon@wav.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (98037672, to_date('31-12-1987', 'dd-mm-yyyy'), 'Domingo', 'Cobbs', 'Hounslow', '"avodat israel"', 122, 'd.cobbs@americanland.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (48084398, to_date('18-10-1941', 'dd-mm-yyyy'), 'Meg', 'Sherman', 'Ohita', '"ben azay"', 134, 'meg.s@pragmatechsoftware.jp', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79260141, to_date('04-07-1994', 'dd-mm-yyyy'), 'Nicholas', 'Jeter', 'London', '"gnishovski"', 142, 'n.jeter@mathis.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (62449525, to_date('30-08-1914', 'dd-mm-yyyy'), 'Hilton', 'Starr', 'Di Savigliano', '"ben gurion"', 143, 'h.starr@usdairyproducers.it', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79693276, to_date('16-06-2023', 'dd-mm-yyyy'), 'Ice', 'Maxwell', 'Lodi', 'abarbanel', 95, 'ice.maxwell@nhr.it', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (71375160, to_date('13-05-2013', 'dd-mm-yyyy'), 'Holland', 'Squier', 'Pasadena', '"aharonovitch"', 63, 'holland.squier@generalmills.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (92758832, to_date('23-04-1985', 'dd-mm-yyyy'), 'Raul', 'Elizabeth', 'Bend', '"baal shem tov"', 55, 'r.elizabeth@biosite.com', 'F');
commit;
prompt 200 records committed...
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (10252506, to_date('19-02-2014', 'dd-mm-yyyy'), 'Thin', 'Ponty', 'Bernex', '"admorei alexander"', 30, 'thin.ponty@spd.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (41060366, to_date('09-02-1998', 'dd-mm-yyyy'), 'Goldie', 'Ricci', 'Sparrows Point', '"aviad"', 149, 'goldier@ppr.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (2450269, to_date('17-09-2021', 'dd-mm-yyyy'), 'Busta', 'Cummings', 'Mumbai', '"alsheikh"', 115, 'busta.cummings@reckittbenckiser.in', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (34375443, to_date('22-12-1985', 'dd-mm-yyyy'), 'Karon', 'Carrington', 'Monmouth', 'abarbanel', 124, 'k.carrington@prahs.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (82804437, to_date('05-12-1911', 'dd-mm-yyyy'), 'Steve', 'Dayne', 'Bronx', '"david pinkas"', 78, 'sdayne@spotfireholdings.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (8081255, to_date('19-11-1969', 'dd-mm-yyyy'), 'Martha', 'Rooker', 'Halfway house', '"bradnshtetter"', 49, 'martha@northhighland.za', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (59560586, to_date('11-05-2001', 'dd-mm-yyyy'), 'Holland', 'Mollard', 'Redwood City', '"binyamin avraham"', 18, 'holland.mollard@ogi.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (18340976, to_date('29-06-1976', 'dd-mm-yyyy'), 'Kyra', 'Winwood', 'Stone Mountain', '"abba hillel silver"', 32, 'kyra.winwood@capitalbank.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (76960313, to_date('06-01-1941', 'dd-mm-yyyy'), 'Aimee', 'Puckett', 'Lyngby', '"derekh sheshet hayamim"', 142, 'aimee.p@capstone.dk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (29203895, to_date('16-07-1917', 'dd-mm-yyyy'), 'Bryan', 'McDonald', 'Jacksonville', '"aharon dov"', 131, 'bryan.mcdonald@democracydata.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (61698245, to_date('24-02-1945', 'dd-mm-yyyy'), 'Rory', 'Garofalo', 'Toronto', '"avraham ben david"', 35, 'rory@educationaldevelopment.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (98877580, to_date('10-02-1969', 'dd-mm-yyyy'), 'Ronny', 'Coe', 'West Drayton', '"baal hatanya"', 82, 'ronny.coe@marathonheater.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (58227833, to_date('28-07-1961', 'dd-mm-yyyy'), 'Toni', 'Wagner', 'Venice', '"habanim"', 101, 'toni.wagner@prometheuslaboratories.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (27638287, to_date('18-12-2022', 'dd-mm-yyyy'), 'Carrie-Anne', 'Schiavelli', 'Schlieren', '"eliyahu hanavi"', 145, 'carrieanne@quicksilverresources.ch', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (84018267, to_date('02-10-1940', 'dd-mm-yyyy'), 'Juliana', 'Llewelyn', 'Aurora', '"ben gurion"', 35, 'julianal@inspirationsoftware.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (8039183, to_date('25-10-1978', 'dd-mm-yyyy'), 'LeVar', 'McCann', 'Sevilla', '"beer mayim hayim"', 47, 'l.mccann@accessus.es', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22432753, to_date('19-01-1923', 'dd-mm-yyyy'), 'Glen', 'Oldman', 'Veenendaal', '"abu hatseira"', 124, 'gleno@coridiantechnologies.nl', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (7164065, to_date('28-05-1942', 'dd-mm-yyyy'), 'Dave', 'Lang', 'Bielefeld', '"haarmor miradzymin"', 78, 'davel@mattel.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81276702, to_date('24-12-1961', 'dd-mm-yyyy'), 'Edgar', 'Rankin', 'Marlboro', '"david hamelekh"', 18, 'edgar.rankin@floorgraphics.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (24414730, to_date('17-04-1903', 'dd-mm-yyyy'), 'Taylor', 'Thomas', 'Horb', '"abu hatseira"', 8, 'taylor.thomas@mss.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22820514, to_date('29-11-1979', 'dd-mm-yyyy'), 'Josh', 'Lauper', 'Tsu', '"eli hacohen"', 55, 'joshl@bradleypharmaceuticals.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (16134366, to_date('15-05-2020', 'dd-mm-yyyy'), 'Meryl', 'Numan', 'Saint Paul', '"habayit"', 120, 'm.numan@mastercardinternational.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (86272012, to_date('01-09-1975', 'dd-mm-yyyy'), 'Delroy', 'Hayes', 'Reno', '"ezra"', 15, 'delroy.hayes@priorityexpress.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (32128888, to_date('11-08-1917', 'dd-mm-yyyy'), 'Fairuza', 'Pride', 'Ankara', '"ben ptachia"', 126, 'fairuzap@kellogg.tr', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54968773, to_date('17-08-2007', 'dd-mm-yyyy'), 'Chubby', 'Getty', 'Lyon', '"avraham ben david"', 24, 'c.getty@invisioncom.fr', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (32460971, to_date('20-01-1916', 'dd-mm-yyyy'), 'Gaby', 'Zane', 'Matsuyama', '"alsheikh"', 22, 'gaby.zane@vfs.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (6603015, to_date('01-02-1936', 'dd-mm-yyyy'), 'Rade', 'Byrne', 'Dardilly', '"chida"', 32, 'radeb@infopros.fr', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (62214926, to_date('05-06-1911', 'dd-mm-yyyy'), 'Judd', 'Imbruglia', 'Bismarck', '"ahavat shalom"', 74, 'judd.imbruglia@techrx.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (34241869, to_date('25-06-1996', 'dd-mm-yyyy'), 'Julianne', 'Spall', 'Protvino', '"aharonovitch"', 105, 'julianne.spall@drinkmorewater.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (2938480, to_date('05-02-1997', 'dd-mm-yyyy'), 'Viggo', 'Ceasar', 'Guadalajara', '"bilu"', 51, 'viggo.ceasar@bmm.mx', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (27611255, to_date('06-04-1904', 'dd-mm-yyyy'), 'Rascal', 'Armstrong', 'Lexington', '"eli hacohen"', 141, 'r.armstrong@marketbased.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (71649431, to_date('20-04-1948', 'dd-mm-yyyy'), 'Vincent', 'Vincent', 'Macau', '"avney nezer"', 80, 'vincentv@midwestmedia.mo', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22920110, to_date('07-10-1990', 'dd-mm-yyyy'), 'Ruth', 'Hagar', 'Arlington', '"golomb"', 13, 'ruth.h@appriss.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (66781374, to_date('19-06-1922', 'dd-mm-yyyy'), 'Antonio', 'Winstone', 'Shenzhen', '"greenberg"', 85, 'antonio.w@usenergyservices.cn', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (14389870, to_date('02-04-1944', 'dd-mm-yyyy'), 'Bette', 'Green', 'Cypress', '"elkabetz"', 130, 'bette.green@trainersoft.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23760253, to_date('23-02-1911', 'dd-mm-yyyy'), 'Mel', 'Heatherly', 'Velizy Villacoublay', '"binyamin avraham"', 146, 'mel@sis.fr', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (13663159, to_date('17-06-1925', 'dd-mm-yyyy'), 'Jeroen', 'James', 'Amherst', '"elkabetz"', 95, 'jjames@gtp.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (58513377, to_date('03-02-1938', 'dd-mm-yyyy'), 'Mary', 'Arnold', 'Hermitage', '"eshel abraham"', 24, 'mary.arnold@inzone.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (64660127, to_date('01-05-1983', 'dd-mm-yyyy'), 'Casey', 'Swayze', 'Coimbra', '"federman"', 69, 'casey@procurementcentre.pt', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (10951186, to_date('19-02-1913', 'dd-mm-yyyy'), 'Lila', 'Humphrey', 'Moreno Valley', '"haadmor mikotsk"', 123, 'lila@genghisgrill.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (48277353, to_date('24-03-2010', 'dd-mm-yyyy'), 'Leslie', 'Dafoe', 'Chaam', '"damesek eliezer"', 136, 'leslie.dafoe@trainersoft.nl', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (92566199, to_date('06-06-1934', 'dd-mm-yyyy'), 'Carrie-Anne', 'Nash', 'Aomori', '"haadmor merojin"', 11, 'carrieanne.nash@owm.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (46010066, to_date('15-01-2005', 'dd-mm-yyyy'), 'Wesley', 'Stiers', 'Natal', '"aharonovitch"', 56, 'wesley.stiers@zoneperfectnutrition.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (13356721, to_date('20-06-1945', 'dd-mm-yyyy'), 'Rueben', 'Harris', 'Halfway house', '"bet hilel"', 8, 'ruebenh@genextechnologies.za', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (1282269, to_date('03-07-1955', 'dd-mm-yyyy'), 'Buddy', 'Sedgwick', 'Fambach', '"haaliya hashniya"', 94, 'buddy.sedgwick@saksinc.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (71989689, to_date('07-04-1919', 'dd-mm-yyyy'), 'Dan', 'Dupree', 'Solon', '"ben gurion"', 115, 'ddupree@noodles.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54638372, to_date('20-03-1900', 'dd-mm-yyyy'), 'Johnette', 'Jeter', 'Bountiful', '"beit yosef"', 145, 'johnette.j@fpf.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (43217671, to_date('12-11-1929', 'dd-mm-yyyy'), 'Irene', 'Paxton', 'Sihung-si', '"elisha"', 53, 'irene.paxton@clubone.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (99375320, to_date('05-06-1927', 'dd-mm-yyyy'), 'Victor', 'Nicks', 'Helsinki', '"ami"', 94, 'victor.nicks@morganresearch.fi', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (72508489, to_date('17-11-1900', 'dd-mm-yyyy'), 'Maury', 'McDonnell', 'Mount Olive', '"habanim"', 132, 'maury@hudsonriverbancorp.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (6161238, to_date('07-02-1979', 'dd-mm-yyyy'), 'Juice', 'Sampson', 'Tokyo', '"dakar"', 101, 'juice.s@ppr.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (67887328, to_date('20-12-1967', 'dd-mm-yyyy'), 'Glen', 'Kier', 'Marietta', '"gnai gad"', 113, 'glen.kier@abs.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (53109927, to_date('07-05-2002', 'dd-mm-yyyy'), 'Geraldine', 'Puckett', 'Manchester', '"habarzel"', 110, 'gpuckett@glacierbancorp.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (20103782, to_date('13-10-1989', 'dd-mm-yyyy'), 'Emma', 'Kinnear', 'Saudarkrokur', '"anilevich"', 88, 'emma.kinnear@tama.is', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81865150, to_date('28-07-1990', 'dd-mm-yyyy'), 'Stephen', 'McGill', 'Limeira', '"bar kokhba"', 78, 'smcgill@diversitech.br', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (96940369, to_date('09-12-1952', 'dd-mm-yyyy'), 'Mika', 'Dunst', 'Pitstone', '"alsheikh"', 63, 'mika.d@stmaryland.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (27719925, to_date('01-07-1936', 'dd-mm-yyyy'), 'Trini', 'McDormand', 'Houston', '"avtalyon"', 82, 'trini.mcdormand@noodles.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (44623593, to_date('10-03-1938', 'dd-mm-yyyy'), 'Casey', 'Huston', 'Baarn', '"aviad"', 8, 'casey@nexxtworks.nl', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81190517, to_date('04-01-2006', 'dd-mm-yyyy'), 'Nigel', 'Bonneville', 'Yogyakarta', '"abu hatseira"', 72, 'nigel.bonneville@pearllawgroup.id', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (31393240, to_date('12-06-1945', 'dd-mm-yyyy'), 'Spike', 'Hunter', 'Rtp', '"haadmor migur"', 88, 'shunter@diamondtechnologies.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (26290962, to_date('09-10-1943', 'dd-mm-yyyy'), 'Dustin', 'Tippe', 'Erlangen', '"anilevich"', 19, 'dustin@sps.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (53483220, to_date('12-04-1947', 'dd-mm-yyyy'), 'Sissy', 'Carter', 'Vaduz', '"elisha"', 118, 'sissy.carter@mastercardinternational.li', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (20114821, to_date('03-12-1994', 'dd-mm-yyyy'), 'William', 'Jonze', 'Ipswich', '"damesek eliezer"', 82, 'william.jonze@fam.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (25124557, to_date('08-10-2015', 'dd-mm-yyyy'), 'Hilary', 'Tisdale', 'Neustadt', '"avraham ben david"', 65, 'hilary@integratelecom.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (33915414, to_date('03-01-1973', 'dd-mm-yyyy'), 'Robin', 'Matheson', 'Paraju', '"aharon dov"', 22, 'robin.matheson@logisticare.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (24504822, to_date('12-02-1923', 'dd-mm-yyyy'), 'Robby', 'Allen', 'North bethesda', '"haaliya hashniya"', 79, 'robby.allen@techrx.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79815731, to_date('26-01-1901', 'dd-mm-yyyy'), 'Juan', 'Solido', 'Framingham', '"habanim"', 37, 'juan.s@hps.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23020212, to_date('12-10-1963', 'dd-mm-yyyy'), 'Geena', 'Bening', 'Pasadena', '"bialik"', 73, 'geena.bening@primussoftware.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (88310865, to_date('26-07-2010', 'dd-mm-yyyy'), 'Ryan', 'Wainwright', 'Saudarkrokur', '"beit yosef"', 12, 'rwainwright@logisticare.is', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (1055314, to_date('04-12-1977', 'dd-mm-yyyy'), 'Greg', 'Gaines', 'Fort worth', '"daniel"', 133, 'greg.gaines@shirtfactory.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (46339943, to_date('06-08-2017', 'dd-mm-yyyy'), 'Jennifer', 'Patrick', 'Forest Park', '"dakar"', 13, 'jennifer.patrick@freedommedical.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (6717674, to_date('04-05-1955', 'dd-mm-yyyy'), 'Miranda', 'Hunter', 'Qu?bec', '"bradnshtetter"', 32, 'miranda.hunter@doraldentalusa.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (730279, to_date('16-03-1914', 'dd-mm-yyyy'), 'Benjamin', 'Reeve', 'Waterloo', '"dvora hanevia"', 117, 'benjamin.reeve@microtek.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (13346174, to_date('22-06-1988', 'dd-mm-yyyy'), 'Mykelti', 'Rodgers', 'Oberwangen', '"donnolo"', 7, 'mykelti.rodgers@avs.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (89421322, to_date('18-05-1987', 'dd-mm-yyyy'), 'Leonardo', 'Carlisle', 'Sparrows Point', '"david pinkas"', 120, 'l.carlisle@loreal.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (59517988, to_date('02-04-1962', 'dd-mm-yyyy'), 'Tom', 'Winter', 'Angers', '"emek jezreel"', 46, 'tom@jcpenney.fr', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (31750692, to_date('04-10-2000', 'dd-mm-yyyy'), 'Frank', 'Berkeley', 'San Francisco', '"dr. broyer"', 104, 'frank@tmt.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (19067900, to_date('28-05-1923', 'dd-mm-yyyy'), 'Anne', 'Garza', 'Irkutsk', '"haadmor migur"', 33, 'anne.garza@prometheuslaboratories.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (28937802, to_date('21-02-1950', 'dd-mm-yyyy'), 'Maria', 'Reeves', 'Glen allen', '"gold"', 67, 'maria.r@target.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (32846918, to_date('29-06-1941', 'dd-mm-yyyy'), 'Buddy', 'Day-Lewis', 'Buenos Aires', '"donnolo"', 99, 'buddyd@hencie.ar', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (10395000, to_date('04-03-1920', 'dd-mm-yyyy'), 'Azucar', 'Haggard', 'Ulsteinvik', '"don yoseph nasi"', 128, 'azucar.haggard@kramontrealty.no', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (25139076, to_date('14-05-1959', 'dd-mm-yyyy'), 'Nile', 'Almond', 'Parma', '"alkalai"', 76, 'n.almond@enterprise.it', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (71805490, to_date('06-03-2002', 'dd-mm-yyyy'), 'Jose', 'Senior', 'Protvino', '"dov gruner"', 135, 'joses@esoftsolutions.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (94625728, to_date('28-07-2018', 'dd-mm-yyyy'), 'Kasey', 'DeVita', 'Bologna', '"bet hilel"', 38, 'kasey.devita@bluffcitysteel.ie', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (78118267, to_date('27-09-1972', 'dd-mm-yyyy'), 'Edgar', 'Molina', 'W?rzburg', '"gotlieb"', 55, 'emolina@atlanticcredit.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (49478035, to_date('14-04-2015', 'dd-mm-yyyy'), 'Pablo', 'Phifer', 'Milpitas', '"ami"', 24, 'pablop@creditorsinterchange.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (88726887, to_date('08-08-1934', 'dd-mm-yyyy'), 'Jonny', 'Mould', 'Palo Alto', '"daniel"', 149, 'jonny.mould@kellogg.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (29207505, to_date('14-07-1919', 'dd-mm-yyyy'), 'Lorraine', 'Pollack', 'Draper', '"ahiya hashiloni"', 135, 'lorraine.pollack@evergreenresources.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (93282325, to_date('02-12-1962', 'dd-mm-yyyy'), 'Chi', 'Frampton', 'Sugar Hill', '"bertanura"', 82, 'chif@prosperitybancshares.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30845995, to_date('22-02-1957', 'dd-mm-yyyy'), 'Vienna', 'Nelson', 'North bethesda', '"abba hillel silver"', 139, 'v.nelson@procter.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (39658357, to_date('13-05-1953', 'dd-mm-yyyy'), 'Kristin', 'Scaggs', 'St. Petersburg', '"baal shem tov"', 76, 'kristin.scaggs@grayhawksystems.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (27803037, to_date('12-10-2007', 'dd-mm-yyyy'), 'Darren', 'Lauper', 'Herne', '"haadmor merojin"', 26, 'darren.lauper@pib.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54033988, to_date('26-02-1957', 'dd-mm-yyyy'), 'Shirley', 'Lucien', 'Brookfield', '"dr. broyer"', 60, 'shirley.lucien@pioneerdatasystems.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (99588313, to_date('19-07-1973', 'dd-mm-yyyy'), 'Elijah', 'Stevens', 'Ani?res', '"gerstenkorn"', 24, 'elijah.stevens@wellsfinancial.ch', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22657272, to_date('14-06-1984', 'dd-mm-yyyy'), 'Merle', 'Numan', 'Pointe-claire', '"aharonovitch"', 69, 'mnuman@gillette.ca', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (86453357, to_date('28-02-2018', 'dd-mm-yyyy'), 'Ryan', 'Bracco', 'Angers', '"baal shem tov"', 60, 'ryan.bracco@fordmotor.fr', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81329950, to_date('03-11-1938', 'dd-mm-yyyy'), 'Sandra', 'Palmer', 'Warrenton', '"ezra"', 15, 'sandra.palmer@linacsystems.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (65048967, to_date('23-07-1990', 'dd-mm-yyyy'), 'LeVar', 'Gray', 'Edison', '"emek jezreel"', 25, 'levar.gray@nestle.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (53589885, to_date('26-06-1913', 'dd-mm-yyyy'), 'Sally', 'Vicious', 'Reisterstown', '"esther hamalka"', 57, 'sally.vicious@infinity.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (8421656, to_date('19-11-1918', 'dd-mm-yyyy'), 'Rita', 'Nicholas', 'Nordhausen', '"ahronson"', 62, 'rita.nicholas@computersource.de', 'F');
commit;
prompt 300 records committed...
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (97400551, to_date('15-11-1993', 'dd-mm-yyyy'), 'Saffron', 'Dzundza', 'Moorestown', '"baal shem tov"', 65, 'saffron.dzundza@dillards.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (26603974, to_date('30-12-1907', 'dd-mm-yyyy'), 'Tea', 'Costello', 'Edmonton', '"dakar"', 61, 'tea.costello@credopetroleum.ca', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (91416453, to_date('07-12-2013', 'dd-mm-yyyy'), 'Sean', 'Heche', 'Snoqualmie', '"bar kokhba"', 149, 'seanh@mss.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (51193500, to_date('16-05-1962', 'dd-mm-yyyy'), 'Rowan', 'Horizon', 'Netanya', '"beeri"', 51, 'rhorizon@dancor.il', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (24001000, to_date('07-11-1928', 'dd-mm-yyyy'), 'Harvey', 'Clinton', 'Swannanoa', '"aharon dov"', 79, 'harvey.clinton@hcoa.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (53564426, to_date('18-10-1911', 'dd-mm-yyyy'), 'Albert', 'Craig', 'Essex', '"habarzel"', 45, 'albert.craig@sandyspringbancorp.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (11834830, to_date('22-02-1976', 'dd-mm-yyyy'), 'Jonatha', 'Fierstein', 'Birkenhead', '"damesek eliezer"', 32, 'jonatha.fierstein@execuscribe.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (66588970, to_date('10-05-1955', 'dd-mm-yyyy'), 'Garry', 'Burke', 'Nuernberg', '"ahronson"', 132, 'garry.b@curagroup.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (50550367, to_date('22-09-2020', 'dd-mm-yyyy'), 'Elvis', 'Armstrong', 'St Jean de Soudain', '"eshel abraham"', 106, 'elvisa@monarchcasino.fr', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (59682318, to_date('13-12-2020', 'dd-mm-yyyy'), 'Merrilee', 'Costello', 'Stellenbosch', '"golomb"', 50, 'merrilee.c@privatebancorp.za', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (58302395, to_date('22-12-2014', 'dd-mm-yyyy'), 'Sigourney', 'Lange', 'Santorso', '"beer mayim hayim"', 83, 'sigourney.lange@ungertechnologies.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (70856993, to_date('27-07-1924', 'dd-mm-yyyy'), 'Kirk', 'Deschanel', 'Mclean', '"bradnshtetter"', 129, 'kirk.deschanel@visainternational.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (3838986, to_date('05-06-1959', 'dd-mm-yyyy'), 'Hilary', 'Ricci', 'Duisburg', '"dov gruner"', 130, 'hilary.ricci@granitesystems.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (4646448, to_date('06-04-1916', 'dd-mm-yyyy'), 'Arturo', 'Coolidge', 'Hilversum', '"ahiya hashiloni"', 123, 'arturo.coolidge@at.nl', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (314024, to_date('28-09-1970', 'dd-mm-yyyy'), 'Jeff', 'Fiorentino', 'Dinslaken', '"ami"', 11, 'j.fiorentino@connected.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (48090112, to_date('27-05-2013', 'dd-mm-yyyy'), 'Gabriel', 'Gyllenhaal', 'Tokyo', '"bilu"', 77, 'gabriel.g@fra.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (91301142, to_date('26-12-1937', 'dd-mm-yyyy'), 'Bobbi', 'Kattan', 'Kozani', '"david pinkas"', 107, 'bobbik@bestever.gr', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (24427407, to_date('28-09-1927', 'dd-mm-yyyy'), 'Kimberly', 'Solido', 'Vista', '"admorei alexander"', 41, 'kimberly.s@morganresearch.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (50166840, to_date('20-06-1935', 'dd-mm-yyyy'), 'Chris', 'Ness', 'Pirmasens', '"donnolo"', 100, 'cness@tama.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (90372030, to_date('04-03-2001', 'dd-mm-yyyy'), 'Greg', 'Thomas', 'Rothenburg', '"bialik"', 150, 'greg.thomas@smi.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (91892167, to_date('01-10-2016', 'dd-mm-yyyy'), 'Loren', 'Posey', 'Herne', '"derekh sheshet hayamim"', 101, 'loren@mms.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (67653817, to_date('11-01-1997', 'dd-mm-yyyy'), 'Laurence', 'Mason', 'H?ssleholm', '"damesek eliezer"', 53, 'l.mason@mission.se', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (70851133, to_date('17-04-1965', 'dd-mm-yyyy'), 'Sophie', 'Cocker', 'Mountain View', '"daniel"', 117, 'scocker@printingforlesscom.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (14865178, to_date('22-12-2004', 'dd-mm-yyyy'), 'Clea', 'Zeta-Jones', 'Den Haag', '"daniel"', 75, 'clea.zetajones@circuitcitystores.nl', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (11612959, to_date('06-11-1978', 'dd-mm-yyyy'), 'Chris', 'Ferrell', 'Nuernberg', '"habayit"', 66, 'chris.f@allstar.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (70389865, to_date('29-04-1969', 'dd-mm-yyyy'), 'Carolyn', 'Russell', 'Pompton Plains', '"donnolo"', 2, 'carolyn.russell@marketfirst.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (89702370, to_date('10-06-1928', 'dd-mm-yyyy'), 'Janeane', 'Barrymore', 'Nyn?shamn', '"al-harizi"', 139, 'j.barrymore@providentbancorp.se', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (76040233, to_date('26-07-1911', 'dd-mm-yyyy'), 'Jonny Lee', 'Carlyle', 'Fairview Heights', '"avtalyon"', 55, 'jonnylee.carlyle@mls.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (58042438, to_date('28-03-1967', 'dd-mm-yyyy'), 'Stephanie', 'Mraz', 'Algermissen', '"amos"', 6, 'stephanie.mraz@noodles.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (87089944, to_date('08-07-1921', 'dd-mm-yyyy'), 'Greg', 'Stamp', 'Leawood', '"david hamelekh"', 137, 'greg.stamp@sds.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (27449638, to_date('13-11-1920', 'dd-mm-yyyy'), 'Jonny Lee', 'Garcia', 'Stuttgart', '"eliyahu hanavi"', 116, 'jgarcia@eagleone.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (67503959, to_date('27-02-1960', 'dd-mm-yyyy'), 'Nile', 'Taha', 'Thames Ditton', '"bradnshtetter"', 135, 'nilet@usdairyproducers.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (76556007, to_date('12-05-1905', 'dd-mm-yyyy'), 'Stellan', 'Studi', 'Portland', '"emek jezreel"', 125, 's.studi@verizon.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (25627106, to_date('05-12-1903', 'dd-mm-yyyy'), 'Jackson', 'Williamson', 'Towson', '"dakar"', 106, 'jackson.williamson@deutschetelekom.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (50029824, to_date('25-06-2009', 'dd-mm-yyyy'), 'Danny', 'Van Der Beek', 'Issaquah', '"al-harizi"', 117, 'dvanderbeek@mattel.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (8106308, to_date('08-10-1983', 'dd-mm-yyyy'), 'Brad', 'Candy', 'Mexico City', '"ami"', 47, 'brad.candy@timberlanewoodcrafters.mx', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (91282035, to_date('04-01-1924', 'dd-mm-yyyy'), 'Campbell', 'Spader', 'Harahan', '"binyamin avraham"', 84, 'c.spader@northhighland.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30411578, to_date('19-08-2016', 'dd-mm-yyyy'), 'Udo', 'Collette', 'Belp', '"dvora hanevia"', 1, 'udo.collette@httprint.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (89596058, to_date('17-09-1955', 'dd-mm-yyyy'), 'Omar', 'Purefoy', 'Reston', '"alsheikh"', 133, 'omar.p@digitalmotorworks.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (8752121, to_date('17-09-1985', 'dd-mm-yyyy'), 'Rip', 'DiBiasio', 'Mount Olive', '"eshel abraham"', 25, 'rip.dibiasio@ibm.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81238413, to_date('02-11-1916', 'dd-mm-yyyy'), 'Scott', 'Oszajca', 'Barbengo', '"beit shammai"', 93, 'scott.oszajca@yes.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (14658929, to_date('25-05-1951', 'dd-mm-yyyy'), 'Paul', 'Cara', 'Guamo', '"ben azay"', 6, 'paul.c@north.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (33449046, to_date('16-05-1954', 'dd-mm-yyyy'), 'Edie', 'Rooker', 'Buffalo', '"beeri"', 137, 'edie.rooker@balchem.ca', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (59413980, to_date('13-03-1933', 'dd-mm-yyyy'), 'Brenda', 'Dunaway', 'Bratislava', '"gordon"', 127, 'brendad@safehomesecurity.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (87218298, to_date('22-02-1953', 'dd-mm-yyyy'), 'Garland', 'Turner', 'Annandale', '"bagano"', 146, 'garland@wav.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (94174046, to_date('28-08-1933', 'dd-mm-yyyy'), 'Ritchie', 'Monk', 'Trieste', '"achiezer"', 88, 'ritchie.monk@hardwoodwholesalers.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (45080144, to_date('19-01-1958', 'dd-mm-yyyy'), 'Campbell', 'Jamal', 'Odense', '"haaliya hashniya"', 122, 'campbell.jamal@balchem.dk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79192786, to_date('25-03-2008', 'dd-mm-yyyy'), 'Angie', 'Mraz', 'Sapulpa', '"avney nezer"', 45, 'amraz@shar.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (55252246, to_date('10-09-1944', 'dd-mm-yyyy'), 'Forest', 'Coyote', 'London', '"haadmor mibelz"', 148, 'forest.coyote@staffone.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (14130558, to_date('21-11-2016', 'dd-mm-yyyy'), 'Nelly', 'Perez', 'Ashland', '"anilevich"', 59, 'nperez@gra.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (42253574, to_date('16-01-1963', 'dd-mm-yyyy'), 'Mark', 'Niven', 'New York', '"ben arieh"', 41, 'mark.niven@lemproducts.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (27035808, to_date('17-02-1990', 'dd-mm-yyyy'), 'Lindsey', 'Pitt', 'Valencia', '"golomb"', 101, 'lindsey.pitt@procter.es', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (44715352, to_date('03-02-1969', 'dd-mm-yyyy'), 'Nina', 'Phillips', 'Burlington', '"haadmor mikotsk"', 67, 'nina@mitsubishimotors.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (55743766, to_date('11-08-1977', 'dd-mm-yyyy'), 'Hilton', 'Penders', 'Milpitas', '"gotlieb"', 143, 'hilton.p@target.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (96098746, to_date('13-01-2000', 'dd-mm-yyyy'), 'Laura', 'Schreiber', 'Albany', '"bet hilel"', 124, 'laura@efcbancorp.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (50900940, to_date('06-07-1997', 'dd-mm-yyyy'), 'Mark', 'Huston', 'Redwood City', '"bar kokhba"', 7, 'm.huston@mre.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23041511, to_date('09-01-1945', 'dd-mm-yyyy'), 'Mira', 'Law', 'Wageningen', '"habanim"', 28, 'm.law@fpf.nl', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (37780928, to_date('27-12-2008', 'dd-mm-yyyy'), 'Wayne', 'Craddock', 'Burlington', '"alkalai"', 102, 'wayne@spinnakerexploration.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (7860731, to_date('25-02-2006', 'dd-mm-yyyy'), 'Milla', 'White', 'Nyn?shamn', '"ahronson"', 117, 'milla.white@aquickdelivery.se', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (7673525, to_date('20-01-1942', 'dd-mm-yyyy'), 'Mickey', 'Forrest', 'Rimini', '"haarmor miradzymin"', 148, 'mickey@sears.it', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54757032, to_date('14-11-1951', 'dd-mm-yyyy'), 'Gran', 'Olyphant', 'Batavia', '"chida"', 87, 'golyphant@shirtfactory.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (74889890, to_date('06-05-1919', 'dd-mm-yyyy'), 'Christina', 'Kirshner', 'Almaty', '"haarmor miradzymin"', 149, 'c.kirshner@infinity.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (64027261, to_date('16-03-1939', 'dd-mm-yyyy'), 'Don', 'Ceasar', 'Ehningen', '"anilevich"', 66, 'don.ceasar@elmco.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (26278207, to_date('24-04-1913', 'dd-mm-yyyy'), 'Rene', 'DeLuise', 'Lehi', '"habayit"', 34, 'rdeluise@ultimus.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (61751644, to_date('15-01-1919', 'dd-mm-yyyy'), 'Cornell', 'Palminteri', 'Sant Cugat Del Valle', '"achiezer"', 115, 'cornellp@supplycorecom.es', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (1601841, to_date('20-07-1964', 'dd-mm-yyyy'), 'Emerson', 'Brody', 'Echirolles', '"amos"', 113, 'emerson.brody@qestrel.fr', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (19099801, to_date('12-10-1935', 'dd-mm-yyyy'), 'Vince', 'O''Hara', 'Fair Lawn', '"beer mayim hayim"', 18, 'v.ohara@dynacqinternational.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (60940200, to_date('20-04-1978', 'dd-mm-yyyy'), 'Ben', 'Supernaw', 'Suberg', '"federman"', 54, 'ben.supernaw@ultimus.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (98257068, to_date('22-10-1998', 'dd-mm-yyyy'), 'Johnny', 'Aykroyd', 'Olivette', '"bin-nun"', 27, 'johnny.aykroyd@volkswagen.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (99887779, to_date('03-02-2017', 'dd-mm-yyyy'), 'Delbert', 'Lofgren', 'Chiba', '"david hamelekh"', 98, 'delbert.lofgren@timberlanewoodcrafters.j', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (25112977, to_date('11-09-2020', 'dd-mm-yyyy'), 'Lin', 'O''Donnell', 'Budapest', '"ben ptachia"', 132, 'lin@circuitcitystores.hu', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (97813459, to_date('24-04-1949', 'dd-mm-yyyy'), 'Roscoe', 'Kutcher', 'Noumea', '"haadmor miznaz"', 37, 'r.kutcher@hatworld.nc', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (73434651, to_date('27-02-1901', 'dd-mm-yyyy'), 'Ronny', 'Holm', 'Vienna', '"bar kokhba"', 128, 'ronny.holm@httprint.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (33300460, to_date('08-03-1904', 'dd-mm-yyyy'), 'Leelee', 'Close', 'Dublin', '"donnolo"', 83, 'leeleec@mls.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (46327250, to_date('06-05-1940', 'dd-mm-yyyy'), 'Irene', 'Dunaway', 'Th?rishaus', '"aluf hanizachon"', 124, 'irene.d@afs.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (90824185, to_date('28-11-1954', 'dd-mm-yyyy'), 'Vivica', 'Spall', 'Lancaster', '"alkalai"', 150, 'vivica@prosum.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (56902043, to_date('24-07-1986', 'dd-mm-yyyy'), 'Salma', 'Curtis', 'Hjallerup', '"avtalyon"', 12, 'salma.curtis@sony.dk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (46532727, to_date('05-04-1941', 'dd-mm-yyyy'), 'Alec', 'Nivola', 'Hilton', '"haadmor migur"', 28, 'alec.nivola@elite.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (2376368, to_date('21-01-1975', 'dd-mm-yyyy'), 'Tzi', 'Conley', 'Schlieren', '"aluf hanizachon"', 84, 'tzi.conley@bmm.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (46639839, to_date('16-07-1961', 'dd-mm-yyyy'), 'Rolando', 'Woods', 'Manaus', '"ben arieh"', 7, 'rolando.woods@medamicus.br', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (92881950, to_date('28-09-1940', 'dd-mm-yyyy'), 'Seth', 'Cockburn', 'Doncaster', '"admorei alexander"', 119, 'seth@caliber.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (80589493, to_date('06-04-1934', 'dd-mm-yyyy'), 'Miles', 'Duchovny', 'Zafferana Etnea', '"bertanura"', 125, 'milesd@safeway.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (12760864, to_date('17-06-1975', 'dd-mm-yyyy'), 'Steve', 'Wilson', 'Brisbane', '"alkalai"', 102, 'stevew@valleyoaksystems.au', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (45505216, to_date('14-05-1972', 'dd-mm-yyyy'), 'Richard', 'Barnett', 'El Segundo', '"ahavat shalom"', 116, 'richard.barnett@nrae.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (7299036, to_date('07-10-1980', 'dd-mm-yyyy'), 'Ricky', 'Landau', 'Londrina', '"don yoseph nasi"', 115, 'ricky@capstone.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (39413869, to_date('24-10-2015', 'dd-mm-yyyy'), 'Wallace', 'Colman', 'Milsons Point', '"abba hillel silver"', 128, 'w.colman@ubp.au', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (25602009, to_date('04-12-2000', 'dd-mm-yyyy'), 'Gaby', 'Holden', 'Juneau', '"david hamelekh"', 108, 'g.holden@marketfirst.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (35965202, to_date('15-02-1930', 'dd-mm-yyyy'), 'Peabo', 'Woodard', 'Hilversum', '"dakar"', 71, 'peabo.woodard@dbprofessionals.nl', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (38614060, to_date('26-10-1948', 'dd-mm-yyyy'), 'Loreena', 'Carrack', 'Duluth', '"beit horon"', 54, 'loreena.carrack@colgatepalmolive.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (42274072, to_date('17-04-1916', 'dd-mm-yyyy'), 'Alec', 'Dalley', 'North Yorkshire', '"aluf hanizachon"', 40, 'alec.dalley@kingston.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (90372109, to_date('28-01-1996', 'dd-mm-yyyy'), 'Teri', 'Callow', 'Manchester', '"eshel abraham"', 146, 'teri.c@younginnovations.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (63990543, to_date('26-10-1984', 'dd-mm-yyyy'), 'Claude', 'Orton', 'Springfield', '"baal shem tov"', 34, 'claude.orton@biosite.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (91891117, to_date('12-01-1908', 'dd-mm-yyyy'), 'Betty', 'Slater', 'Waalwijk', '"ahavat shalom"', 26, 'b.slater@execuscribe.nl', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (64820168, to_date('20-10-2009', 'dd-mm-yyyy'), 'Greg', 'King', 'S. Bernardo do Campo', '"giborei israel"', 110, 'greg.k@fetchlogistics.br', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30401976, to_date('14-09-1917', 'dd-mm-yyyy'), 'Ani', 'Conroy', 'Dartmouth', '"avtalyon"', 48, 'ani.c@kingston.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30434462, to_date('09-03-1901', 'dd-mm-yyyy'), 'Adrien', 'Frakes', 'Slough', '"haadmormis spinka"', 54, 'adrien.frakes@asa.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (11169896, to_date('14-06-1907', 'dd-mm-yyyy'), 'Emerson', 'Franks', 'East Peoria', '"ben arieh"', 134, 'efranks@astafunding.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (49537257, to_date('24-12-1957', 'dd-mm-yyyy'), 'Al', 'Nicholas', 'Lyon', '"golomb"', 127, 'al.nicholas@trinityhomecare.fr', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (45968098, to_date('30-04-1971', 'dd-mm-yyyy'), 'Victor', 'Holbrook', 'Zafferana Etnea', '"bilu"', 36, 'victor.holbrook@ceom.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (42322889, to_date('24-07-1904', 'dd-mm-yyyy'), 'Madeleine', 'McLean', 'Walnut Creek', '"elisha"', 7, 'madeleine.mclean@unica.com', 'F');
commit;
prompt 400 records committed...
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79910635, to_date('12-04-1931', 'dd-mm-yyyy'), 'Ike', 'Wagner', 'Verdun', '"bin-nun"', 104, 'ike.w@microtek.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (87891090, to_date('30-01-1909', 'dd-mm-yyyy'), 'Johnny', 'Snow', 'Waterloo', '"haadmor miznaz"', 1, 'johnny.snow@nrae.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (41003550, to_date('11-09-1923', 'dd-mm-yyyy'), 'Latin', 'Puckett', 'Oldwick', '"haadmor migur"', 50, 'latin.puckett@softworld.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (48536850, to_date('19-11-1937', 'dd-mm-yyyy'), 'Eileen', 'Sepulveda', 'Toyama', '"don yoseph nasi"', 61, 'eileen.sepulveda@servicelink.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (1934281, to_date('23-03-2000', 'dd-mm-yyyy'), 'Ivan', 'Todd', 'Bekescsaba', '"beeri"', 150, 'ivan@cascadebancorp.hu', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (25039816, to_date('25-10-1939', 'dd-mm-yyyy'), 'Andrew', 'Durning', 'Charleston', '"elisha"', 42, 'andrew.d@pis.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (21293730, to_date('27-09-1901', 'dd-mm-yyyy'), 'Robert', 'Burrows', 'Pomona', '"aluf hanizachon"', 36, 'robert.burrows@visainternational.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (75363400, to_date('13-07-1930', 'dd-mm-yyyy'), 'Neve', 'Lynn', 'Holliston', '"bilu"', 74, 'neve.lynn@aop.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30899206, to_date('15-08-2013', 'dd-mm-yyyy'), 'Angelina', 'Houston', 'Tualatin', '"gaonei brisk"', 22, 'angelina.houston@swp.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (29742651, to_date('24-04-1903', 'dd-mm-yyyy'), 'Gladys', 'Nash', 'Bloomington', '"daniel"', 117, 'gladys@callhenry.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (96973892, to_date('12-08-1923', 'dd-mm-yyyy'), 'Liquid', 'Def', 'Riverdale', '"baal shem tov"', 103, 'liquid.def@savela.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (11798215, to_date('06-09-1969', 'dd-mm-yyyy'), 'Stewart', 'Suchet', 'Springfield', '"aluf hanizachon"', 107, 'stewart.suchet@swi.au', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (87008506, to_date('15-08-1967', 'dd-mm-yyyy'), 'Brittany', 'Chappelle', 'Biel', '"bar yohai"', 144, 'brittany.chappelle@elite.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (49084441, to_date('02-02-1911', 'dd-mm-yyyy'), 'Jean-Luc', 'Boone', 'Pacific Grove', '"giborei israel"', 70, 'jeanluc.boone@saltgroup.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81884643, to_date('28-05-1918', 'dd-mm-yyyy'), 'Laurie', 'Goldberg', 'Thalwil', '"dangoor"', 136, 'laurie.g@aop.ch', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (19894147, to_date('26-12-1975', 'dd-mm-yyyy'), 'Cyndi', 'McCready', 'Libertyville', '"chida"', 47, 'c.mccready@coadvantageresources.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (32410121, to_date('13-03-1939', 'dd-mm-yyyy'), 'Kitty', 'Numan', 'Warsaw', '"aharonovitch"', 45, 'kitty.numan@refinery.pl', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (57601580, to_date('12-02-1997', 'dd-mm-yyyy'), 'Luis', 'Ruffalo', 'Stockholm', '"haadmor mivishoy"', 75, 'luis.ruffalo@logisticare.se', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79476002, to_date('13-04-1993', 'dd-mm-yyyy'), 'First', 'Bailey', 'Sihung-si', '"givat pinhas"', 78, 'f.bailey@lms.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (67819397, to_date('14-07-1943', 'dd-mm-yyyy'), 'Jonny', 'Parker', 'Pa?o de Arcos', '"damesek eliezer"', 7, 'jonny.parker@bis.pt', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (51942941, to_date('10-10-1902', 'dd-mm-yyyy'), 'Rodney', 'Eat World', 'Granada Hills', '"dakar"', 87, 'rodney.eatworld@axis.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (99711392, to_date('27-05-1942', 'dd-mm-yyyy'), 'Mac', 'Noseworthy', 'West Lafayette', '"amiel"', 33, 'mnoseworthy@newhorizons.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (89631320, to_date('20-08-1960', 'dd-mm-yyyy'), 'Balthazar', 'Foxx', 'Espoo', '"baruch hirsch"', 8, 'balthazar.foxx@sci.fi', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (138353, to_date('29-04-1997', 'dd-mm-yyyy'), 'Jeff', 'Firth', 'Berkshire', '"beit shammai"', 28, 'jeff@nmr.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79776408, to_date('13-01-1908', 'dd-mm-yyyy'), 'Zooey', 'Arkin', 'Uetikon am See', '"daniel"', 8, 'zooey.arkin@eagleone.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54315940, to_date('12-04-2023', 'dd-mm-yyyy'), 'Phoebe', 'Forster', 'Bremen', '"don yoseph nasi"', 5, 'p.forster@shirtfactory.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81024259, to_date('19-01-1908', 'dd-mm-yyyy'), 'Giovanni', 'Roth', 'Samrand', '"ben arieh"', 38, 'giovanni.roth@tracertechnologies.za', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (19410869, to_date('02-08-1977', 'dd-mm-yyyy'), 'Anjelica', 'Dunaway', 'Horsens', '"haadmor migur"', 105, 'anjelica.d@pioneermortgage.dk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (72856733, to_date('08-01-1940', 'dd-mm-yyyy'), 'Thelma', 'Farrow', 'Carlsbad', '"beit horon"', 119, 'thelma.farrow@actechnologies.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (19288084, to_date('17-03-1920', 'dd-mm-yyyy'), 'Milla', 'Cozier', 'Koeln', '"donnolo"', 9, 'millac@spotfireholdings.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (90717124, to_date('20-07-1994', 'dd-mm-yyyy'), 'Teri', 'Spears', 'Hamburg', '"ahiya hashiloni"', 74, 'teri.spears@mds.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (96688141, to_date('15-09-2009', 'dd-mm-yyyy'), 'Kasey', 'Numan', 'Leverkusen', '"ben ptachia"', 102, 'k.numan@meridiangold.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (17922070, to_date('21-10-2017', 'dd-mm-yyyy'), 'Beverley', 'Margolyes', 'Warren', '"bet hilel"', 95, 'beverley.margolyes@talx.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (62846464, to_date('04-02-1987', 'dd-mm-yyyy'), 'Rolando', 'Witherspoon', 'Hartmannsdorf', '"ben arieh"', 10, 'rolando.witherspoon@doctorsassociates.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30174663, to_date('24-02-1900', 'dd-mm-yyyy'), 'Chrissie', 'Chapman', 'Tyne & Wear', '"haadmor migur"', 130, 'chrissie.chapman@lindin.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (55478450, to_date('30-09-1903', 'dd-mm-yyyy'), 'Kelli', 'Amos', 'Yavne', '"bin-nun"', 128, 'kelli.amos@marketbased.il', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (83635789, to_date('10-04-1925', 'dd-mm-yyyy'), 'Cary', 'McCready', 'Paisley', '"avraham ben david"', 11, 'cary@marketbased.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (77662045, to_date('07-07-1983', 'dd-mm-yyyy'), 'Rebeka', 'Paquin', 'Harahan', '"dangoor"', 39, 'r.paquin@gra.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (50869449, to_date('16-09-1960', 'dd-mm-yyyy'), 'Pam', 'Shatner', 'Anyang-si', '"admorei alexander"', 128, 'pam@saksinc.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81677750, to_date('16-05-1976', 'dd-mm-yyyy'), 'Sissy', 'Flanagan', 'Manchester', '"ben gurion"', 6, 'sissy.flanagan@ecopy.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (73049091, to_date('07-05-1968', 'dd-mm-yyyy'), 'Christine', 'Hauser', 'Zaandam', '"giborei israel"', 3, 'christine.hauser@sds.nl', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (32313288, to_date('02-05-1962', 'dd-mm-yyyy'), 'Robin', 'Cleary', 'Irati', '"ben zoma"', 65, 'robin.cleary@kroger.br', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (20767492, to_date('22-12-1909', 'dd-mm-yyyy'), 'Alec', 'Parsons', 'Anchorage', '"haadmor merojin"', 117, 'aparsons@cowlitzbancorp.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (19148485, to_date('20-10-1938', 'dd-mm-yyyy'), 'Pablo', 'Winger', 'Olivette', '"alsheikh"', 34, 'pablo.winger@conquestsystems.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54596864, to_date('19-10-1913', 'dd-mm-yyyy'), 'Millie', 'Day', 'Flower mound', '"habanim"', 48, 'millie.day@linksys.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (82890365, to_date('03-08-1967', 'dd-mm-yyyy'), 'Jonathan', 'Silverman', 'Victoria', '"haahim meir"', 133, 'jonathan.s@pacificdatadesigns.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22179745, to_date('08-11-1972', 'dd-mm-yyyy'), 'Jean', 'Gellar', 'Heiligenhaus', '"haaliya hashniya"', 13, 'jean.gellar@bashen.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (40789624, to_date('05-07-1916', 'dd-mm-yyyy'), 'Cheryl', 'Stiers', 'Bergen', 'abarbanel', 1, 'cheryl.s@cendant.dk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (73038198, to_date('03-05-1993', 'dd-mm-yyyy'), 'Vivica', 'Chinlund', 'Chicago', '"gordon"', 130, 'vivica.c@knightsbridge.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (10573645, to_date('25-03-1965', 'dd-mm-yyyy'), 'Nora', 'Humphrey', 'Benbrook', '"ben gurion"', 109, 'nora.h@oriservices.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (41407116, to_date('11-06-1924', 'dd-mm-yyyy'), 'Avenged', 'Zevon', 'Courbevoie', '"haadmor merojin"', 116, 'avenged.z@elite.fr', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (86816573, to_date('29-02-1916', 'dd-mm-yyyy'), 'Winona', 'Cole', 'Lathrop', '"abu hatseira"', 42, 'winona.cole@campbellsoup.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22675432, to_date('20-01-1940', 'dd-mm-yyyy'), 'Clint', 'McIntyre', 'Reno', '"eliyahu hanavi"', 10, 'clint@thinktanksystems.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (55996197, to_date('21-07-1940', 'dd-mm-yyyy'), 'Reese', 'Spiner', 'Holts Summit', '"beit yosef"', 16, 'r.spiner@elitemedical.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (80691820, to_date('22-05-2005', 'dd-mm-yyyy'), 'Ritchie', 'Berenger', 'Woking', '"haadmormis spinka"', 93, 'ritchie.berenger@smartronix.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54842402, to_date('14-12-1901', 'dd-mm-yyyy'), 'Lupe', 'Neville', 'Algermissen', '"gnishovski"', 108, 'lupe.neville@kmart.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (26618921, to_date('28-07-1962', 'dd-mm-yyyy'), 'Terri', 'Coyote', 'Redmond', '"elkabetz"', 116, 'terri@vspan.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (34234011, to_date('09-06-1905', 'dd-mm-yyyy'), 'Veruca', 'Lattimore', 'Meppel', '"giborei israel"', 143, 'v.lattimore@priorityexpress.nl', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (51866848, to_date('28-12-2009', 'dd-mm-yyyy'), 'Derek', 'Rains', 'Waterloo', '"avtalyon"', 138, 'derek.rains@gentrasystems.ca', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (83442309, to_date('20-05-1900', 'dd-mm-yyyy'), 'Cesar', 'Tempest', 'Lakeville', '"baal hatanya"', 34, 'c.tempest@bat.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (64975686, to_date('27-01-1968', 'dd-mm-yyyy'), 'Giovanni', 'Wayans', 'Guamo', '"bagano"', 77, 'giovanni.wayans@wrgservices.it', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (99956255, to_date('28-03-2008', 'dd-mm-yyyy'), 'Scarlett', 'Griffiths', 'Farnham', '"al-harizi"', 116, 'scarlett.g@intel.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (92676944, to_date('04-03-1927', 'dd-mm-yyyy'), 'Lucinda', 'Gold', 'Peachtree City', '"beit horon"', 55, 'lgold@bestever.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (11112799, to_date('17-09-2018', 'dd-mm-yyyy'), 'Beth', 'Sandler', 'Kungki', '"ben azay"', 91, 'beth.sandler@lfg.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (66104818, to_date('12-04-1952', 'dd-mm-yyyy'), 'Ann', 'Ruiz', 'Turku', '"aluf hanizachon"', 67, 'ann.ruiz@fam.fi', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22934957, to_date('17-06-2013', 'dd-mm-yyyy'), 'Kid', 'Jolie', 'Hounslow', '"ezra"', 11, 'kid.jolie@usenergyservices.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (3691273, to_date('20-06-2016', 'dd-mm-yyyy'), 'Jude', 'Garner', 'Salzburg', '"haadmor merojin"', 11, 'jgarner@sds.at', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (62361759, to_date('08-09-1959', 'dd-mm-yyyy'), 'Jonny Lee', 'Satriani', 'Auckland', '"bagano"', 6, 'jsatriani@gateway.nz', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23331954, to_date('27-01-1934', 'dd-mm-yyyy'), 'Anjelica', 'Sweeney', 'Szazhalombatta', '"admorei alexander"', 143, 'anjelicas@lms.hu', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (36378696, to_date('08-02-1969', 'dd-mm-yyyy'), 'William', 'Chestnut', 'Portland', '"donnolo"', 11, 'williamc@pioneerdatasystems.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (339362, to_date('19-02-1936', 'dd-mm-yyyy'), 'Samantha', 'Sanchez', 'Brisbane', '"habanim"', 71, 'samantha.sanchez@democracydata.au', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (11534770, to_date('14-01-1926', 'dd-mm-yyyy'), 'Kurtwood', 'Leary', 'Massagno', '"amos"', 73, 'kleary@genextechnologies.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (3962688, to_date('14-06-2009', 'dd-mm-yyyy'), 'Renee', 'McGinley', 'Lake Bluff', '"abu hatseira"', 138, 'rmcginley@fns.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (6505329, to_date('12-01-1984', 'dd-mm-yyyy'), 'Neneh', 'Love', 'Santa Clarita', '"ben gurion"', 81, 'neneh@spinnakerexploration.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (38327601, to_date('24-07-1918', 'dd-mm-yyyy'), 'Dom', 'Alexander', 'Padova', '"givat pinhas"', 141, 'dom.a@americanland.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30241470, to_date('04-02-1972', 'dd-mm-yyyy'), 'Joey', 'Savage', 'Hiller?d', '"haadmormis spinka"', 76, 'joey.s@parksite.dk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (63532139, to_date('16-05-2003', 'dd-mm-yyyy'), 'Carole', 'Gold', 'Mito', '"damesek eliezer"', 98, 'carole.gold@ceom.jp', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (60078010, to_date('26-12-1929', 'dd-mm-yyyy'), 'Lydia', 'Garr', 'Belo Horizonte', '"bar kokhba"', 1, 'lydia.garr@providentbancorp.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (28702001, to_date('16-04-1949', 'dd-mm-yyyy'), 'Orlando', 'Wakeling', 'Saint Ouen', '"ben ptachia"', 100, 'orlando.wakeling@prometheuslaboratories.', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (762754, to_date('21-08-2021', 'dd-mm-yyyy'), 'Vienna', 'Coe', 'Altamonte Springs', '"beit shammai"', 14, 'vienna.coe@kellogg.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (11253588, to_date('17-04-2015', 'dd-mm-yyyy'), 'Ceili', 'Chapman', 'Luedenscheid', '"aharon dov"', 111, 'ceili.chapman@inspirationsoftware.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (69408426, to_date('01-03-2002', 'dd-mm-yyyy'), 'Angelina', 'O''Hara', 'Laredo', '"baal shem tov"', 21, 'aohara@simplycertificates.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (82760640, to_date('05-07-1998', 'dd-mm-yyyy'), 'Kevin', 'Gooding', 'Arlington', '"dakar"', 2, 'kgooding@topicsentertainment.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (96122559, to_date('08-08-1905', 'dd-mm-yyyy'), 'Wang', 'Moffat', 'Nantes', 'abarbanel', 75, 'wang.moffat@trekequipment.fr', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (93842287, to_date('22-05-1918', 'dd-mm-yyyy'), 'Taylor', 'Breslin', 'Koppl', '"emek jezreel"', 67, 'taylor.breslin@ksj.at', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (35448349, to_date('01-02-1966', 'dd-mm-yyyy'), 'Miki', 'Charles', 'Hearst', '"ezra"', 41, 'miki.charles@kis.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (9754733, to_date('03-02-1906', 'dd-mm-yyyy'), 'Tilda', 'Miller', 'London', '"beit horon"', 130, 'tilda.miller@pearllawgroup.ca', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (73937851, to_date('03-02-2020', 'dd-mm-yyyy'), 'Edwin', 'Vassar', 'Wavre', '"baruch hirsch"', 69, 'evassar@cascadebancorp.be', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (38346892, to_date('12-11-1920', 'dd-mm-yyyy'), 'Russell', 'Cruz', 'Agoncillo', '"gordon"', 2, 'russell.cruz@officedepot.es', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79915919, to_date('07-02-1949', 'dd-mm-yyyy'), 'Mint', 'Clayton', 'Lake worth', '"chida"', 15, 'mint@sunstream.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54138899, to_date('05-07-2002', 'dd-mm-yyyy'), 'Charlize', 'Burns', 'Seattle', '"bialik"', 11, 'charlize.burns@north.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (44213484, to_date('14-09-1927', 'dd-mm-yyyy'), 'Elizabeth', 'Marsden', 'Oppenheim', '"derekh sheshet hayamim"', 37, 'elizabeth.marsden@bigyanksports.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23071061, to_date('27-12-1981', 'dd-mm-yyyy'), 'Howie', 'Hayek', 'Bkk', '"baal hatanya"', 43, 'howie.hayek@gtp.th', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (66340561, to_date('29-01-1943', 'dd-mm-yyyy'), 'Vincent', 'Noseworthy', 'Laredo', '"aluf simchoni"', 15, 'v.noseworthy@freedommedical.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (61586151, to_date('09-10-2019', 'dd-mm-yyyy'), 'Graham', 'Badalucco', 'Slough', '"borochov"', 98, 'g.badalucco@enterprise.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (34560079, to_date('06-08-2022', 'dd-mm-yyyy'), 'Petula', 'Byrd', 'Maidenhead', '"beer mayim hayim"', 48, 'petula@noodles.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (39385617, to_date('27-12-1919', 'dd-mm-yyyy'), 'Robert', 'Kahn', 'Highton', '"beit shammai"', 142, 'robert.kahn@oneidafinancial.au', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (52466644, to_date('20-04-1913', 'dd-mm-yyyy'), 'Udo', 'Cumming', 'La Plata', '"gnai gad"', 47, 'u.cumming@extremepizza.ar', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (91966445, to_date('03-08-1962', 'dd-mm-yyyy'), 'Marie', 'Puckett', 'Ft. Lauderdale', '"alsheikh"', 59, 'marie.puckett@ads.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (24168528, to_date('25-11-1962', 'dd-mm-yyyy'), 'Cloris', 'Greenwood', 'Pitstone', '"eshel abraham"', 44, 'cloris.greenwood@ultimus.uk', 'F');
commit;
prompt 500 records committed...
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (11311383, to_date('19-07-1986', 'dd-mm-yyyy'), 'Tom', 'Furtado', 'Hannover', '"ben azay"', 81, 'tom.furtado@ufs.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (13081784, to_date('14-11-1990', 'dd-mm-yyyy'), 'Claude', 'Downey', 'Los Alamos', '"admorei alexander"', 125, 'claude.d@bioanalytical.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (42700073, to_date('08-12-1973', 'dd-mm-yyyy'), 'Sylvester', 'Harrelson', 'Rheinfelden', '"esther hamalka"', 29, 'sylvesterh@fab.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (29995549, to_date('05-09-1923', 'dd-mm-yyyy'), 'Barbara', 'Hidalgo', 'Szazhalombatta', '"amos"', 74, 'barbara.hidalgo@qls.hu', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54372445, to_date('10-09-1951', 'dd-mm-yyyy'), 'Terri', 'Luongo', 'O''fallon', '"greenberg"', 91, 'terri.luongo@ungertechnologies.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (62478319, to_date('04-11-2017', 'dd-mm-yyyy'), 'Joanna', 'Gatlin', 'Edison', '"abu hatseira"', 121, 'joanna.gatlin@ahl.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (36725954, to_date('02-12-1908', 'dd-mm-yyyy'), 'Nigel', 'McCready', 'Erpe-Mere', '"admorei alexander"', 84, 'nigelm@elmco.be', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (39571034, to_date('14-02-1971', 'dd-mm-yyyy'), 'Cameron', 'Botti', 'Enfield', '"baruch hirsch"', 76, 'cameron.botti@ezecastlesoftware.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (28136482, to_date('13-06-1982', 'dd-mm-yyyy'), 'Phil', 'Snow', 'Herford', '"ahiya hashiloni"', 53, 'p.snow@sfmai.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (7631405, to_date('06-05-1958', 'dd-mm-yyyy'), 'Bobbi', 'Hutton', 'Kaysville', '"avtalyon"', 135, 'bobbih@mavericktechnologies.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (12675160, to_date('03-12-1993', 'dd-mm-yyyy'), 'Melba', 'Bugnon', 'Mainz-kastel', '"givat pinhas"', 55, 'mbugnon@qas.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (37751547, to_date('17-06-1968', 'dd-mm-yyyy'), 'Jena', 'Palin', 'Tadley', '"gold"', 111, 'jena.p@savela.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (86755439, to_date('16-09-1983', 'dd-mm-yyyy'), 'Mitchell', 'Kweller', 'Los Alamos', '"haadmor mikotsk"', 3, 'mitchell.kweller@kmart.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (58660984, to_date('11-11-1935', 'dd-mm-yyyy'), 'Ralph', 'Marie', 'Kaohsiung', '"chida"', 92, 'ralph.marie@abs.cn', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (51358112, to_date('04-09-1967', 'dd-mm-yyyy'), 'Ike', 'Dafoe', 'Bruneck', '"gnai gad"', 4, 'ike.d@trc.it', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (19634791, to_date('06-07-1928', 'dd-mm-yyyy'), 'Vivica', 'Curfman', 'Bolzano', '"avodat israel"', 58, 'vivica@linersdirect.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (72386552, to_date('25-07-1999', 'dd-mm-yyyy'), 'Davy', 'Berry', 'Ashland', '"bar kokhba"', 65, 'davy.b@connected.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (32887340, to_date('23-10-1957', 'dd-mm-yyyy'), 'Ritchie', 'Sherman', 'Chiba', '"eshel abraham"', 76, 'ritchie.sherman@qas.jp', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (28415918, to_date('18-03-1902', 'dd-mm-yyyy'), 'Forest', 'Farris', 'Pirapora bom Jesus', '"ami"', 50, 'f.farris@nexxtworks.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (3267255, to_date('16-09-1912', 'dd-mm-yyyy'), 'Goldie', 'Crow', 'Doncaster', '"ben azay"', 131, 'gcrow@marketbased.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (72144386, to_date('05-09-2008', 'dd-mm-yyyy'), 'Ted', 'Haslam', 'Hannover', '"habarzel"', 89, 'ted@digitalmotorworks.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (10612573, to_date('09-02-2023', 'dd-mm-yyyy'), 'Collective', 'Marx', 'Webster Groves', '"greenberg"', 19, 'collective.marx@knightsbridge.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (76734801, to_date('27-10-1954', 'dd-mm-yyyy'), 'Lou', 'Red', 'Deerfield', '"elkabetz"', 2, 'lou.red@escalade.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (97005970, to_date('03-01-2017', 'dd-mm-yyyy'), 'Mena', 'Giannini', 'Redding', '"haadmormis spinka"', 93, 'm.giannini@fab.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (6485018, to_date('19-11-1965', 'dd-mm-yyyy'), 'Barbara', 'Ledger', 'Morioka', '"donnolo"', 149, 'barbara.ledger@navigatorsystems.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (49055065, to_date('16-05-1961', 'dd-mm-yyyy'), 'Jay', 'Fonda', 'Lecanto', '"eliyahu hanavi"', 20, 'jay.fonda@vitacostcom.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (54829543, to_date('05-02-1911', 'dd-mm-yyyy'), 'Merillee', 'Danger', 'Arlington', '"eshel abraham"', 121, 'merillee.danger@ungertechnologies.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (24125915, to_date('06-08-1953', 'dd-mm-yyyy'), 'Jean-Claude', 'Tempest', 'Rome', '"beit yosef"', 108, 'jeanclaudet@gillette.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (62531988, to_date('06-07-1918', 'dd-mm-yyyy'), 'Vertical', 'Brooke', 'Grand-mere', '"bertanura"', 15, 'v.brooke@walmartstores.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (50683846, to_date('02-06-1945', 'dd-mm-yyyy'), 'Harry', 'Whitwam', 'Takapuna', '"beit shammai"', 30, 'harry.whitwam@carboceramics.nz', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (75003632, to_date('16-06-1913', 'dd-mm-yyyy'), 'Roy', 'Heslov', 'Norderstedt', '"eliyahu hanavi"', 53, 'roy@universalsolutions.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (70424737, to_date('23-06-2019', 'dd-mm-yyyy'), 'Breckin', 'Spiner', 'New boston', '"abba hillel silver"', 102, 'breckin.spiner@elite.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (9228447, to_date('14-12-1979', 'dd-mm-yyyy'), 'Harold', 'Popper', 'Fukushima', '"esther hamalka"', 12, 'h.popper@nsd.jp', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (76081567, to_date('22-03-2004', 'dd-mm-yyyy'), 'Victoria', 'Carrey', 'Altamonte Springs', '"ahavat shalom"', 27, 'victoria.carrey@gha.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (64292019, to_date('02-11-1928', 'dd-mm-yyyy'), 'Jennifer', 'Meniketti', 'Woodbridge', '"haahim meir"', 94, 'jennifer@nmr.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (14291343, to_date('02-12-1993', 'dd-mm-yyyy'), 'Jeanne', 'Hopper', 'Bergara', '"binyamin avraham"', 17, 'jeanne.hopper@abs.es', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (96655772, to_date('23-07-1932', 'dd-mm-yyyy'), 'Diamond', 'Schreiber', 'Lima', '"dr. broyer"', 109, 'd.schreiber@mathis.pe', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (10199417, to_date('30-12-1965', 'dd-mm-yyyy'), 'Frank', 'Avital', 'Nagasaki', '"baal hatanya"', 45, 'frank.avital@anworthmortgage.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (13010901, to_date('07-05-1922', 'dd-mm-yyyy'), 'Judd', 'Hudson', 'New orleans', '"bialik"', 89, 'judd@hiltonhotels.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (66107157, to_date('30-04-2011', 'dd-mm-yyyy'), 'Lucinda', 'Hawn', 'Newbury', '"aluf hanizachon"', 95, 'lucindah@cima.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (23089984, to_date('19-08-1936', 'dd-mm-yyyy'), 'Roscoe', 'Holeman', 'Juazeiro', '"donnolo"', 60, 'roscoe.holeman@ceom.br', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (10517860, to_date('09-10-1960', 'dd-mm-yyyy'), 'Stanley', 'May', 'Juazeiro', '"don yoseph nasi"', 148, 'smay@lloydgroup.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (87785289, to_date('20-04-1903', 'dd-mm-yyyy'), 'Swoosie', 'Vicious', 'Oosterhout', '"haadmor mibelz"', 74, 'swoosie.vicious@americanmegacom.nl', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (61498790, to_date('16-01-1910', 'dd-mm-yyyy'), 'Gino', 'Austin', 'Edenbridge', '"habanim"', 78, 'g.austin@kramontrealty.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (98135112, to_date('12-03-1976', 'dd-mm-yyyy'), 'Nikki', 'Cale', 'Fleet', '"ami"', 25, 'nikki@mindiq.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (82112662, to_date('30-08-2023', 'dd-mm-yyyy'), 'Kasey', 'Cumming', 'Cottbus', '"al-harizi"', 16, 'kasey.c@meghasystems.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (26307234, to_date('11-09-2018', 'dd-mm-yyyy'), 'Tobey', 'Nugent', 'Hackensack', '"haadmon minadvorna"', 57, 'tobeyn@tigris.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (88061228, to_date('04-03-1936', 'dd-mm-yyyy'), 'Lauren', 'Dafoe', 'Slmea', '"bet hilel"', 85, 'lauren.dafoe@pepsico.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79182818, to_date('29-03-2000', 'dd-mm-yyyy'), 'Donal', 'Magnuson', 'Ulm', '"aluf hanizachon"', 51, 'donal.magnuson@wyeth.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (33059883, to_date('12-09-1946', 'dd-mm-yyyy'), 'Davy', 'DeLuise', 'Heubach', '"daniel"', 108, 'davyd@tripwire.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (21381639, to_date('19-03-1942', 'dd-mm-yyyy'), 'Queen', 'Schock', 'Ferraz  vasconcelos', '"david pinkas"', 126, 'queen@cima.br', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (65063750, to_date('04-09-1949', 'dd-mm-yyyy'), 'Forest', 'Guzman', 'Tampa', '"dov hoz"', 47, 'forestg@fam.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (65755336, to_date('12-01-1949', 'dd-mm-yyyy'), 'Mykelti', 'Tolkan', 'Shelton', '"bin-nun"', 87, 'm.tolkan@marketfirst.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (67443455, to_date('15-06-2002', 'dd-mm-yyyy'), 'Jeff', 'Adams', 'Carlsbad', '"bet hilel"', 150, 'jeff.adams@allstar.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79987197, to_date('14-02-1959', 'dd-mm-yyyy'), 'Elle', 'Stiles', 'Cannock', '"haarmor miradzymin"', 90, 'elle@sps.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30104584, to_date('23-11-1968', 'dd-mm-yyyy'), 'Jean-Claude', 'Fariq', 'West Point', '"derekh sheshet hayamim"', 28, 'jeanclaude.fariq@gci.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (38066771, to_date('18-10-1916', 'dd-mm-yyyy'), 'Victoria', 'Krumholtz', 'Lake worth', '"achiezer"', 46, 'victoria.krumholtz@aoltimewarner.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (8078236, to_date('16-03-1912', 'dd-mm-yyyy'), 'Caroline', 'Plimpton', 'Bozeman', '"bertanura"', 148, 'caroline.plimpton@ach.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (81946276, to_date('19-01-2001', 'dd-mm-yyyy'), 'Tracy', 'Kudrow', 'Ljubljana', '"aviad"', 141, 'tkudrow@staffforce.si', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (53663079, to_date('06-04-2022', 'dd-mm-yyyy'), 'Kelly', 'Burns', 'Mexico City', '"beit shammai"', 7, 'kelly.burns@pinnaclestaffing.mx', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (2852371, to_date('26-08-1934', 'dd-mm-yyyy'), 'Joshua', 'Worrell', 'Maintenon', '"emek jezreel"', 50, 'joshua.worrell@johnson.fr', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (40573112, to_date('12-08-2011', 'dd-mm-yyyy'), 'Millie', 'Fender', 'Santa Clarat', '"ben azay"', 47, 'millie@gillette.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (76641085, to_date('14-04-2009', 'dd-mm-yyyy'), 'Millie', 'Slater', 'Seoul', '"gnishovski"', 125, 'millie.slater@contract.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (3408201, to_date('26-08-2023', 'dd-mm-yyyy'), 'Kieran', 'Pullman', 'Tilst', '"beit horon"', 82, 'kieran.p@ivorysystems.dk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (53815807, to_date('22-04-1945', 'dd-mm-yyyy'), 'Cameron', 'Rhys-Davies', 'Appenzell', '"dr. broyer"', 47, 'cameron.rhysdavies@ait.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (70363242, to_date('02-12-1980', 'dd-mm-yyyy'), 'Jonathan', 'Coverdale', 'Koufu', '"gaonei brisk"', 129, 'jonathan.coverdale@ceom.jp', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (60487139, to_date('21-04-2009', 'dd-mm-yyyy'), 'Machine', 'Arkin', 'Rome', '"ben gurion"', 105, 'm.arkin@tripwire.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (39113223, to_date('01-01-1915', 'dd-mm-yyyy'), 'Janeane', 'Camp', 'Marietta', '"haadmon minadvorna"', 17, 'janeane@north.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22642135, to_date('18-07-1981', 'dd-mm-yyyy'), 'Jamie', 'Horton', 'M?nster', '"ahavat shalom"', 130, 'jamie.horton@doctorsassociates.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (37099706, to_date('19-09-2018', 'dd-mm-yyyy'), 'Vincent', 'Shorter', 'Williamstown', '"avraham ben david"', 119, 'vincent@fmi.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (4245084, to_date('31-12-1928', 'dd-mm-yyyy'), 'Sarah', 'Vance', 'Lyon', '"ben arieh"', 60, 'sarah.v@providentbancorp.fr', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (65600702, to_date('10-06-1993', 'dd-mm-yyyy'), 'Remy', 'Hagar', 'Mariano Comense', 'abarbanel', 109, 'remy@reckittbenckiser.it', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (69335813, to_date('17-08-1945', 'dd-mm-yyyy'), 'Bridgette', 'Larter', 'Riverdale', '"alsheikh"', 68, 'b.larter@ait.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (92758208, to_date('22-10-1927', 'dd-mm-yyyy'), 'John', 'Rourke', 'Immenstaad', '"haadmormis spinka"', 118, 'john.rourke@mss.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (44856597, to_date('17-03-1967', 'dd-mm-yyyy'), 'Coley', 'Guzman', 'Vancouver', '"dov hoz"', 41, 'coley.guzman@atg.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (19084484, to_date('27-09-1980', 'dd-mm-yyyy'), 'Kristin', 'Sledge', 'Maintenon', '"bagano"', 119, 'kristin.sledge@base.fr', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (14432183, to_date('08-06-1904', 'dd-mm-yyyy'), 'Wally', 'Choice', 'Melrose park', '"aharonovitch"', 17, 'wallyc@egroup.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (25128415, to_date('11-03-1908', 'dd-mm-yyyy'), 'Ty', 'Aaron', 'Schenectady', '"derekh sheshet hayamim"', 142, 't.aaron@paintedword.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (79699806, to_date('13-10-1996', 'dd-mm-yyyy'), 'Christine', 'Hunter', 'Ani?res', '"abba hillel silver"', 34, 'christine.hunter@hitechpharmacal.ch', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (13736563, to_date('26-02-1948', 'dd-mm-yyyy'), 'Diane', 'Cross', 'Breda', '"elisha"', 123, 'diane.cross@providenceservice.nl', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (90612275, to_date('08-05-1967', 'dd-mm-yyyy'), 'Billy', 'Reinhold', 'Berkshire', '"haadmor miznaz"', 115, 'billy.r@tropicaloasis.uk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (15613623, to_date('08-02-1927', 'dd-mm-yyyy'), 'Carlene', 'Gayle', 'Verdun', '"greenberg"', 9, 'carlene@ibfh.ca', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (10775180, to_date('08-08-1994', 'dd-mm-yyyy'), 'Alannah', 'Raitt', 'Adelaide', '"eli hacohen"', 75, 'alannah.raitt@neogen.au', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (27425173, to_date('03-01-2001', 'dd-mm-yyyy'), 'Chazz', 'Armatrading', 'Miami', '"amos"', 3, 'chazz@safeway.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (76291954, to_date('14-10-1932', 'dd-mm-yyyy'), 'Rip', 'Allen', 'Mason', '"dov hoz"', 137, 'rip@operationaltechnologies.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (53479361, to_date('19-03-1981', 'dd-mm-yyyy'), 'Carolyn', 'Deschanel', 'Kaiserslautern', '"bradnshtetter"', 70, 'carolynd@printtech.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (88645079, to_date('22-04-1925', 'dd-mm-yyyy'), 'Earl', 'Rucker', 'Steyr', '"bertanura"', 32, 'earl@kingston.at', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (97438296, to_date('13-04-1981', 'dd-mm-yyyy'), 'Joe', 'Weaver', 'Taoyuan', '"bin-nun"', 54, 'joe.weaver@fsffinancial.tw', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (9669009, to_date('19-01-1938', 'dd-mm-yyyy'), 'Naomi', 'Cherry', 'Wageningen', '"gaonei brisk"', 98, 'naomi.cherry@shirtfactory.nl', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (22010069, to_date('09-06-2023', 'dd-mm-yyyy'), 'Maggie', 'Hoskins', 'Bolzano', '"bagano"', 50, 'm.hoskins@mms.it', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (77487007, to_date('22-08-1910', 'dd-mm-yyyy'), 'Stellan', 'Charles', 'Mechelen', '"haadmormis spinka"', 68, 'stellan.charles@formatech.be', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (60383864, to_date('21-06-1924', 'dd-mm-yyyy'), 'Robert', 'Arquette', 'Bergen', '"eshel abraham"', 23, 'robert.a@lindin.dk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (50864871, to_date('18-10-1996', 'dd-mm-yyyy'), 'Dennis', 'Kristofferson', 'Zafferana Etnea', '"aviad"', 45, 'dennis.k@walmartstores.it', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (76364758, to_date('25-01-1969', 'dd-mm-yyyy'), 'Al', 'Yulin', 'Bham', '"beer mayim hayim"', 111, 'al.y@bashen.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (75033915, to_date('13-08-2022', 'dd-mm-yyyy'), 'Rob', 'Lavigne', 'Leimen', '"dov gruner"', 14, 'rlavigne@astute.de', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (84377393, to_date('11-05-1957', 'dd-mm-yyyy'), 'Gene', 'Humphrey', 'Thame', '"golomb"', 93, 'ghumphrey@stmaryland.uk', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (30681355, to_date('07-08-1977', 'dd-mm-yyyy'), 'Minnie', 'Van Shelton', 'Mt. Laurel', '"borochov"', 142, 'minnie.v@mls.com', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (64070950, to_date('26-03-2013', 'dd-mm-yyyy'), 'Rosco', 'Lipnicki', 'Hannover', '"david hamelekh"', 102, 'rosco.lipnicki@digitalmotorworks.de', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (94579735, to_date('08-11-2016', 'dd-mm-yyyy'), 'Colin', 'Janney', 'Los Angeles', '"amos"', 83, 'cjanney@curagroup.com', 'M');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (38289354, to_date('08-10-1910', 'dd-mm-yyyy'), 'Delroy', 'Fichtner', 'Maidstone', '"david pinkas"', 92, 'delroy.fichtner@onstaff.uk', 'F');
commit;
prompt 600 records committed...
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (80306694, to_date('03-06-2014', 'dd-mm-yyyy'), 'Rachid', 'Alexander', 'Horsens', '"beit horon"', 32, 'rachida@democracydata.dk', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (20600123, to_date('02-09-2005', 'dd-mm-yyyy'), 'Jann', 'Koteas', 'Chennai', '"donnolo"', 24, 'j.koteas@quakercitybancorp.in', 'F');
insert into PERSON (personid, birthdate, firstname, lastname, city, address, housenum, email, gender)
values (21837118, to_date('18-09-1946', 'dd-mm-yyyy'), 'Frederic', 'Cazale', 'Lancaster', '"derekh sheshet hayamim"', 139, 'frederic.cazale@fam.com', 'F');
commit;
prompt 603 records loaded
prompt Loading GYM_MEMBER...
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-09-2020', 'dd-mm-yyyy'), null, 91349986);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-08-2000', 'dd-mm-yyyy'), null, 8106308);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-05-2005', 'dd-mm-yyyy'), null, 27611255);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-06-2009', 'dd-mm-yyyy'), null, 53737541);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-12-2001', 'dd-mm-yyyy'), null, 37921065);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-12-2021', 'dd-mm-yyyy'), null, 39658357);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-03-2023', 'dd-mm-yyyy'), null, 88726887);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('22-12-2003', 'dd-mm-yyyy'), null, 29207505);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-04-2000', 'dd-mm-yyyy'), null, 19099801);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-06-2003', 'dd-mm-yyyy'), null, 23386909);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-10-2008', 'dd-mm-yyyy'), null, 31024696);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-03-2005', 'dd-mm-yyyy'), null, 35965202);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-06-2022', 'dd-mm-yyyy'), null, 30434462);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-10-2005', 'dd-mm-yyyy'), null, 32128888);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-02-2018', 'dd-mm-yyyy'), null, 54968773);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-11-2019', 'dd-mm-yyyy'), null, 79192786);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-11-2021', 'dd-mm-yyyy'), null, 79693276);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-04-2024', 'dd-mm-yyyy'), null, 92881950);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-05-2006', 'dd-mm-yyyy'), null, 81325843);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-06-2024', 'dd-mm-yyyy'), null, 45412385);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-07-2004', 'dd-mm-yyyy'), null, 33147678);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-05-2003', 'dd-mm-yyyy'), null, 2938480);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-08-2023', 'dd-mm-yyyy'), null, 80589493);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-01-2024', 'dd-mm-yyyy'), null, 68928002);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-03-2009', 'dd-mm-yyyy'), null, 47362950);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-07-2002', 'dd-mm-yyyy'), null, 81654249);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('21-11-2009', 'dd-mm-yyyy'), null, 29291564);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-10-2013', 'dd-mm-yyyy'), null, 34241869);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('22-02-2005', 'dd-mm-yyyy'), null, 70985710);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-03-2002', 'dd-mm-yyyy'), null, 66781374);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-09-2006', 'dd-mm-yyyy'), null, 98037672);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-07-2016', 'dd-mm-yyyy'), null, 35042992);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-08-2021', 'dd-mm-yyyy'), null, 10481000);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-08-2004', 'dd-mm-yyyy'), null, 6217460);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-01-2023', 'dd-mm-yyyy'), null, 98877580);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-03-2018', 'dd-mm-yyyy'), null, 64820168);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-12-2019', 'dd-mm-yyyy'), null, 64660127);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-10-2010', 'dd-mm-yyyy'), null, 86453357);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-01-2014', 'dd-mm-yyyy'), null, 61698245);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-01-2018', 'dd-mm-yyyy'), null, 70178481);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-10-2012', 'dd-mm-yyyy'), null, 10395000);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-08-2003', 'dd-mm-yyyy'), null, 71649431);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-08-2004', 'dd-mm-yyyy'), null, 41060366);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-01-2017', 'dd-mm-yyyy'), null, 92758832);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-02-2010', 'dd-mm-yyyy'), null, 4370439);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-01-2014', 'dd-mm-yyyy'), null, 82804437);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-05-2020', 'dd-mm-yyyy'), null, 24317288);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-10-2004', 'dd-mm-yyyy'), null, 67481341);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-08-2018', 'dd-mm-yyyy'), null, 51948030);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-03-2011', 'dd-mm-yyyy'), null, 73917560);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-12-2014', 'dd-mm-yyyy'), null, 22820514);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-11-2017', 'dd-mm-yyyy'), null, 42274072);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-12-2014', 'dd-mm-yyyy'), null, 31661429);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-01-2004', 'dd-mm-yyyy'), null, 90824185);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-04-2012', 'dd-mm-yyyy'), null, 70595940);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-09-2022', 'dd-mm-yyyy'), null, 56902043);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('21-11-2000', 'dd-mm-yyyy'), null, 44824683);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-05-2013', 'dd-mm-yyyy'), null, 11798215);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-02-2007', 'dd-mm-yyyy'), null, 34375443);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-06-2017', 'dd-mm-yyyy'), null, 81238413);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-06-2020', 'dd-mm-yyyy'), null, 65011242);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-05-2013', 'dd-mm-yyyy'), null, 64027261);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-09-2021', 'dd-mm-yyyy'), null, 2505457);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-01-2017', 'dd-mm-yyyy'), null, 45505216);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-03-2012', 'dd-mm-yyyy'), null, 21317536);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-03-2005', 'dd-mm-yyyy'), null, 41518918);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-08-2006', 'dd-mm-yyyy'), null, 1055314);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-04-2021', 'dd-mm-yyyy'), null, 5654694);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-06-2016', 'dd-mm-yyyy'), null, 2376368);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-10-2022', 'dd-mm-yyyy'), null, 19894147);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-06-2004', 'dd-mm-yyyy'), null, 23020212);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-09-2016', 'dd-mm-yyyy'), null, 18340976);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('21-01-2025', 'dd-mm-yyyy'), null, 48277353);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('12-06-2013', 'dd-mm-yyyy'), null, 69838192);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-09-2013', 'dd-mm-yyyy'), null, 89421322);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-08-2001', 'dd-mm-yyyy'), null, 43049144);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-08-2019', 'dd-mm-yyyy'), null, 23114002);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-04-2012', 'dd-mm-yyyy'), null, 25139076);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-12-2012', 'dd-mm-yyyy'), null, 92566199);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-12-2013', 'dd-mm-yyyy'), null, 60940200);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-08-2017', 'dd-mm-yyyy'), null, 88634045);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-02-2004', 'dd-mm-yyyy'), null, 58647622);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-07-2012', 'dd-mm-yyyy'), null, 10951186);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-12-2002', 'dd-mm-yyyy'), null, 87218298);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-12-2003', 'dd-mm-yyyy'), null, 89122501);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-10-2004', 'dd-mm-yyyy'), null, 33449046);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-08-2007', 'dd-mm-yyyy'), null, 59413980);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-06-2010', 'dd-mm-yyyy'), null, 54638372);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-10-2012', 'dd-mm-yyyy'), null, 96940369);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-04-2011', 'dd-mm-yyyy'), null, 39997409);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-10-2010', 'dd-mm-yyyy'), null, 730279);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-01-2007', 'dd-mm-yyyy'), null, 11221464);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-07-2012', 'dd-mm-yyyy'), null, 22432753);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-06-2024', 'dd-mm-yyyy'), null, 6603015);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-05-2013', 'dd-mm-yyyy'), null, 7860731);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-08-2022', 'dd-mm-yyyy'), null, 27803037);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-03-2015', 'dd-mm-yyyy'), null, 53483220);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-09-2012', 'dd-mm-yyyy'), null, 14130558);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-07-2024', 'dd-mm-yyyy'), null, 11169896);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-12-2011', 'dd-mm-yyyy'), null, 16134366);
commit;
prompt 100 records committed...
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-05-2020', 'dd-mm-yyyy'), null, 50968404);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-11-2021', 'dd-mm-yyyy'), null, 55743766);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-02-2016', 'dd-mm-yyyy'), null, 55125627);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-03-2017', 'dd-mm-yyyy'), null, 21293730);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-08-2020', 'dd-mm-yyyy'), null, 52313162);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-09-2019', 'dd-mm-yyyy'), null, 97813459);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-12-2019', 'dd-mm-yyyy'), null, 90372109);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-08-2016', 'dd-mm-yyyy'), null, 25112977);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-07-2013', 'dd-mm-yyyy'), null, 43217671);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-09-2018', 'dd-mm-yyyy'), null, 91060231);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-03-2022', 'dd-mm-yyyy'), null, 62214926);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-01-2013', 'dd-mm-yyyy'), null, 99375320);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-10-2023', 'dd-mm-yyyy'), null, 53109927);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-02-2024', 'dd-mm-yyyy'), null, 81884643);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-10-2008', 'dd-mm-yyyy'), null, 27719925);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-12-2007', 'dd-mm-yyyy'), null, 26278207);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-04-2006', 'dd-mm-yyyy'), null, 52154939);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-01-2011', 'dd-mm-yyyy'), null, 22920110);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-04-2009', 'dd-mm-yyyy'), null, 91282035);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-01-2004', 'dd-mm-yyyy'), null, 28937802);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('10-05-2018', 'dd-mm-yyyy'), null, 40293735);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-08-2014', 'dd-mm-yyyy'), null, 24504822);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-01-2020', 'dd-mm-yyyy'), null, 99588313);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('21-05-2005', 'dd-mm-yyyy'), null, 37780928);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-12-2006', 'dd-mm-yyyy'), null, 20103782);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-01-2006', 'dd-mm-yyyy'), null, 32410121);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-12-2009', 'dd-mm-yyyy'), null, 1282269);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-12-2014', 'dd-mm-yyyy'), null, 22819264);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-07-2023', 'dd-mm-yyyy'), null, 23890659);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-02-2007', 'dd-mm-yyyy'), null, 99988900);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-11-2009', 'dd-mm-yyyy'), null, 67461875);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-10-2006', 'dd-mm-yyyy'), null, 98257068);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-04-2012', 'dd-mm-yyyy'), null, 15600946);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-09-2008', 'dd-mm-yyyy'), null, 50900940);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-11-2006', 'dd-mm-yyyy'), null, 38614060);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-03-2010', 'dd-mm-yyyy'), null, 69755509);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-05-2012', 'dd-mm-yyyy'), null, 45080144);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-12-2017', 'dd-mm-yyyy'), null, 39413869);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-07-2005', 'dd-mm-yyyy'), null, 25039816);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-07-2004', 'dd-mm-yyyy'), null, 94174046);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-06-2006', 'dd-mm-yyyy'), null, 93114433);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-07-2012', 'dd-mm-yyyy'), null, 71989689);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-04-2017', 'dd-mm-yyyy'), null, 12760864);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('10-05-2014', 'dd-mm-yyyy'), null, 30411578);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-12-2013', 'dd-mm-yyyy'), null, 81329950);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-03-2015', 'dd-mm-yyyy'), null, 81276702);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-08-2023', 'dd-mm-yyyy'), null, 76960313);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-07-2005', 'dd-mm-yyyy'), null, 94475922);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-02-2005', 'dd-mm-yyyy'), null, 44715352);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-04-2008', 'dd-mm-yyyy'), null, 8796425);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-09-2015', 'dd-mm-yyyy'), null, 75363400);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-04-2025', 'dd-mm-yyyy'), null, 39725987);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-06-2014', 'dd-mm-yyyy'), null, 10854394);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('12-08-2022', 'dd-mm-yyyy'), null, 96098746);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-06-2009', 'dd-mm-yyyy'), null, 20114821);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-04-2022', 'dd-mm-yyyy'), null, 71805490);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-03-2002', 'dd-mm-yyyy'), null, 7299036);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-04-2012', 'dd-mm-yyyy'), null, 6161238);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-11-2001', 'dd-mm-yyyy'), null, 63595783);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-04-2012', 'dd-mm-yyyy'), null, 63229033);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-02-2008', 'dd-mm-yyyy'), null, 10252506);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-06-2015', 'dd-mm-yyyy'), null, 46010066);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-09-2017', 'dd-mm-yyyy'), null, 30401976);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-10-2014', 'dd-mm-yyyy'), null, 81865150);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('22-11-2017', 'dd-mm-yyyy'), null, 19067900);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-12-2022', 'dd-mm-yyyy'), null, 15992467);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-06-2016', 'dd-mm-yyyy'), null, 9077728);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-11-2002', 'dd-mm-yyyy'), null, 31393240);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-04-2015', 'dd-mm-yyyy'), null, 33915414);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-08-2001', 'dd-mm-yyyy'), null, 8081255);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-09-2018', 'dd-mm-yyyy'), null, 8752121);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-05-2000', 'dd-mm-yyyy'), null, 23760253);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-10-2013', 'dd-mm-yyyy'), null, 79260141);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-03-2006', 'dd-mm-yyyy'), null, 6628587);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-09-2020', 'dd-mm-yyyy'), null, 29203895);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-06-2004', 'dd-mm-yyyy'), null, 14658929);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-07-2009', 'dd-mm-yyyy'), null, 54033988);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-08-2002', 'dd-mm-yyyy'), null, 84018267);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-06-2000', 'dd-mm-yyyy'), null, 31471077);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-05-2022', 'dd-mm-yyyy'), null, 86272100);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-02-2019', 'dd-mm-yyyy'), null, 79910635);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-12-2007', 'dd-mm-yyyy'), null, 57601580);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-07-2022', 'dd-mm-yyyy'), null, 11451089);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-10-2024', 'dd-mm-yyyy'), null, 61751644);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-09-2002', 'dd-mm-yyyy'), null, 33300460);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-10-2013', 'dd-mm-yyyy'), null, 89596058);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-03-2005', 'dd-mm-yyyy'), null, 7488761);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-01-2001', 'dd-mm-yyyy'), null, 25627106);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-08-2015', 'dd-mm-yyyy'), null, 48084398);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('12-06-2002', 'dd-mm-yyyy'), null, 99434739);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-09-2012', 'dd-mm-yyyy'), null, 48536850);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('22-07-2017', 'dd-mm-yyyy'), null, 79815731);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-10-2021', 'dd-mm-yyyy'), null, 69270812);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-08-2020', 'dd-mm-yyyy'), null, 25539146);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-01-2020', 'dd-mm-yyyy'), null, 63990543);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-10-2012', 'dd-mm-yyyy'), null, 31750692);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-05-2017', 'dd-mm-yyyy'), null, 25602009);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-08-2002', 'dd-mm-yyyy'), null, 2450269);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-07-2020', 'dd-mm-yyyy'), null, 54757032);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-03-2014', 'dd-mm-yyyy'), null, 46532727);
commit;
prompt 200 records committed...
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-08-2010', 'dd-mm-yyyy'), null, 58513377);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-02-2020', 'dd-mm-yyyy'), null, 62449525);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-07-2021', 'dd-mm-yyyy'), null, 29742651);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-09-2002', 'dd-mm-yyyy'), null, 60776603);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-08-2023', 'dd-mm-yyyy'), null, 46639839);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-09-2002', 'dd-mm-yyyy'), null, 43436957);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-05-2002', 'dd-mm-yyyy'), null, 13356721);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-04-2010', 'dd-mm-yyyy'), null, 47501817);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-05-2007', 'dd-mm-yyyy'), null, 2591817);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-03-2001', 'dd-mm-yyyy'), null, 83376974);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-07-2017', 'dd-mm-yyyy'), null, 91089992);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-01-2015', 'dd-mm-yyyy'), null, 55252246);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-04-2005', 'dd-mm-yyyy'), null, 51397792);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('12-01-2022', 'dd-mm-yyyy'), null, 49908274);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-06-2009', 'dd-mm-yyyy'), null, 8039183);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-05-2021', 'dd-mm-yyyy'), null, 24414730);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-11-2006', 'dd-mm-yyyy'), null, 91703316);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-01-2017', 'dd-mm-yyyy'), null, 49053838);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-04-2004', 'dd-mm-yyyy'), null, 30899206);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-10-2020', 'dd-mm-yyyy'), null, 29658657);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-07-2022', 'dd-mm-yyyy'), null, 45968098);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-05-2010', 'dd-mm-yyyy'), null, 13663159);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-12-2002', 'dd-mm-yyyy'), null, 28089404);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-10-2016', 'dd-mm-yyyy'), null, 46344277);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-08-2017', 'dd-mm-yyyy'), null, 90289319);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-10-2013', 'dd-mm-yyyy'), null, 28260775);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-04-2000', 'dd-mm-yyyy'), null, 91891117);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-09-2018', 'dd-mm-yyyy'), null, 59517988);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-10-2023', 'dd-mm-yyyy'), null, 26290962);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-03-2003', 'dd-mm-yyyy'), null, 23041511);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('21-11-2006', 'dd-mm-yyyy'), null, 42322889);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-07-2004', 'dd-mm-yyyy'), null, 44597009);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-02-2022', 'dd-mm-yyyy'), null, 7164065);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-07-2007', 'dd-mm-yyyy'), null, 71375160);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-12-2014', 'dd-mm-yyyy'), null, 96511274);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-02-2016', 'dd-mm-yyyy'), null, 30463411);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-06-2023', 'dd-mm-yyyy'), null, 32846918);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-10-2011', 'dd-mm-yyyy'), null, 65545343);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-08-2016', 'dd-mm-yyyy'), null, 14725165);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-06-2021', 'dd-mm-yyyy'), null, 73434651);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-05-2022', 'dd-mm-yyyy'), null, 49084441);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-04-2016', 'dd-mm-yyyy'), null, 78118267);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-06-2024', 'dd-mm-yyyy'), null, 6292018);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('10-05-2023', 'dd-mm-yyyy'), null, 66242981);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('10-04-2014', 'dd-mm-yyyy'), null, 81005094);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-05-2008', 'dd-mm-yyyy'), null, 13346174);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-11-2008', 'dd-mm-yyyy'), null, 67887328);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('12-10-2018', 'dd-mm-yyyy'), null, 65058862);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-07-2022', 'dd-mm-yyyy'), null, 77425508);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-07-2001', 'dd-mm-yyyy'), null, 4027718);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-04-2023', 'dd-mm-yyyy'), null, 36833753);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-08-2010', 'dd-mm-yyyy'), null, 96970243);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-04-2005', 'dd-mm-yyyy'), null, 85383287);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-05-2006', 'dd-mm-yyyy'), null, 38494989);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-01-2001', 'dd-mm-yyyy'), null, 94625728);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-08-2003', 'dd-mm-yyyy'), null, 58227833);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-05-2005', 'dd-mm-yyyy'), null, 38125788);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('10-02-2003', 'dd-mm-yyyy'), null, 6717674);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-08-2005', 'dd-mm-yyyy'), null, 96973892);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-02-2010', 'dd-mm-yyyy'), null, 86272012);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-03-2012', 'dd-mm-yyyy'), null, 71263062);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-10-2004', 'dd-mm-yyyy'), null, 81190517);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-06-2001', 'dd-mm-yyyy'), null, 22657272);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-01-2025', 'dd-mm-yyyy'), null, 40091598);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-09-2014', 'dd-mm-yyyy'), null, 46327250);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('12-12-2016', 'dd-mm-yyyy'), null, 50885464);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('21-01-2012', 'dd-mm-yyyy'), null, 44623593);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-11-2013', 'dd-mm-yyyy'), null, 27638287);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-05-2001', 'dd-mm-yyyy'), null, 99887779);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-01-2011', 'dd-mm-yyyy'), null, 1601841);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-01-2017', 'dd-mm-yyyy'), null, 24290738);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-07-2008', 'dd-mm-yyyy'), null, 88310865);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('21-12-2001', 'dd-mm-yyyy'), null, 59560586);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-12-2004', 'dd-mm-yyyy'), null, 74889890);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-01-2008', 'dd-mm-yyyy'), null, 6484710);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-11-2007', 'dd-mm-yyyy'), null, 49478035);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-08-2018', 'dd-mm-yyyy'), null, 88239853);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-12-2019', 'dd-mm-yyyy'), null, 49537257);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-09-2009', 'dd-mm-yyyy'), null, 87891090);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-11-2007', 'dd-mm-yyyy'), null, 30884206);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-11-2014', 'dd-mm-yyyy'), null, 7673525);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-10-2003', 'dd-mm-yyyy'), null, 13736563);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-05-2005', 'dd-mm-yyyy'), null, 38289354);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-10-2008', 'dd-mm-yyyy'), null, 51358112);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-01-2016', 'dd-mm-yyyy'), null, 31033551);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-07-2023', 'dd-mm-yyyy'), null, 9754733);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-08-2023', 'dd-mm-yyyy'), null, 79476002);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-04-2008', 'dd-mm-yyyy'), null, 39113223);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-04-2005', 'dd-mm-yyyy'), null, 11834830);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('22-05-2001', 'dd-mm-yyyy'), null, 91301142);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-03-2002', 'dd-mm-yyyy'), null, 53564426);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-12-2019', 'dd-mm-yyyy'), null, 66340561);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-11-2004', 'dd-mm-yyyy'), null, 29995549);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('10-02-2005', 'dd-mm-yyyy'), null, 41003550);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-05-2005', 'dd-mm-yyyy'), null, 84377393);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-11-2014', 'dd-mm-yyyy'), null, 44619573);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-08-2003', 'dd-mm-yyyy'), null, 6505329);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-05-2024', 'dd-mm-yyyy'), null, 39385617);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-01-2022', 'dd-mm-yyyy'), null, 25310202);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-07-2005', 'dd-mm-yyyy'), null, 99504749);
commit;
prompt 300 records committed...
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-03-2006', 'dd-mm-yyyy'), null, 6485018);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-08-2017', 'dd-mm-yyyy'), null, 61586151);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-04-2022', 'dd-mm-yyyy'), null, 19410869);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-03-2007', 'dd-mm-yyyy'), null, 67443455);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-11-2009', 'dd-mm-yyyy'), null, 54761032);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-11-2004', 'dd-mm-yyyy'), null, 14291343);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-12-2005', 'dd-mm-yyyy'), null, 17739277);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-10-2014', 'dd-mm-yyyy'), null, 11534770);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-04-2010', 'dd-mm-yyyy'), null, 53479361);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-01-2007', 'dd-mm-yyyy'), null, 34899411);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-07-2001', 'dd-mm-yyyy'), null, 46861565);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-04-2019', 'dd-mm-yyyy'), null, 63532139);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-09-2010', 'dd-mm-yyyy'), null, 41407116);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-06-2022', 'dd-mm-yyyy'), null, 54138899);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-11-2009', 'dd-mm-yyyy'), null, 92758208);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-08-2000', 'dd-mm-yyyy'), null, 90612275);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('12-04-2015', 'dd-mm-yyyy'), null, 79776408);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-09-2012', 'dd-mm-yyyy'), null, 9228447);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-02-2022', 'dd-mm-yyyy'), null, 59194360);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-02-2003', 'dd-mm-yyyy'), null, 55996197);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-11-2000', 'dd-mm-yyyy'), null, 27425173);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-10-2012', 'dd-mm-yyyy'), null, 62361759);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-08-2015', 'dd-mm-yyyy'), null, 69408426);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-09-2002', 'dd-mm-yyyy'), null, 37751547);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-06-2014', 'dd-mm-yyyy'), null, 54985818);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-06-2019', 'dd-mm-yyyy'), null, 72778564);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-10-2005', 'dd-mm-yyyy'), null, 24168528);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-12-2024', 'dd-mm-yyyy'), null, 65755336);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-06-2015', 'dd-mm-yyyy'), null, 75033915);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-10-2024', 'dd-mm-yyyy'), null, 62531988);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-12-2008', 'dd-mm-yyyy'), null, 1402178);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-06-2003', 'dd-mm-yyyy'), null, 22799537);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-05-2006', 'dd-mm-yyyy'), null, 58660984);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-12-2012', 'dd-mm-yyyy'), null, 88061228);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-01-2006', 'dd-mm-yyyy'), null, 90717124);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-06-2012', 'dd-mm-yyyy'), null, 73049091);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-10-2005', 'dd-mm-yyyy'), null, 22934957);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('21-01-2004', 'dd-mm-yyyy'), null, 96688141);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-07-2021', 'dd-mm-yyyy'), null, 70753258);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-03-2014', 'dd-mm-yyyy'), null, 35114555);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-11-2019', 'dd-mm-yyyy'), null, 21552259);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-08-2018', 'dd-mm-yyyy'), null, 97695307);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('21-08-2010', 'dd-mm-yyyy'), null, 36349653);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-05-2003', 'dd-mm-yyyy'), null, 79127574);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-12-2019', 'dd-mm-yyyy'), null, 26603974);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('21-10-2016', 'dd-mm-yyyy'), null, 81024259);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-04-2022', 'dd-mm-yyyy'), null, 91416453);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-03-2014', 'dd-mm-yyyy'), null, 53815807);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-10-2006', 'dd-mm-yyyy'), null, 10573645);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-10-2005', 'dd-mm-yyyy'), null, 80691820);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-10-2019', 'dd-mm-yyyy'), null, 50869449);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-06-2001', 'dd-mm-yyyy'), null, 81677750);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-09-2020', 'dd-mm-yyyy'), null, 99711392);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-11-2015', 'dd-mm-yyyy'), null, 93842287);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-09-2009', 'dd-mm-yyyy'), null, 97438296);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-01-2020', 'dd-mm-yyyy'), null, 53663079);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-11-2017', 'dd-mm-yyyy'), null, 77623385);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-12-2008', 'dd-mm-yyyy'), null, 24125915);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-02-2024', 'dd-mm-yyyy'), null, 27449638);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-11-2000', 'dd-mm-yyyy'), null, 61886377);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-08-2011', 'dd-mm-yyyy'), null, 8421656);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-11-2005', 'dd-mm-yyyy'), null, 35548775);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-10-2002', 'dd-mm-yyyy'), null, 21837118);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-08-2014', 'dd-mm-yyyy'), null, 60078010);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-03-2023', 'dd-mm-yyyy'), null, 89702370);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-02-2001', 'dd-mm-yyyy'), null, 22682672);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-10-2006', 'dd-mm-yyyy'), null, 30845995);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-11-2017', 'dd-mm-yyyy'), null, 86755439);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('10-06-2022', 'dd-mm-yyyy'), null, 30062117);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('10-03-2008', 'dd-mm-yyyy'), null, 24001000);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-05-2017', 'dd-mm-yyyy'), null, 37099706);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-06-2001', 'dd-mm-yyyy'), null, 79987197);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('12-05-2005', 'dd-mm-yyyy'), null, 13010901);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-11-2021', 'dd-mm-yyyy'), null, 54842402);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-04-2018', 'dd-mm-yyyy'), null, 6293456);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-07-2007', 'dd-mm-yyyy'), null, 51866848);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-03-2005', 'dd-mm-yyyy'), null, 76364758);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-08-2021', 'dd-mm-yyyy'), null, 38831552);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-11-2001', 'dd-mm-yyyy'), null, 73937851);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-11-2023', 'dd-mm-yyyy'), null, 86816573);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-02-2021', 'dd-mm-yyyy'), null, 17922070);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('22-04-2019', 'dd-mm-yyyy'), null, 92676944);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-11-2005', 'dd-mm-yyyy'), null, 38066771);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('10-02-2013', 'dd-mm-yyyy'), null, 8532059);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-03-2001', 'dd-mm-yyyy'), null, 76291954);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-05-2011', 'dd-mm-yyyy'), null, 44213484);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('31-07-2024', 'dd-mm-yyyy'), null, 13081784);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('12-03-2001', 'dd-mm-yyyy'), null, 40573112);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-05-2015', 'dd-mm-yyyy'), null, 8078236);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('22-04-2024', 'dd-mm-yyyy'), null, 33059883);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('10-09-2008', 'dd-mm-yyyy'), null, 95620746);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-09-2017', 'dd-mm-yyyy'), null, 97400551);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-02-2022', 'dd-mm-yyyy'), null, 54315940);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-10-2016', 'dd-mm-yyyy'), null, 62913995);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-03-2024', 'dd-mm-yyyy'), null, 38327601);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-10-2005', 'dd-mm-yyyy'), null, 83635789);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-03-2011', 'dd-mm-yyyy'), null, 23071061);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-10-2008', 'dd-mm-yyyy'), null, 69335813);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-10-2008', 'dd-mm-yyyy'), null, 3069327);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-01-2011', 'dd-mm-yyyy'), null, 10775180);
commit;
prompt 400 records committed...
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('12-03-2001', 'dd-mm-yyyy'), null, 22010069);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('21-06-2018', 'dd-mm-yyyy'), null, 46339943);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-06-2005', 'dd-mm-yyyy'), null, 54467502);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-10-2002', 'dd-mm-yyyy'), null, 42688439);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-05-2004', 'dd-mm-yyyy'), null, 61498790);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-10-2012', 'dd-mm-yyyy'), null, 45697419);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('26-07-2005', 'dd-mm-yyyy'), null, 42253574);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-03-2009', 'dd-mm-yyyy'), null, 73038198);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-10-2023', 'dd-mm-yyyy'), null, 58302395);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-08-2011', 'dd-mm-yyyy'), null, 10517860);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-12-2018', 'dd-mm-yyyy'), null, 27035808);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-11-2013', 'dd-mm-yyyy'), null, 82112662);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-04-2000', 'dd-mm-yyyy'), null, 50550367);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-02-2018', 'dd-mm-yyyy'), null, 73453807);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-04-2019', 'dd-mm-yyyy'), null, 31874543);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-04-2025', 'dd-mm-yyyy'), null, 25128415);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-06-2007', 'dd-mm-yyyy'), null, 55478450);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-01-2019', 'dd-mm-yyyy'), null, 51193500);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-12-2009', 'dd-mm-yyyy'), null, 75966451);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('15-11-2011', 'dd-mm-yyyy'), null, 64070950);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-09-2015', 'dd-mm-yyyy'), null, 11612959);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-05-2000', 'dd-mm-yyyy'), null, 75003632);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-11-2003', 'dd-mm-yyyy'), null, 23412617);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-08-2022', 'dd-mm-yyyy'), null, 36378696);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-11-2020', 'dd-mm-yyyy'), null, 5179001);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-11-2018', 'dd-mm-yyyy'), null, 26307234);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-10-2012', 'dd-mm-yyyy'), null, 66107157);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-07-2023', 'dd-mm-yyyy'), null, 50864871);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-04-2020', 'dd-mm-yyyy'), null, 53237075);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-02-2005', 'dd-mm-yyyy'), null, 50683846);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-08-2023', 'dd-mm-yyyy'), null, 57848591);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-12-2017', 'dd-mm-yyyy'), null, 62846464);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-04-2012', 'dd-mm-yyyy'), null, 62213084);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-12-2022', 'dd-mm-yyyy'), null, 81946276);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-04-2007', 'dd-mm-yyyy'), null, 30104584);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-07-2014', 'dd-mm-yyyy'), null, 30241470);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-09-2002', 'dd-mm-yyyy'), null, 16423003);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-05-2010', 'dd-mm-yyyy'), null, 3267255);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-09-2009', 'dd-mm-yyyy'), null, 64975686);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('22-08-2023', 'dd-mm-yyyy'), null, 70363242);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('03-02-2018', 'dd-mm-yyyy'), null, 40789624);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-11-2024', 'dd-mm-yyyy'), null, 4646448);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-10-2016', 'dd-mm-yyyy'), null, 98135112);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('28-01-2007', 'dd-mm-yyyy'), null, 21381639);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('22-09-2001', 'dd-mm-yyyy'), null, 76641085);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-09-2014', 'dd-mm-yyyy'), null, 77487007);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-06-2021', 'dd-mm-yyyy'), null, 76734801);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-11-2000', 'dd-mm-yyyy'), null, 28746745);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-10-2019', 'dd-mm-yyyy'), null, 70424737);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-08-2015', 'dd-mm-yyyy'), null, 90372030);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-03-2001', 'dd-mm-yyyy'), null, 29724492);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('30-05-2014', 'dd-mm-yyyy'), null, 35448349);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-10-2005', 'dd-mm-yyyy'), null, 99203358);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-02-2005', 'dd-mm-yyyy'), null, 22642135);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('16-09-2019', 'dd-mm-yyyy'), null, 14432183);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-02-2018', 'dd-mm-yyyy'), null, 9669009);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-03-2017', 'dd-mm-yyyy'), null, 32313288);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('24-03-2016', 'dd-mm-yyyy'), null, 99956255);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-07-2010', 'dd-mm-yyyy'), null, 24427407);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('20-03-2008', 'dd-mm-yyyy'), null, 22179745);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('07-09-2009', 'dd-mm-yyyy'), null, 60383864);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-02-2008', 'dd-mm-yyyy'), null, 88649232);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('11-07-2005', 'dd-mm-yyyy'), null, 20767492);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('23-06-2015', 'dd-mm-yyyy'), null, 15164192);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('06-11-2004', 'dd-mm-yyyy'), null, 44938507);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('27-04-2018', 'dd-mm-yyyy'), null, 28702001);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-02-2019', 'dd-mm-yyyy'), null, 72046835);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('19-01-2024', 'dd-mm-yyyy'), null, 50166840);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('29-06-2017', 'dd-mm-yyyy'), null, 67503959);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('01-03-2013', 'dd-mm-yyyy'), null, 2303105);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('04-02-2024', 'dd-mm-yyyy'), null, 25508039);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('05-06-2017', 'dd-mm-yyyy'), null, 13611451);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-05-2025', 'dd-mm-yyyy'), null, 30174663);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('18-03-2024', 'dd-mm-yyyy'), null, 66588970);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('25-07-2021', 'dd-mm-yyyy'), null, 314024);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-01-2001', 'dd-mm-yyyy'), null, 73593804);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-06-2006', 'dd-mm-yyyy'), null, 3691273);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('14-07-2016', 'dd-mm-yyyy'), null, 23491578);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-01-2002', 'dd-mm-yyyy'), null, 82565214);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('08-04-2005', 'dd-mm-yyyy'), null, 1934281);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('02-08-2003', 'dd-mm-yyyy'), null, 10612573);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('17-04-2017', 'dd-mm-yyyy'), null, 70389865);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-02-2002', 'dd-mm-yyyy'), null, 4245084);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('09-06-2024', 'dd-mm-yyyy'), null, 67653817);
insert into GYM_MEMBER (joindate, leavedate, personid)
values (to_date('13-12-2001', 'dd-mm-yyyy'), null, 14865178);
commit;
prompt 485 records loaded
prompt Loading GYM_MEMBER_MEDICAL_CONSTRAINS...
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Alzheimer''s disease"', 10481000);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Alzheimer''s disease"', 54138899);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Alzheimer''s disease"', 58513377);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Alzheimer''s disease"', 60078010);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Angina"', 14658929);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Angina"', 20767492);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Angina"', 64660127);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Angina"', 66340561);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Angina"', 69408426);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Angina"', 90372109);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Autism spectrum disorder (with severe sensory iss', 1934281);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Autism spectrum disorder (with severe sensory iss', 9228447);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Autism spectrum disorder (with severe sensory iss', 13663159);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Autism spectrum disorder (with severe sensory iss', 36349653);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Autism spectrum disorder (with severe sensory iss', 37921065);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Autism spectrum disorder (with severe sensory iss', 61498790);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Autism spectrum disorder (with severe sensory iss', 69755509);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Autism spectrum disorder (with severe sensory iss', 73453807);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Autism spectrum disorder (with severe sensory iss', 83376974);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Carpal tunnel syndrome"', 21293730);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Carpal tunnel syndrome"', 30845995);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Carpal tunnel syndrome"', 37780928);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Carpal tunnel syndrome"', 39658357);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Carpal tunnel syndrome"', 56902043);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Carpal tunnel syndrome"', 62449525);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Carpal tunnel syndrome"', 62531988);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Carpal tunnel syndrome"', 72778564);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Chronic obstructive pulmonary disease (COPD)"', 21293730);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Chronic obstructive pulmonary disease (COPD)"', 23386909);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Chronic obstructive pulmonary disease (COPD)"', 38831552);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Chronic obstructive pulmonary disease (COPD)"', 51358112);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Chronic obstructive pulmonary disease (COPD)"', 64975686);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Chronic obstructive pulmonary disease (COPD)"', 69270812);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Chronic obstructive pulmonary disease (COPD)"', 81238413);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Chronic obstructive pulmonary disease (COPD)"', 88239853);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Congenital heart defects"', 14130558);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Congenital heart defects"', 23760253);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Congenital heart defects"', 27611255);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Congenital heart defects"', 33915414);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Congenital heart defects"', 90372030);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Congestive heart failure"', 11451089);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Congestive heart failure"', 86272100);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Crohn''s disease (flare-ups)"', 26290962);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Crohn''s disease (flare-ups)"', 79693276);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Deep vein thrombosis"', 8106308);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Deep vein thrombosis"', 10612573);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Deep vein thrombosis"', 20114821);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Deep vein thrombosis"', 23041511);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Deep vein thrombosis"', 32128888);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Deep vein thrombosis"', 53109927);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Deep vein thrombosis"', 76734801);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Deep vein thrombosis"', 79693276);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Dementia"', 730279);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Dementia"', 32410121);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Dementia"', 33059883);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Dementia"', 42253574);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Dementia"', 94625728);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Diabetes (uncontrolled)"', 11834830);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Diabetes (uncontrolled)"', 34375443);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Diabetes (uncontrolled)"', 38327601);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Diabetes (uncontrolled)"', 53564426);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Epilepsy"', 30104584);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Epilepsy"', 96970243);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Fibromyalgia (severe)"', 8081255);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Fibromyalgia (severe)"', 25539146);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Fibromyalgia (severe)"', 43049144);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Fibromyalgia (severe)"', 98257068);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Heart disease"', 3691273);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Heart disease"', 41060366);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hemophilia"', 13010901);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hemophilia"', 23491578);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hemophilia"', 41518918);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hemophilia"', 46010066);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hemophilia"', 47362950);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hemophilia"', 81884643);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hemophilia"', 83635789);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hemophilia"', 88061228);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Herniated disc"', 1055314);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Herniated disc"', 2376368);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Herniated disc"', 6628587);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Herniated disc"', 27611255);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Herniated disc"', 46344277);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Herniated disc"', 54467502);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hypermobile joints"', 8532059);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hypermobile joints"', 23491578);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hypermobile joints"', 31471077);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hypermobile joints"', 42688439);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hypermobile joints"', 46327250);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hypermobile joints"', 50968404);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hyperthyroidism"', 9077728);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hyperthyroidism"', 27719925);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hyperthyroidism"', 62214926);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hyperthyroidism"', 81276702);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hypothyroidism"', 22642135);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hypothyroidism"', 69270812);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hypothyroidism"', 87218298);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Hypothyroidism"', 90824185);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Kidney failure"', 1282269);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Kidney failure"', 22657272);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Kidney failure"', 30899206);
commit;
prompt 100 records committed...
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Kidney failure"', 31033551);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Kidney failure"', 33300460);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Liver disease"', 22819264);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Liver disease"', 23760253);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Liver disease"', 38125788);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Lupus"', 11612959);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Lupus"', 45412385);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Lupus"', 46327250);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Lupus"', 98877580);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 22642135);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 22820514);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 23041511);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 30401976);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 31874543);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 37921065);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 40789624);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 41060366);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 64070950);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 69270812);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 70753258);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 73937851);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 80691820);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 81005094);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 89702370);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Marfan syndrome"', 96688141);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Multiple sclerosis"', 6485018);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Multiple sclerosis"', 22432753);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Multiple sclerosis"', 50968404);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Multiple sclerosis"', 69270812);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Multiple sclerosis"', 69838192);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Multiple sclerosis"', 99375320);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Obesity (morbid)"', 22820514);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Obesity (morbid)"', 49478035);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Obesity (morbid)"', 50968404);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Obesity (morbid)"', 86272100);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Obesity (morbid)"', 98877580);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Osteoporosis"', 29658657);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Osteoporosis"', 48536850);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Osteoporosis"', 53815807);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Osteoporosis"', 76641085);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Parkinson''s disease"', 30434462);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Parkinson''s disease"', 45080144);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Polycystic ovary syndrome (PCOS) with severe symp', 14432183);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Polycystic ovary syndrome (PCOS) with severe symp', 14865178);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Polycystic ovary syndrome (PCOS) with severe symp', 27425173);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Polycystic ovary syndrome (PCOS) with severe symp', 46327250);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Polycystic ovary syndrome (PCOS) with severe symp', 53737541);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Polycystic ovary syndrome (PCOS) with severe symp', 62913995);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Polycystic ovary syndrome (PCOS) with severe symp', 64660127);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Polycystic ovary syndrome (PCOS) with severe symp', 70595940);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Polycystic ovary syndrome (PCOS) with severe symp', 91089992);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pregnancy"', 7860731);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pregnancy"', 19099801);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pregnancy"', 62214926);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pregnancy"', 73937851);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pregnancy"', 76364758);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pregnancy"', 79192786);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Psoriasis (severe)"', 17739277);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Psoriasis (severe)"', 30845995);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Psoriasis (severe)"', 33300460);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Psoriasis (severe)"', 54033988);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Psoriasis (severe)"', 69838192);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Psoriasis (severe)"', 71375160);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Psoriasis (severe)"', 99588313);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pulmonary embolism"', 1055314);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pulmonary embolism"', 8421656);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pulmonary embolism"', 62214926);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pulmonary embolism"', 79815731);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pulmonary embolism"', 94475922);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pulmonary embolism"', 96940369);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Pulmonary embolism"', 99887779);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent stroke"', 29742651);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 8752121);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 13736563);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 14432183);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 21381639);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 24168528);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 27449638);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 27719925);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 36349653);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 46010066);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 73593804);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 84018267);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Recent surgery"', 86272012);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Rotator cuff injury"', 6217460);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Rotator cuff injury"', 23114002);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Rotator cuff injury"', 51397792);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Rotator cuff injury"', 61698245);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Rotator cuff injury"', 65058862);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Rotator cuff injury"', 95620746);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Scoliosis (severe)"', 11169896);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Scoliosis (severe)"', 70595940);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe ADHD"', 24504822);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe GERD"', 29203895);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe GERD"', 61698245);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe GERD"', 91282035);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe IBS"', 9077728);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe IBS"', 44715352);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe IBS"', 46532727);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe IBS"', 49053838);
commit;
prompt 200 records committed...
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe OCD"', 23491578);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe OCD"', 44938507);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe OCD"', 54757032);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe OCD"', 61886377);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe OCD"', 79910635);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe OCD"', 92676944);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe PTSD"', 14130558);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe PTSD"', 96511274);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe PTSD"', 96940369);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe Raynaud''s disease"', 8796425);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe Raynaud''s disease"', 14291343);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe Raynaud''s disease"', 21381639);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe Raynaud''s disease"', 24317288);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe Raynaud''s disease"', 53479361);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe Raynaud''s disease"', 67481341);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe Raynaud''s disease"', 69838192);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe Sjogren''s syndrome"', 30884206);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe Sjogren''s syndrome"', 61886377);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe allergic reactions"', 8532059);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe allergic reactions"', 96940369);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe allergic reactions"', 99956255);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anemia"', 88649232);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anemia"', 90824185);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anemia"', 99375320);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anxiety"', 15992467);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anxiety"', 24504822);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anxiety"', 40293735);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anxiety"', 51948030);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anxiety"', 55743766);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anxiety"', 73049091);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anxiety"', 86755439);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anxiety"', 96973892);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe anxiety"', 99887779);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe arthritis"', 1402178);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe arthritis"', 37751547);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe arthritis"', 44623593);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe asthma"', 22820514);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe asthma"', 60383864);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe asthma"', 90612275);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe back pain"', 1934281);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe back pain"', 24001000);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe back pain"', 24317288);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe back pain"', 46861565);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe back pain"', 73049091);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe back pain"', 79987197);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe back pain"', 97438296);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe balance disorders"', 12760864);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe balance disorders"', 22819264);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe balance disorders"', 37751547);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe balance disorders"', 65545343);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe balance disorders"', 70389865);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe balance disorders"', 94475922);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe bipolar disorder"', 9228447);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe bipolar disorder"', 22920110);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe bipolar disorder"', 46344277);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe bipolar disorder"', 82112662);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe blood disorders"', 79910635);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe blood disorders"', 87891090);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe bronchitis"', 8106308);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe bronchitis"', 22920110);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe bronchitis"', 23041511);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe bronchitis"', 31024696);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe bronchitis"', 86816573);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe bronchitis"', 89596058);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe bronchitis"', 90717124);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cellulitis"', 2505457);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cellulitis"', 9228447);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cellulitis"', 25627106);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cellulitis"', 39725987);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cellulitis"', 49908274);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cellulitis"', 61886377);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cellulitis"', 66340561);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cellulitis"', 84018267);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cellulitis"', 89122501);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic fatigue syndrome"', 730279);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic fatigue syndrome"', 8796425);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic fatigue syndrome"', 10395000);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic fatigue syndrome"', 19410869);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic fatigue syndrome"', 27719925);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic fatigue syndrome"', 32846918);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic fatigue syndrome"', 54467502);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic fatigue syndrome"', 54761032);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic kidney disease"', 4646448);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic kidney disease"', 30899206);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic kidney disease"', 53483220);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe chronic kidney disease"', 70753258);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cirrhosis"', 19099801);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cirrhosis"', 26290962);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cirrhosis"', 27719925);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cirrhosis"', 52313162);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cirrhosis"', 54033988);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cirrhosis"', 85383287);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cirrhosis"', 93842287);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cognitive impairment"', 6484710);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cognitive impairment"', 10612573);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cognitive impairment"', 40293735);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cognitive impairment"', 42253574);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cognitive impairment"', 61586151);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cognitive impairment"', 61751644);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cognitive impairment"', 81190517);
commit;
prompt 300 records committed...
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe cognitive impairment"', 88239853);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe depression"', 1055314);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe depression"', 24427407);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe depression"', 54638372);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe depression"', 59194360);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe depression"', 79776408);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe developmental disorders"', 55996197);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe developmental disorders"', 73049091);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe developmental disorders"', 83635789);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe developmental disorders"', 84018267);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe developmental disorders"', 88726887);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe developmental disorders"', 93842287);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe eczema"', 25508039);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe eczema"', 26307234);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe eczema"', 33300460);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe eczema"', 44715352);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe eczema"', 91416453);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe eczema"', 99887779);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe endometriosis"', 21317536);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe endometriosis"', 22657272);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe endometriosis"', 59194360);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe endometriosis"', 60940200);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe environmental allergies"', 30845995);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe environmental allergies"', 50885464);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe environmental allergies"', 80691820);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe environmental allergies"', 91416453);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe food allergies"', 6485018);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe food allergies"', 24168528);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe food allergies"', 45080144);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe food allergies"', 54761032);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe food allergies"', 59194360);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe food allergies"', 62531988);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe food allergies"', 62846464);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe food allergies"', 73593804);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe food allergies"', 75363400);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe food allergies"', 88634045);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe gallbladder disease"', 22682672);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe gallbladder disease"', 26278207);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe gallbladder disease"', 28702001);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe gallbladder disease"', 38327601);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe gallbladder disease"', 80691820);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe gout"', 27638287);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe gout"', 31874543);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe gout"', 44824683);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe gout"', 51358112);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe gout"', 76364758);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hearing impairment"', 2303105);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hearing impairment"', 42253574);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hearing impairment"', 62846464);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hearing impairment"', 73038198);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hearing impairment"', 84018267);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hepatitis"', 11534770);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hepatitis"', 45080144);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hepatitis"', 53815807);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hepatitis"', 55743766);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hepatitis"', 62913995);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hepatitis"', 81865150);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hepatitis"', 98257068);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hepatitis"', 99434739);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hyperglycemia"', 1601841);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hyperglycemia"', 38831552);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hyperglycemia"', 62213084);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hyperglycemia"', 62361759);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hyperglycemia"', 75033915);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hyperglycemia"', 84018267);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hyperglycemia"', 96511274);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hyperhidrosis"', 10481000);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hyperhidrosis"', 10854394);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hypoglycemia"', 27611255);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe hypoglycemia"', 54757032);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe immune disorders"', 10775180);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe immune disorders"', 46344277);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe immune disorders"', 48536850);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe immune disorders"', 65545343);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe joint pain"', 26278207);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe joint pain"', 56902043);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe joint pain"', 86272100);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe lupus nephritis"', 6161238);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe lupus nephritis"', 6292018);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe lupus nephritis"', 31874543);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe lupus nephritis"', 55252246);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe lupus nephritis"', 58660984);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe lupus nephritis"', 67653817);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe lymphatic disorders"', 34241869);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe lymphatic disorders"', 36349653);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe lymphatic disorders"', 44619573);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe metabolic syndrome"', 22820514);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe metabolic syndrome"', 34375443);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe metabolic syndrome"', 44623593);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe metabolic syndrome"', 44824683);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe metabolic syndrome"', 53483220);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe metabolic syndrome"', 65545343);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe metabolic syndrome"', 67443455);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe metabolic syndrome"', 69335813);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe metabolic syndrome"', 77425508);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe migraine"', 87891090);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe muscle spasms"', 25112977);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe muscle spasms"', 32313288);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe muscle spasms"', 87891090);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe muscle spasms"', 92758208);
commit;
prompt 400 records committed...
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe musculoskeletal disorders"', 25508039);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe musculoskeletal disorders"', 63990543);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe musculoskeletal disorders"', 76734801);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe myopathy"', 25039816);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe myopathy"', 52313162);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe myopathy"', 53564426);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe myopathy"', 76641085);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe neuropathy"', 6505329);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe neuropathy"', 24414730);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe neuropathy"', 33915414);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe neuropathy"', 50550367);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe neuropathy"', 50968404);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe otitis media"', 2303105);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe otitis media"', 23071061);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe otitis media"', 77425508);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe pancreatitis"', 8421656);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe pancreatitis"', 19410869);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe pancreatitis"', 23491578);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe personality disorders"', 55478450);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe personality disorders"', 62913995);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe personality disorders"', 79693276);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe personality disorders"', 92566199);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe plantar fasciitis"', 23386909);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe plantar fasciitis"', 25602009);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe plantar fasciitis"', 42253574);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe plantar fasciitis"', 50968404);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe plantar fasciitis"', 67503959);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe plantar fasciitis"', 73453807);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe plantar fasciitis"', 76960313);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe polyneuropathy"', 2450269);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe polyneuropathy"', 11798215);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe polyneuropathy"', 36378696);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe polyneuropathy"', 64975686);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe polyneuropathy"', 96511274);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe psoriasis arthritis"', 23412617);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe psoriasis arthritis"', 35042992);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe psoriasis arthritis"', 82804437);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe rheumatoid arthritis"', 8752121);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe rheumatoid arthritis"', 38125788);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe rheumatoid arthritis"', 88726887);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe schizophrenia"', 66107157);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe schizophrenia"', 70595940);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe schizophrenia"', 92881950);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sinusitis"', 6292018);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sinusitis"', 21381639);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sinusitis"', 28937802);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sinusitis"', 86453357);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe skin infections"', 6484710);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe skin infections"', 54842402);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe skin infections"', 88634045);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe skin infections"', 93842287);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sleep apnea"', 6161238);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sleep apnea"', 6293456);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sleep apnea"', 16134366);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sleep apnea"', 19099801);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sleep apnea"', 27035808);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sleep apnea"', 37780928);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sleep apnea"', 51193500);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sleep apnea"', 81024259);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe sleep apnea"', 88061228);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe varicose veins"', 23760253);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe varicose veins"', 36833753);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe varicose veins"', 48084398);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe varicose veins"', 49537257);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe vertigo"', 28089404);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe vestibular disorders"', 6628587);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe vestibular disorders"', 31393240);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe vestibular disorders"', 34375443);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe vestibular disorders"', 67887328);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe vestibular disorders"', 68928002);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe vision impairment"', 10395000);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe vision impairment"', 23071061);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Severe vision impairment"', 71989689);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Spinal stenosis"', 6505329);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Spinal stenosis"', 30845995);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Spinal stenosis"', 53479361);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Spinal stenosis"', 66107157);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Spinal stenosis"', 70389865);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Tendonitis"', 6603015);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Tendonitis"', 6628587);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Tendonitis"', 34899411);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Tendonitis"', 43217671);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Tendonitis"', 50900940);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Tendonitis"', 88634045);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Ulcerative colitis (flare-ups)"', 26278207);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Ulcerative colitis (flare-ups)"', 46639839);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Ulcerative colitis (flare-ups)"', 55996197);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Ulcerative colitis (flare-ups)"', 58227833);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Ulcerative colitis (flare-ups)"', 91349986);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Uncontrolled epilepsy"', 1402178);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Uncontrolled epilepsy"', 14432183);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Uncontrolled epilepsy"', 32313288);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Uncontrolled epilepsy"', 45080144);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Uncontrolled epilepsy"', 53663079);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Uncontrolled epilepsy"', 63990543);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('"Uncontrolled epilepsy"', 87218298);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('High blood pressure', 19099801);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('High blood pressure', 36378696);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('High blood pressure', 44938507);
insert into GYM_MEMBER_MEDICAL_CONSTRAINS (medicalconstrains, personid)
values ('High blood pressure', 46861565);
commit;
prompt 500 records loaded
prompt Loading ROOM...
insert into ROOM (capacity, roomnum, roomtype)
values (115, 726, ' Cardio Room');
insert into ROOM (capacity, roomnum, roomtype)
values (111, 129, ' HIIT Room');
insert into ROOM (capacity, roomnum, roomtype)
values (12, 651, ' Dance Studio');
insert into ROOM (capacity, roomnum, roomtype)
values (49, 612, ' Outdoor Training Area');
insert into ROOM (capacity, roomnum, roomtype)
values (196, 932, ' Weightlifting Room');
insert into ROOM (capacity, roomnum, roomtype)
values (173, 363, ' Spa');
insert into ROOM (capacity, roomnum, roomtype)
values (12, 674, ' Outdoor Training Area');
insert into ROOM (capacity, roomnum, roomtype)
values (31, 658, ' Conference Hall');
insert into ROOM (capacity, roomnum, roomtype)
values (110, 924, ' Lecture Room');
insert into ROOM (capacity, roomnum, roomtype)
values (146, 255, ' Boxing Ring');
insert into ROOM (capacity, roomnum, roomtype)
values (79, 661, ' Cardio Room');
insert into ROOM (capacity, roomnum, roomtype)
values (76, 879, ' Outdoor Training Area');
insert into ROOM (capacity, roomnum, roomtype)
values (45, 10, ' Personal Training Room');
insert into ROOM (capacity, roomnum, roomtype)
values (92, 83, ' Swimming Pool');
insert into ROOM (capacity, roomnum, roomtype)
values (52, 864, ' Massage Room');
insert into ROOM (capacity, roomnum, roomtype)
values (155, 294, ' Seminar Room');
insert into ROOM (capacity, roomnum, roomtype)
values (178, 94, ' Cardio Room');
insert into ROOM (capacity, roomnum, roomtype)
values (42, 564, ' Conference Hall');
insert into ROOM (capacity, roomnum, roomtype)
values (11, 519, ' HIIT Room');
insert into ROOM (capacity, roomnum, roomtype)
values (26, 707, ' Lecture Room');
insert into ROOM (capacity, roomnum, roomtype)
values (41, 577, ' Outdoor Training Area');
insert into ROOM (capacity, roomnum, roomtype)
values (144, 502, ' Boxing Ring');
insert into ROOM (capacity, roomnum, roomtype)
values (48, 252, ' Weightlifting Room');
insert into ROOM (capacity, roomnum, roomtype)
values (193, 930, ' CrossFit Area');
insert into ROOM (capacity, roomnum, roomtype)
values (85, 391, ' Martial Arts Room');
insert into ROOM (capacity, roomnum, roomtype)
values (190, 591, ' Aerobics Room');
insert into ROOM (capacity, roomnum, roomtype)
values (72, 396, ' CrossFit Area');
insert into ROOM (capacity, roomnum, roomtype)
values (85, 659, ' Personal Training Room');
insert into ROOM (capacity, roomnum, roomtype)
values (26, 610, ' Cardio Room');
insert into ROOM (capacity, roomnum, roomtype)
values (75, 298, ' Outdoor Training Area');
insert into ROOM (capacity, roomnum, roomtype)
values (95, 498, ' Pilates Studio');
insert into ROOM (capacity, roomnum, roomtype)
values (106, 195, ' Indoor Track');
insert into ROOM (capacity, roomnum, roomtype)
values (106, 570, ' Boxing Ring');
insert into ROOM (capacity, roomnum, roomtype)
values (131, 530, ' Steam Room');
insert into ROOM (capacity, roomnum, roomtype)
values (113, 371, ' Martial Arts Room');
insert into ROOM (capacity, roomnum, roomtype)
values (17, 517, ' Indoor Track');
insert into ROOM (capacity, roomnum, roomtype)
values (96, 830, ' Outdoor Training Area');
insert into ROOM (capacity, roomnum, roomtype)
values (135, 390, ' Dance Studio');
insert into ROOM (capacity, roomnum, roomtype)
values (32, 11, ' Personal Training Room');
insert into ROOM (capacity, roomnum, roomtype)
values (44, 954, ' Boxing Ring');
insert into ROOM (capacity, roomnum, roomtype)
values (51, 257, ' Weightlifting Room');
insert into ROOM (capacity, roomnum, roomtype)
values (184, 522, ' Steam Room');
insert into ROOM (capacity, roomnum, roomtype)
values (78, 967, ' Boxing Ring');
insert into ROOM (capacity, roomnum, roomtype)
values (36, 748, ' Gymnasium');
insert into ROOM (capacity, roomnum, roomtype)
values (90, 3, ' Yoga Room');
insert into ROOM (capacity, roomnum, roomtype)
values (173, 254, ' Spa');
insert into ROOM (capacity, roomnum, roomtype)
values (19, 698, ' Swimming Pool');
insert into ROOM (capacity, roomnum, roomtype)
values (67, 188, ' CrossFit Area');
insert into ROOM (capacity, roomnum, roomtype)
values (79, 213, ' Pilates Studio');
insert into ROOM (capacity, roomnum, roomtype)
values (146, 226, ' Massage Room');
insert into ROOM (capacity, roomnum, roomtype)
values (27, 865, ' Spa');
insert into ROOM (capacity, roomnum, roomtype)
values (55, 336, ' Yoga Room');
insert into ROOM (capacity, roomnum, roomtype)
values (150, 500, ' Yoga Room');
insert into ROOM (capacity, roomnum, roomtype)
values (149, 647, ' Steam Room');
insert into ROOM (capacity, roomnum, roomtype)
values (107, 45, ' Spinning Room');
insert into ROOM (capacity, roomnum, roomtype)
values (32, 972, ' Steam Room');
insert into ROOM (capacity, roomnum, roomtype)
values (175, 177, ' Swimming Pool');
insert into ROOM (capacity, roomnum, roomtype)
values (197, 253, ' Cycling Room');
insert into ROOM (capacity, roomnum, roomtype)
values (33, 582, ' Aerobics Room');
insert into ROOM (capacity, roomnum, roomtype)
values (114, 244, ' Spinning Room');
insert into ROOM (capacity, roomnum, roomtype)
values (10, 402, ' HIIT Room');
insert into ROOM (capacity, roomnum, roomtype)
values (56, 901, ' Spa');
insert into ROOM (capacity, roomnum, roomtype)
values (61, 532, ' CrossFit Area');
insert into ROOM (capacity, roomnum, roomtype)
values (100, 389, ' Conference Hall');
insert into ROOM (capacity, roomnum, roomtype)
values (60, 164, ' Martial Arts Room');
insert into ROOM (capacity, roomnum, roomtype)
values (111, 914, ' Boxing Ring');
insert into ROOM (capacity, roomnum, roomtype)
values (185, 806, ' Sauna');
insert into ROOM (capacity, roomnum, roomtype)
values (88, 183, ' Conference Hall');
insert into ROOM (capacity, roomnum, roomtype)
values (56, 787, ' Spa');
insert into ROOM (capacity, roomnum, roomtype)
values (128, 421, ' Cardio Room');
insert into ROOM (capacity, roomnum, roomtype)
values (30, 73, ' Spinning Room');
insert into ROOM (capacity, roomnum, roomtype)
values (143, 65, ' Lecture Room');
insert into ROOM (capacity, roomnum, roomtype)
values (163, 431, ' Seminar Room');
insert into ROOM (capacity, roomnum, roomtype)
values (198, 750, ' Weightlifting Room');
insert into ROOM (capacity, roomnum, roomtype)
values (192, 815, ' Spa');
insert into ROOM (capacity, roomnum, roomtype)
values (172, 249, ' Seminar Room');
insert into ROOM (capacity, roomnum, roomtype)
values (63, 732, ' Conference Hall');
insert into ROOM (capacity, roomnum, roomtype)
values (45, 196, ' Cardio Room');
insert into ROOM (capacity, roomnum, roomtype)
values (118, 137, ' Swimming Pool');
insert into ROOM (capacity, roomnum, roomtype)
values (74, 246, ' Weightlifting Room');
insert into ROOM (capacity, roomnum, roomtype)
values (56, 703, ' Lecture Room');
insert into ROOM (capacity, roomnum, roomtype)
values (84, 555, ' Cycling Room');
insert into ROOM (capacity, roomnum, roomtype)
values (70, 946, ' Sauna');
insert into ROOM (capacity, roomnum, roomtype)
values (26, 763, ' Sauna');
insert into ROOM (capacity, roomnum, roomtype)
values (56, 96, ' Pilates Studio');
insert into ROOM (capacity, roomnum, roomtype)
values (52, 766, ' Weightlifting Room');
insert into ROOM (capacity, roomnum, roomtype)
values (134, 764, ' Outdoor Training Area');
insert into ROOM (capacity, roomnum, roomtype)
values (71, 939, ' HIIT Room');
insert into ROOM (capacity, roomnum, roomtype)
values (130, 653, ' CrossFit Area');
insert into ROOM (capacity, roomnum, roomtype)
values (46, 20, ' Martial Arts Room');
insert into ROOM (capacity, roomnum, roomtype)
values (28, 758, ' Spinning Room');
insert into ROOM (capacity, roomnum, roomtype)
values (162, 907, ' Sauna');
insert into ROOM (capacity, roomnum, roomtype)
values (13, 941, ' Spa');
insert into ROOM (capacity, roomnum, roomtype)
values (167, 626, ' Steam Room');
insert into ROOM (capacity, roomnum, roomtype)
values (140, 324, ' Personal Training Room');
insert into ROOM (capacity, roomnum, roomtype)
values (19, 409, ' CrossFit Area');
insert into ROOM (capacity, roomnum, roomtype)
values (158, 296, ' HIIT Room');
insert into ROOM (capacity, roomnum, roomtype)
values (73, 834, ' Functional Training Room');
insert into ROOM (capacity, roomnum, roomtype)
values (135, 854, ' Aerobics Room');
insert into ROOM (capacity, roomnum, roomtype)
values (30, 193, ' Cardio Room');
commit;
prompt 100 records loaded
prompt Loading TRAINER...
insert into TRAINER (license, experience, personid)
values ('4943-7152', 12, 79192786);
insert into TRAINER (license, experience, personid)
values ('0896-5126', 1, 63595783);
insert into TRAINER (license, experience, personid)
values ('2971-0028', 39, 88726887);
insert into TRAINER (license, experience, personid)
values ('5991-9895', 22, 32128888);
insert into TRAINER (license, experience, personid)
values ('1286-4064', 7, 7860731);
insert into TRAINER (license, experience, personid)
values ('1875-6551', 37, 2505457);
insert into TRAINER (license, experience, personid)
values ('7282-3664', 6, 30062117);
insert into TRAINER (license, experience, personid)
values ('4254-2488', 18, 46639839);
insert into TRAINER (license, experience, personid)
values ('1809-2839', 31, 2938480);
insert into TRAINER (license, experience, personid)
values ('4999-0331', 29, 88310865);
insert into TRAINER (license, experience, personid)
values ('0631-4954', 38, 99375320);
insert into TRAINER (license, experience, personid)
values ('4602-4681', 21, 38125788);
insert into TRAINER (license, experience, personid)
values ('0011-7983', 15, 54757032);
insert into TRAINER (license, experience, personid)
values ('8798-0245', 24, 15992467);
insert into TRAINER (license, experience, personid)
values ('2247-4283', 39, 2376368);
insert into TRAINER (license, experience, personid)
values ('9545-9644', 14, 7673525);
insert into TRAINER (license, experience, personid)
values ('6944-0306', 24, 13611451);
insert into TRAINER (license, experience, personid)
values ('2491-3051', 11, 11221464);
insert into TRAINER (license, experience, personid)
values ('6162-2121', 36, 64027261);
insert into TRAINER (license, experience, personid)
values ('9772-3278', 1, 61751644);
insert into TRAINER (license, experience, personid)
values ('4261-2018', 1, 47501817);
insert into TRAINER (license, experience, personid)
values ('3210-4761', 26, 2591817);
insert into TRAINER (license, experience, personid)
values ('7449-1813', 10, 730279);
insert into TRAINER (license, experience, personid)
values ('1396-2237', 20, 42253574);
insert into TRAINER (license, experience, personid)
values ('0393-8192', 17, 33449046);
insert into TRAINER (license, experience, personid)
values ('9398-9293', 11, 32846918);
insert into TRAINER (license, experience, personid)
values ('4144-3166', 10, 49908274);
insert into TRAINER (license, experience, personid)
values ('0926-3571', 15, 25112977);
insert into TRAINER (license, experience, personid)
values ('4910-7370', 37, 35548775);
insert into TRAINER (license, experience, personid)
values ('5327-8923', 11, 92566199);
insert into TRAINER (license, experience, personid)
values ('5765-9490', 0, 97813459);
insert into TRAINER (license, experience, personid)
values ('4164-7610', 33, 54638372);
insert into TRAINER (license, experience, personid)
values ('3665-0614', 38, 94625728);
insert into TRAINER (license, experience, personid)
values ('5286-3453', 16, 81865150);
insert into TRAINER (license, experience, personid)
values ('3059-8772', 38, 54985818);
insert into TRAINER (license, experience, personid)
values ('4746-9797', 13, 71805490);
insert into TRAINER (license, experience, personid)
values ('0679-2180', 2, 74889890);
insert into TRAINER (license, experience, personid)
values ('8064-6554', 29, 54968773);
insert into TRAINER (license, experience, personid)
values ('8427-7731', 5, 73434651);
insert into TRAINER (license, experience, personid)
values ('1622-1201', 9, 50029824);
insert into TRAINER (license, experience, personid)
values ('8471-1070', 25, 31661429);
insert into TRAINER (license, experience, personid)
values ('6546-0231', 27, 40293735);
insert into TRAINER (license, experience, personid)
values ('2274-6398', 37, 39725987);
insert into TRAINER (license, experience, personid)
values ('1435-1671', 13, 46339943);
insert into TRAINER (license, experience, personid)
values ('8921-7964', 3, 79910635);
insert into TRAINER (license, experience, personid)
values ('7526-8645', 17, 29203895);
insert into TRAINER (license, experience, personid)
values ('7681-0864', 15, 31471077);
insert into TRAINER (license, experience, personid)
values ('1141-3774', 17, 43049144);
insert into TRAINER (license, experience, personid)
values ('1665-9368', 17, 33915414);
insert into TRAINER (license, experience, personid)
values ('8856-5461', 37, 29207505);
insert into TRAINER (license, experience, personid)
values ('6187-6451', 10, 49478035);
insert into TRAINER (license, experience, personid)
values ('2881-2670', 15, 40091598);
insert into TRAINER (license, experience, personid)
values ('7000-8417', 37, 30463411);
insert into TRAINER (license, experience, personid)
values ('7244-8987', 9, 22432753);
insert into TRAINER (license, experience, personid)
values ('9730-5419', 3, 24414730);
insert into TRAINER (license, experience, personid)
values ('5249-1449', 19, 89122501);
insert into TRAINER (license, experience, personid)
values ('2895-2143', 31, 48536850);
insert into TRAINER (license, experience, personid)
values ('4617-8702', 31, 24290738);
insert into TRAINER (license, experience, personid)
values ('5083-8755', 11, 35042992);
insert into TRAINER (license, experience, personid)
values ('8138-9226', 17, 96970243);
insert into TRAINER (license, experience, personid)
values ('1334-9168', 13, 6603015);
insert into TRAINER (license, experience, personid)
values ('1950-4467', 40, 49537257);
insert into TRAINER (license, experience, personid)
values ('5264-9775', 9, 99887779);
insert into TRAINER (license, experience, personid)
values ('0108-0104', 14, 20103782);
insert into TRAINER (license, experience, personid)
values ('0460-8155', 2, 78118267);
insert into TRAINER (license, experience, personid)
values ('3789-0569', 23, 14725165);
insert into TRAINER (license, experience, personid)
values ('8652-9801', 3, 26290962);
insert into TRAINER (license, experience, personid)
values ('0058-6533', 39, 23041511);
insert into TRAINER (license, experience, personid)
values ('6828-4115', 18, 67015963);
insert into TRAINER (license, experience, personid)
values ('6341-3435', 31, 88649232);
insert into TRAINER (license, experience, personid)
values ('7206-9798', 2, 91089992);
insert into TRAINER (license, experience, personid)
values ('4004-7184', 0, 82804437);
insert into TRAINER (license, experience, personid)
values ('2529-9392', 30, 19067900);
insert into TRAINER (license, experience, personid)
values ('3286-9125', 16, 25602009);
insert into TRAINER (license, experience, personid)
values ('1130-8204', 14, 20114821);
insert into TRAINER (license, experience, personid)
values ('5719-2118', 14, 52313162);
insert into TRAINER (license, experience, personid)
values ('8720-6603', 10, 88239853);
insert into TRAINER (license, experience, personid)
values ('9870-5339', 30, 87891090);
insert into TRAINER (license, experience, personid)
values ('1824-7967', 9, 50968404);
insert into TRAINER (license, experience, personid)
values ('4170-8451', 37, 37865911);
insert into TRAINER (license, experience, personid)
values ('3703-9926', 34, 65058862);
insert into TRAINER (license, experience, personid)
values ('9857-6611', 8, 81276702);
insert into TRAINER (license, experience, personid)
values ('2729-8342', 38, 44715352);
insert into TRAINER (license, experience, personid)
values ('7538-8643', 9, 88634045);
insert into TRAINER (license, experience, personid)
values ('3851-2784', 13, 50900940);
insert into TRAINER (license, experience, personid)
values ('1477-0699', 8, 1055314);
insert into TRAINER (license, experience, personid)
values ('2506-8311', 2, 52154939);
insert into TRAINER (license, experience, personid)
values ('7391-5417', 2, 27803037);
insert into TRAINER (license, experience, personid)
values ('4254-9366', 6, 57601580);
insert into TRAINER (license, experience, personid)
values ('6513-8492', 12, 8796425);
insert into TRAINER (license, experience, personid)
values ('3216-2691', 12, 22657272);
insert into TRAINER (license, experience, personid)
values ('1168-3288', 10, 27719925);
insert into TRAINER (license, experience, personid)
values ('2019-2372', 22, 44623593);
insert into TRAINER (license, experience, personid)
values ('0346-8055', 22, 70178481);
insert into TRAINER (license, experience, personid)
values ('8634-1463', 2, 42322889);
insert into TRAINER (license, experience, personid)
values ('7345-5481', 38, 63990543);
insert into TRAINER (license, experience, personid)
values ('3125-1698', 1, 10951186);
insert into TRAINER (license, experience, personid)
values ('2968-2828', 17, 53737541);
insert into TRAINER (license, experience, personid)
values ('4666-1485', 35, 79693276);
insert into TRAINER (license, experience, personid)
values ('4797-5949', 23, 90824185);
commit;
prompt 100 records committed...
insert into TRAINER (license, experience, personid)
values ('3686-4797', 34, 13663159);
insert into TRAINER (license, experience, personid)
values ('8461-6010', 36, 43436957);
insert into TRAINER (license, experience, personid)
values ('4046-8771', 25, 79260141);
insert into TRAINER (license, experience, personid)
values ('5945-6987', 40, 4370439);
insert into TRAINER (license, experience, personid)
values ('3243-6623', 0, 10854394);
insert into TRAINER (license, experience, personid)
values ('6643-5546', 22, 53483220);
insert into TRAINER (license, experience, personid)
values ('3608-3780', 25, 25039816);
insert into TRAINER (license, experience, personid)
values ('8972-1977', 1, 45412385);
insert into TRAINER (license, experience, personid)
values ('7786-0472', 19, 37921065);
insert into TRAINER (license, experience, personid)
values ('3045-7983', 14, 58647622);
insert into TRAINER (license, experience, personid)
values ('9629-1252', 7, 30411578);
insert into TRAINER (license, experience, personid)
values ('5121-6323', 19, 64660127);
insert into TRAINER (license, experience, personid)
values ('4016-7399', 18, 45505216);
insert into TRAINER (license, experience, personid)
values ('4592-6027', 12, 1282269);
insert into TRAINER (license, experience, personid)
values ('8124-7873', 39, 41060366);
insert into TRAINER (license, experience, personid)
values ('5264-0092', 37, 29742651);
insert into TRAINER (license, experience, personid)
values ('4692-0715', 19, 14658929);
insert into TRAINER (license, experience, personid)
values ('1283-3952', 24, 91891117);
insert into TRAINER (license, experience, personid)
values ('3334-4597', 16, 87218298);
insert into TRAINER (license, experience, personid)
values ('8490-9062', 15, 43217671);
insert into TRAINER (license, experience, personid)
values ('9695-4601', 19, 9077728);
insert into TRAINER (license, experience, personid)
values ('6321-8492', 36, 41003550);
insert into TRAINER (license, experience, personid)
values ('8666-3202', 9, 8081255);
insert into TRAINER (license, experience, personid)
values ('1194-5988', 11, 86272100);
insert into TRAINER (license, experience, personid)
values ('7387-7690', 30, 66242981);
insert into TRAINER (license, experience, personid)
values ('3345-5297', 20, 2450269);
insert into TRAINER (license, experience, personid)
values ('5277-4775', 36, 49053838);
insert into TRAINER (license, experience, personid)
values ('9893-3072', 5, 83376974);
insert into TRAINER (license, experience, personid)
values ('4545-1837', 23, 51397792);
insert into TRAINER (license, experience, personid)
values ('0498-6195', 9, 41518918);
insert into TRAINER (license, experience, personid)
values ('3328-3793', 17, 29658657);
insert into TRAINER (license, experience, personid)
values ('0294-6452', 31, 39997409);
insert into TRAINER (license, experience, personid)
values ('6110-9240', 0, 34375443);
insert into TRAINER (license, experience, personid)
values ('9367-4297', 7, 35965202);
insert into TRAINER (license, experience, personid)
values ('2583-8161', 35, 51948030);
insert into TRAINER (license, experience, personid)
values ('3980-3735', 19, 46344277);
insert into TRAINER (license, experience, personid)
values ('1000-2864', 25, 91703316);
commit;
prompt 137 records loaded
prompt Loading LESSON...
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-08-2019 15:56:26', 'dd-mm-yyyy hh24:mi:ss'), 225, 7, 37, 758, 43217671);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-06-2010 16:42:57', 'dd-mm-yyyy hh24:mi:ss'), 226, 7, 72, 363, 27719925);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-01-2017 22:38:03', 'dd-mm-yyyy hh24:mi:ss'), 227, 7, 96, 65, 39725987);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-12-2002 16:01:46', 'dd-mm-yyyy hh24:mi:ss'), 228, 9, 81, 865, 40091598);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-04-2003 18:07:55', 'dd-mm-yyyy hh24:mi:ss'), 229, 7, 59, 257, 38125788);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-10-2022 13:35:45', 'dd-mm-yyyy hh24:mi:ss'), 230, 9, 60, 787, 87218298);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-10-2014 13:46:33', 'dd-mm-yyyy hh24:mi:ss'), 231, 9, 95, 946, 43049144);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-03-2023 00:54:51', 'dd-mm-yyyy hh24:mi:ss'), 232, 10, 52, 815, 73434651);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-07-2009 03:57:18', 'dd-mm-yyyy hh24:mi:ss'), 233, 8, 53, 707, 2376368);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-10-2011 23:12:20', 'dd-mm-yyyy hh24:mi:ss'), 234, 6, 33, 591, 83376974);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-04-2019 20:11:36', 'dd-mm-yyyy hh24:mi:ss'), 235, 10, 41, 932, 91089992);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-11-2006 23:42:17', 'dd-mm-yyyy hh24:mi:ss'), 236, 5, 35, 530, 58647622);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-11-2023 18:18:00', 'dd-mm-yyyy hh24:mi:ss'), 237, 5, 87, 658, 79910635);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-06-2008 18:07:20', 'dd-mm-yyyy hh24:mi:ss'), 238, 8, 82, 854, 57601580);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-04-2018 05:01:14', 'dd-mm-yyyy hh24:mi:ss'), 239, 10, 33, 932, 32128888);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-08-2004 10:37:55', 'dd-mm-yyyy hh24:mi:ss'), 240, 6, 87, 257, 8081255);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-11-2013 23:05:34', 'dd-mm-yyyy hh24:mi:ss'), 241, 8, 32, 626, 49478035);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-11-2020 22:31:43', 'dd-mm-yyyy hh24:mi:ss'), 242, 5, 66, 409, 6603015);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-06-2019 07:57:38', 'dd-mm-yyyy hh24:mi:ss'), 243, 7, 71, 65, 42322889);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-08-2012 00:26:47', 'dd-mm-yyyy hh24:mi:ss'), 244, 10, 43, 94, 89122501);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-11-2021 03:05:19', 'dd-mm-yyyy hh24:mi:ss'), 245, 10, 54, 732, 1055314);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-05-2023 18:26:55', 'dd-mm-yyyy hh24:mi:ss'), 246, 10, 93, 726, 58647622);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-05-2023 11:12:54', 'dd-mm-yyyy hh24:mi:ss'), 247, 5, 24, 10, 88634045);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-12-2021 10:42:57', 'dd-mm-yyyy hh24:mi:ss'), 248, 8, 14, 830, 99375320);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-07-2006 19:43:14', 'dd-mm-yyyy hh24:mi:ss'), 249, 8, 10, 193, 24290738);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-09-2024 04:31:00', 'dd-mm-yyyy hh24:mi:ss'), 250, 9, 60, 390, 2450269);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-01-2022 18:48:57', 'dd-mm-yyyy hh24:mi:ss'), 251, 5, 81, 517, 61751644);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-09-2004 06:14:49', 'dd-mm-yyyy hh24:mi:ss'), 252, 7, 52, 748, 63595783);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-04-2005 13:11:34', 'dd-mm-yyyy hh24:mi:ss'), 253, 8, 13, 748, 64027261);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-09-2005 05:56:24', 'dd-mm-yyyy hh24:mi:ss'), 254, 7, 42, 653, 39725987);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-09-2020 20:28:53', 'dd-mm-yyyy hh24:mi:ss'), 255, 9, 27, 865, 87218298);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-02-2015 11:14:29', 'dd-mm-yyyy hh24:mi:ss'), 256, 8, 37, 939, 53737541);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-07-2019 22:52:19', 'dd-mm-yyyy hh24:mi:ss'), 257, 10, 31, 253, 73434651);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-10-2018 08:16:04', 'dd-mm-yyyy hh24:mi:ss'), 258, 10, 8, 389, 2591817);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-02-2016 21:06:28', 'dd-mm-yyyy hh24:mi:ss'), 259, 5, 43, 391, 46344277);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-10-2015 04:49:17', 'dd-mm-yyyy hh24:mi:ss'), 260, 9, 8, 129, 14725165);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-01-2008 14:10:27', 'dd-mm-yyyy hh24:mi:ss'), 261, 10, 20, 758, 22432753);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-04-2003 09:34:42', 'dd-mm-yyyy hh24:mi:ss'), 262, 7, 86, 431, 66242981);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-01-2016 11:02:49', 'dd-mm-yyyy hh24:mi:ss'), 263, 10, 41, 500, 14658929);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-08-2021 13:32:44', 'dd-mm-yyyy hh24:mi:ss'), 264, 6, 49, 188, 25039816);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-06-2002 18:00:43', 'dd-mm-yyyy hh24:mi:ss'), 265, 6, 17, 519, 87891090);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-12-2021 07:44:15', 'dd-mm-yyyy hh24:mi:ss'), 266, 8, 12, 612, 32128888);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-12-2019 22:17:02', 'dd-mm-yyyy hh24:mi:ss'), 267, 6, 55, 555, 14725165);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-06-2009 04:32:44', 'dd-mm-yyyy hh24:mi:ss'), 268, 10, 11, 213, 87218298);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-05-2016 22:58:04', 'dd-mm-yyyy hh24:mi:ss'), 269, 10, 41, 371, 7673525);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-01-2008 09:18:43', 'dd-mm-yyyy hh24:mi:ss'), 270, 8, 46, 213, 9077728);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-02-2010 13:37:37', 'dd-mm-yyyy hh24:mi:ss'), 271, 8, 72, 294, 79910635);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-12-2021 04:54:37', 'dd-mm-yyyy hh24:mi:ss'), 272, 10, 16, 254, 97813459);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-07-2002 02:17:48', 'dd-mm-yyyy hh24:mi:ss'), 273, 9, 70, 336, 46339943);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-03-2018 08:48:46', 'dd-mm-yyyy hh24:mi:ss'), 274, 6, 31, 391, 83376974);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-03-2008 06:02:52', 'dd-mm-yyyy hh24:mi:ss'), 275, 7, 67, 653, 37865911);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-01-2002 14:55:14', 'dd-mm-yyyy hh24:mi:ss'), 276, 6, 83, 532, 88310865);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-07-2014 07:53:54', 'dd-mm-yyyy hh24:mi:ss'), 277, 9, 1, 764, 40293735);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-10-2016 12:51:24', 'dd-mm-yyyy hh24:mi:ss'), 278, 5, 16, 653, 35965202);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-12-2010 07:18:54', 'dd-mm-yyyy hh24:mi:ss'), 279, 8, 71, 674, 41518918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-07-2024 08:47:19', 'dd-mm-yyyy hh24:mi:ss'), 280, 10, 70, 907, 15992467);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-03-2015 05:21:15', 'dd-mm-yyyy hh24:mi:ss'), 281, 10, 9, 865, 74889890);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-06-2024 21:52:50', 'dd-mm-yyyy hh24:mi:ss'), 282, 8, 98, 703, 22657272);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-11-2021 14:59:25', 'dd-mm-yyyy hh24:mi:ss'), 283, 6, 94, 20, 41518918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-11-2022 10:31:00', 'dd-mm-yyyy hh24:mi:ss'), 284, 8, 31, 577, 91891117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-04-2002 18:12:05', 'dd-mm-yyyy hh24:mi:ss'), 285, 10, 58, 651, 39997409);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-03-2019 08:02:32', 'dd-mm-yyyy hh24:mi:ss'), 286, 6, 25, 363, 25039816);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-04-2004 08:58:50', 'dd-mm-yyyy hh24:mi:ss'), 287, 8, 69, 967, 53483220);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-12-2014 22:29:16', 'dd-mm-yyyy hh24:mi:ss'), 288, 6, 8, 391, 34375443);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-06-2004 03:31:49', 'dd-mm-yyyy hh24:mi:ss'), 289, 8, 35, 11, 2591817);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-06-2010 05:55:06', 'dd-mm-yyyy hh24:mi:ss'), 290, 7, 84, 564, 44623593);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-08-2011 18:43:29', 'dd-mm-yyyy hh24:mi:ss'), 291, 8, 9, 195, 87891090);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-07-2014 22:26:06', 'dd-mm-yyyy hh24:mi:ss'), 292, 10, 30, 591, 37865911);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-06-2006 15:02:18', 'dd-mm-yyyy hh24:mi:ss'), 293, 9, 7, 254, 73434651);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-10-2011 06:38:18', 'dd-mm-yyyy hh24:mi:ss'), 294, 5, 59, 834, 22657272);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-07-2006 20:09:10', 'dd-mm-yyyy hh24:mi:ss'), 295, 5, 77, 94, 96970243);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-10-2018 10:23:13', 'dd-mm-yyyy hh24:mi:ss'), 296, 5, 89, 946, 41060366);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-12-2018 15:40:27', 'dd-mm-yyyy hh24:mi:ss'), 297, 10, 24, 409, 26290962);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-12-2019 00:04:01', 'dd-mm-yyyy hh24:mi:ss'), 298, 6, 26, 196, 43049144);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-03-2013 23:32:29', 'dd-mm-yyyy hh24:mi:ss'), 299, 10, 14, 371, 79910635);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-04-2021 21:15:15', 'dd-mm-yyyy hh24:mi:ss'), 300, 5, 96, 674, 51397792);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-08-2013 04:00:11', 'dd-mm-yyyy hh24:mi:ss'), 301, 9, 16, 626, 14725165);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-12-2013 11:40:33', 'dd-mm-yyyy hh24:mi:ss'), 302, 6, 40, 409, 7673525);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-10-2000 23:24:25', 'dd-mm-yyyy hh24:mi:ss'), 303, 9, 80, 763, 15992467);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-08-2003 00:38:00', 'dd-mm-yyyy hh24:mi:ss'), 304, 5, 52, 252, 2505457);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-03-2003 20:23:16', 'dd-mm-yyyy hh24:mi:ss'), 305, 7, 58, 758, 79910635);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-08-2018 10:42:31', 'dd-mm-yyyy hh24:mi:ss'), 306, 10, 4, 193, 43049144);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-01-2006 15:32:06', 'dd-mm-yyyy hh24:mi:ss'), 307, 6, 96, 391, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-02-2017 23:29:19', 'dd-mm-yyyy hh24:mi:ss'), 308, 8, 84, 244, 10951186);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-09-2022 13:08:58', 'dd-mm-yyyy hh24:mi:ss'), 309, 6, 100, 564, 27719925);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-12-2009 04:16:53', 'dd-mm-yyyy hh24:mi:ss'), 310, 8, 55, 854, 24414730);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-04-2005 04:16:19', 'dd-mm-yyyy hh24:mi:ss'), 311, 9, 4, 252, 53483220);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-08-2020 21:20:26', 'dd-mm-yyyy hh24:mi:ss'), 312, 8, 29, 20, 46339943);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-06-2004 06:48:05', 'dd-mm-yyyy hh24:mi:ss'), 313, 7, 86, 815, 46339943);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-03-2018 14:02:32', 'dd-mm-yyyy hh24:mi:ss'), 314, 7, 78, 129, 51397792);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-11-2004 01:15:10', 'dd-mm-yyyy hh24:mi:ss'), 315, 7, 64, 431, 33915414);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-11-2022 13:32:18', 'dd-mm-yyyy hh24:mi:ss'), 316, 10, 73, 555, 2938480);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-09-2017 12:29:57', 'dd-mm-yyyy hh24:mi:ss'), 317, 10, 15, 967, 79192786);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-03-2018 22:00:02', 'dd-mm-yyyy hh24:mi:ss'), 318, 5, 51, 806, 96970243);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-03-2000 22:36:11', 'dd-mm-yyyy hh24:mi:ss'), 319, 5, 71, 732, 40293735);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-02-2009 20:18:23', 'dd-mm-yyyy hh24:mi:ss'), 320, 8, 64, 502, 73434651);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-03-2024 14:49:55', 'dd-mm-yyyy hh24:mi:ss'), 321, 8, 9, 924, 2591817);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-06-2002 02:10:10', 'dd-mm-yyyy hh24:mi:ss'), 322, 10, 82, 371, 99887779);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-04-2008 01:50:09', 'dd-mm-yyyy hh24:mi:ss'), 323, 10, 62, 830, 65058862);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-09-2011 17:08:18', 'dd-mm-yyyy hh24:mi:ss'), 324, 10, 72, 930, 35965202);
commit;
prompt 100 records committed...
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-06-2011 15:03:36', 'dd-mm-yyyy hh24:mi:ss'), 325, 7, 93, 389, 30411578);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-05-2011 16:37:55', 'dd-mm-yyyy hh24:mi:ss'), 326, 10, 78, 226, 10854394);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-10-2011 21:28:56', 'dd-mm-yyyy hh24:mi:ss'), 327, 5, 27, 45, 24290738);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-08-2016 08:11:54', 'dd-mm-yyyy hh24:mi:ss'), 328, 10, 49, 431, 25112977);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-09-2015 20:57:24', 'dd-mm-yyyy hh24:mi:ss'), 329, 10, 8, 45, 32846918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-01-2005 00:39:53', 'dd-mm-yyyy hh24:mi:ss'), 330, 7, 72, 502, 87891090);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-07-2006 00:39:10', 'dd-mm-yyyy hh24:mi:ss'), 331, 7, 70, 967, 7673525);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-11-2004 14:19:23', 'dd-mm-yyyy hh24:mi:ss'), 332, 8, 27, 129, 52313162);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-12-2008 23:20:32', 'dd-mm-yyyy hh24:mi:ss'), 333, 6, 4, 787, 50029824);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-08-2013 19:32:44', 'dd-mm-yyyy hh24:mi:ss'), 334, 7, 90, 294, 40293735);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-07-2004 21:36:08', 'dd-mm-yyyy hh24:mi:ss'), 335, 6, 60, 391, 79910635);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-08-2006 17:16:22', 'dd-mm-yyyy hh24:mi:ss'), 336, 8, 51, 336, 54638372);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-02-2001 05:28:19', 'dd-mm-yyyy hh24:mi:ss'), 337, 9, 92, 530, 1055314);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-11-2012 09:39:18', 'dd-mm-yyyy hh24:mi:ss'), 338, 10, 32, 396, 10951186);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-07-2020 12:26:55', 'dd-mm-yyyy hh24:mi:ss'), 339, 7, 83, 402, 34375443);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-02-2005 03:51:50', 'dd-mm-yyyy hh24:mi:ss'), 340, 5, 30, 726, 8796425);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-06-2016 13:22:13', 'dd-mm-yyyy hh24:mi:ss'), 341, 7, 45, 707, 27719925);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-02-2024 14:31:20', 'dd-mm-yyyy hh24:mi:ss'), 342, 8, 6, 612, 32128888);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-05-2006 05:10:01', 'dd-mm-yyyy hh24:mi:ss'), 343, 9, 90, 941, 7673525);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-01-2006 19:34:01', 'dd-mm-yyyy hh24:mi:ss'), 344, 6, 60, 183, 44715352);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-01-2010 09:15:41', 'dd-mm-yyyy hh24:mi:ss'), 345, 7, 83, 83, 24290738);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-07-2022 12:24:20', 'dd-mm-yyyy hh24:mi:ss'), 346, 7, 35, 659, 41518918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-02-2000 09:58:45', 'dd-mm-yyyy hh24:mi:ss'), 347, 5, 74, 698, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-08-2020 03:14:32', 'dd-mm-yyyy hh24:mi:ss'), 348, 9, 45, 402, 57601580);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-07-2020 04:12:17', 'dd-mm-yyyy hh24:mi:ss'), 349, 7, 72, 129, 79260141);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-02-2017 22:04:39', 'dd-mm-yyyy hh24:mi:ss'), 350, 7, 23, 612, 39997409);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-11-2015 17:16:22', 'dd-mm-yyyy hh24:mi:ss'), 351, 8, 53, 914, 79192786);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-03-2017 20:36:23', 'dd-mm-yyyy hh24:mi:ss'), 352, 10, 32, 750, 58647622);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-12-2011 12:03:53', 'dd-mm-yyyy hh24:mi:ss'), 353, 5, 34, 834, 50900940);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-10-2021 03:23:19', 'dd-mm-yyyy hh24:mi:ss'), 354, 10, 61, 188, 1282269);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-11-2003 20:09:18', 'dd-mm-yyyy hh24:mi:ss'), 355, 6, 31, 647, 91089992);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-07-2001 08:04:50', 'dd-mm-yyyy hh24:mi:ss'), 356, 6, 25, 45, 35548775);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-11-2012 20:57:07', 'dd-mm-yyyy hh24:mi:ss'), 357, 10, 49, 390, 64027261);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-12-2018 11:17:13', 'dd-mm-yyyy hh24:mi:ss'), 358, 7, 89, 324, 31661429);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-07-2018 04:48:08', 'dd-mm-yyyy hh24:mi:ss'), 359, 6, 52, 183, 30062117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-09-2017 16:36:28', 'dd-mm-yyyy hh24:mi:ss'), 360, 9, 44, 698, 10854394);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-12-2019 16:14:18', 'dd-mm-yyyy hh24:mi:ss'), 361, 6, 74, 519, 96970243);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-08-2023 11:51:56', 'dd-mm-yyyy hh24:mi:ss'), 362, 10, 71, 924, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-12-2012 05:40:50', 'dd-mm-yyyy hh24:mi:ss'), 363, 10, 85, 371, 97813459);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-12-2016 07:06:40', 'dd-mm-yyyy hh24:mi:ss'), 364, 5, 51, 363, 10854394);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-11-2009 23:17:05', 'dd-mm-yyyy hh24:mi:ss'), 365, 9, 41, 658, 27719925);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-10-2010 23:06:51', 'dd-mm-yyyy hh24:mi:ss'), 366, 10, 26, 707, 40293735);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-07-2009 16:49:09', 'dd-mm-yyyy hh24:mi:ss'), 367, 7, 97, 294, 99887779);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-06-2000 07:10:50', 'dd-mm-yyyy hh24:mi:ss'), 368, 8, 56, 129, 46639839);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-09-2014 00:01:17', 'dd-mm-yyyy hh24:mi:ss'), 369, 6, 86, 246, 63595783);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-07-2001 00:57:36', 'dd-mm-yyyy hh24:mi:ss'), 370, 8, 36, 610, 9077728);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-10-2001 12:11:57', 'dd-mm-yyyy hh24:mi:ss'), 371, 8, 10, 661, 42322889);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-08-2019 04:37:37', 'dd-mm-yyyy hh24:mi:ss'), 372, 9, 69, 758, 31471077);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-02-2018 15:27:21', 'dd-mm-yyyy hh24:mi:ss'), 373, 8, 30, 732, 7673525);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-12-2008 01:14:44', 'dd-mm-yyyy hh24:mi:ss'), 374, 9, 18, 726, 64660127);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-05-2000 22:26:58', 'dd-mm-yyyy hh24:mi:ss'), 375, 8, 30, 707, 45505216);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-03-2002 15:32:06', 'dd-mm-yyyy hh24:mi:ss'), 376, 8, 74, 96, 29207505);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-04-2013 04:18:20', 'dd-mm-yyyy hh24:mi:ss'), 377, 10, 15, 249, 19067900);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-05-2001 02:14:55', 'dd-mm-yyyy hh24:mi:ss'), 378, 7, 28, 750, 44715352);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-10-2016 04:55:12', 'dd-mm-yyyy hh24:mi:ss'), 379, 5, 14, 193, 94625728);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-02-2001 02:25:43', 'dd-mm-yyyy hh24:mi:ss'), 380, 8, 29, 674, 6603015);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-07-2019 01:48:25', 'dd-mm-yyyy hh24:mi:ss'), 381, 10, 63, 591, 61751644);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-03-2021 02:24:34', 'dd-mm-yyyy hh24:mi:ss'), 382, 7, 48, 391, 70178481);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-09-2007 18:16:59', 'dd-mm-yyyy hh24:mi:ss'), 383, 6, 17, 555, 2505457);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-05-2021 20:10:36', 'dd-mm-yyyy hh24:mi:ss'), 384, 6, 23, 257, 20103782);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-10-2008 16:53:45', 'dd-mm-yyyy hh24:mi:ss'), 385, 7, 11, 698, 54638372);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-11-2004 05:49:37', 'dd-mm-yyyy hh24:mi:ss'), 386, 5, 56, 94, 25039816);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-05-2013 18:46:48', 'dd-mm-yyyy hh24:mi:ss'), 387, 8, 3, 707, 54638372);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-10-2009 13:16:45', 'dd-mm-yyyy hh24:mi:ss'), 388, 5, 42, 3, 51948030);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-09-2002 03:48:05', 'dd-mm-yyyy hh24:mi:ss'), 389, 6, 37, 389, 81276702);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-07-2004 18:12:40', 'dd-mm-yyyy hh24:mi:ss'), 390, 6, 93, 591, 48536850);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-01-2000 17:15:21', 'dd-mm-yyyy hh24:mi:ss'), 391, 5, 42, 830, 88310865);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-08-2024 14:07:09', 'dd-mm-yyyy hh24:mi:ss'), 392, 7, 29, 815, 37921065);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-10-2004 14:16:48', 'dd-mm-yyyy hh24:mi:ss'), 393, 9, 97, 298, 44623593);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-06-2019 13:53:19', 'dd-mm-yyyy hh24:mi:ss'), 394, 8, 70, 363, 99887779);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-06-2000 22:04:04', 'dd-mm-yyyy hh24:mi:ss'), 395, 5, 27, 787, 49478035);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-05-2008 09:51:50', 'dd-mm-yyyy hh24:mi:ss'), 396, 10, 35, 946, 63990543);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-06-2013 18:30:57', 'dd-mm-yyyy hh24:mi:ss'), 397, 8, 9, 129, 31471077);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-10-2024 08:27:36', 'dd-mm-yyyy hh24:mi:ss'), 398, 7, 81, 612, 54968773);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-09-2002 15:02:35', 'dd-mm-yyyy hh24:mi:ss'), 399, 9, 62, 806, 49053838);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-10-2017 23:34:48', 'dd-mm-yyyy hh24:mi:ss'), 400, 5, 100, 582, 50900940);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-07-2020 16:53:28', 'dd-mm-yyyy hh24:mi:ss'), 401, 5, 78, 612, 53483220);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-09-2019 17:48:37', 'dd-mm-yyyy hh24:mi:ss'), 402, 7, 16, 20, 88310865);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-04-2017 21:33:59', 'dd-mm-yyyy hh24:mi:ss'), 403, 6, 16, 11, 74889890);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-02-2021 01:14:09', 'dd-mm-yyyy hh24:mi:ss'), 404, 5, 10, 249, 30463411);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-08-2001 14:40:59', 'dd-mm-yyyy hh24:mi:ss'), 405, 6, 40, 815, 14658929);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-10-2017 01:59:39', 'dd-mm-yyyy hh24:mi:ss'), 406, 10, 93, 647, 32846918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-01-2010 05:57:07', 'dd-mm-yyyy hh24:mi:ss'), 407, 9, 55, 3, 99887779);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-11-2005 14:11:11', 'dd-mm-yyyy hh24:mi:ss'), 408, 7, 18, 703, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-05-2016 13:52:36', 'dd-mm-yyyy hh24:mi:ss'), 409, 5, 67, 421, 30062117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-11-2015 18:43:29', 'dd-mm-yyyy hh24:mi:ss'), 410, 5, 44, 83, 24290738);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-01-2019 01:12:17', 'dd-mm-yyyy hh24:mi:ss'), 411, 10, 82, 658, 25039816);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-09-2018 20:46:27', 'dd-mm-yyyy hh24:mi:ss'), 412, 9, 21, 519, 88310865);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-09-2012 14:10:53', 'dd-mm-yyyy hh24:mi:ss'), 413, 10, 68, 249, 8081255);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-10-2001 01:00:28', 'dd-mm-yyyy hh24:mi:ss'), 414, 10, 32, 914, 49053838);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-09-2005 00:18:43', 'dd-mm-yyyy hh24:mi:ss'), 415, 5, 48, 703, 11221464);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-02-2017 20:40:42', 'dd-mm-yyyy hh24:mi:ss'), 416, 9, 40, 577, 45505216);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-04-2014 21:21:44', 'dd-mm-yyyy hh24:mi:ss'), 417, 6, 59, 396, 23041511);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-04-2023 19:36:11', 'dd-mm-yyyy hh24:mi:ss'), 418, 7, 80, 177, 38125788);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-07-2019 06:10:56', 'dd-mm-yyyy hh24:mi:ss'), 419, 6, 20, 195, 52154939);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-11-2018 01:37:46', 'dd-mm-yyyy hh24:mi:ss'), 420, 8, 42, 94, 37921065);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-10-2024 19:04:04', 'dd-mm-yyyy hh24:mi:ss'), 421, 6, 18, 213, 25039816);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-02-2017 00:53:25', 'dd-mm-yyyy hh24:mi:ss'), 422, 6, 42, 907, 37921065);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-10-2015 19:21:30', 'dd-mm-yyyy hh24:mi:ss'), 423, 6, 23, 226, 79910635);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-09-2015 20:06:51', 'dd-mm-yyyy hh24:mi:ss'), 424, 10, 96, 864, 19067900);
commit;
prompt 200 records committed...
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-10-2013 10:12:51', 'dd-mm-yyyy hh24:mi:ss'), 425, 9, 21, 661, 88310865);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-06-2008 12:49:23', 'dd-mm-yyyy hh24:mi:ss'), 426, 6, 47, 865, 8081255);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-12-2016 12:37:26', 'dd-mm-yyyy hh24:mi:ss'), 427, 7, 75, 11, 82804437);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-04-2024 19:41:31', 'dd-mm-yyyy hh24:mi:ss'), 428, 9, 54, 246, 63595783);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-04-2006 00:05:28', 'dd-mm-yyyy hh24:mi:ss'), 429, 10, 35, 402, 29658657);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-05-2016 05:32:03', 'dd-mm-yyyy hh24:mi:ss'), 430, 5, 87, 967, 20114821);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-10-2019 19:38:12', 'dd-mm-yyyy hh24:mi:ss'), 431, 5, 4, 371, 11221464);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-01-2004 04:34:01', 'dd-mm-yyyy hh24:mi:ss'), 432, 8, 4, 193, 2938480);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-05-2003 15:18:34', 'dd-mm-yyyy hh24:mi:ss'), 433, 5, 22, 257, 50029824);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-05-2012 11:15:38', 'dd-mm-yyyy hh24:mi:ss'), 434, 9, 47, 914, 8796425);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-05-2002 14:42:43', 'dd-mm-yyyy hh24:mi:ss'), 435, 7, 98, 252, 42253574);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-06-2001 16:01:20', 'dd-mm-yyyy hh24:mi:ss'), 436, 8, 30, 298, 50900940);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-03-2018 18:41:54', 'dd-mm-yyyy hh24:mi:ss'), 437, 9, 58, 939, 70178481);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-04-2007 14:11:19', 'dd-mm-yyyy hh24:mi:ss'), 438, 10, 82, 254, 91891117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-02-2019 10:52:45', 'dd-mm-yyyy hh24:mi:ss'), 439, 9, 33, 20, 57601580);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-02-2014 13:20:12', 'dd-mm-yyyy hh24:mi:ss'), 440, 6, 82, 707, 54968773);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-01-2017 18:18:08', 'dd-mm-yyyy hh24:mi:ss'), 441, 8, 94, 252, 9077728);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-04-2024 02:51:38', 'dd-mm-yyyy hh24:mi:ss'), 442, 7, 97, 698, 52313162);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-04-2001 17:19:49', 'dd-mm-yyyy hh24:mi:ss'), 443, 8, 84, 296, 71805490);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-09-2021 06:49:49', 'dd-mm-yyyy hh24:mi:ss'), 444, 5, 32, 732, 35548775);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-06-2012 02:33:47', 'dd-mm-yyyy hh24:mi:ss'), 445, 10, 11, 226, 88239853);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-03-2021 03:45:56', 'dd-mm-yyyy hh24:mi:ss'), 446, 8, 84, 954, 73434651);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-10-2013 07:24:14', 'dd-mm-yyyy hh24:mi:ss'), 447, 9, 13, 698, 66242981);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-06-2012 04:38:47', 'dd-mm-yyyy hh24:mi:ss'), 448, 7, 74, 530, 32846918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-01-2011 11:52:56', 'dd-mm-yyyy hh24:mi:ss'), 449, 5, 22, 914, 30411578);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-12-2007 20:42:51', 'dd-mm-yyyy hh24:mi:ss'), 450, 6, 21, 129, 43049144);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-08-2022 06:12:14', 'dd-mm-yyyy hh24:mi:ss'), 451, 7, 85, 946, 94625728);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-10-2017 12:54:17', 'dd-mm-yyyy hh24:mi:ss'), 452, 10, 7, 763, 730279);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-11-2024 14:35:31', 'dd-mm-yyyy hh24:mi:ss'), 453, 10, 45, 517, 35042992);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-11-2008 02:40:33', 'dd-mm-yyyy hh24:mi:ss'), 454, 8, 38, 806, 32846918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-07-2011 05:00:14', 'dd-mm-yyyy hh24:mi:ss'), 455, 10, 50, 972, 19067900);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-06-2019 22:50:44', 'dd-mm-yyyy hh24:mi:ss'), 456, 7, 78, 815, 27803037);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-06-2011 05:33:04', 'dd-mm-yyyy hh24:mi:ss'), 457, 6, 61, 188, 54638372);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-02-2004 16:38:12', 'dd-mm-yyyy hh24:mi:ss'), 458, 9, 1, 939, 22432753);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-07-2015 15:32:15', 'dd-mm-yyyy hh24:mi:ss'), 459, 6, 13, 188, 64027261);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-11-2003 20:35:05', 'dd-mm-yyyy hh24:mi:ss'), 460, 8, 2, 96, 79192786);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-04-2014 07:26:15', 'dd-mm-yyyy hh24:mi:ss'), 461, 9, 92, 20, 730279);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-02-2012 16:09:41', 'dd-mm-yyyy hh24:mi:ss'), 462, 9, 79, 967, 33449046);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-05-2020 07:20:03', 'dd-mm-yyyy hh24:mi:ss'), 463, 7, 58, 564, 92566199);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-08-2017 13:07:06', 'dd-mm-yyyy hh24:mi:ss'), 464, 5, 79, 854, 33449046);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-05-2006 20:52:39', 'dd-mm-yyyy hh24:mi:ss'), 465, 8, 96, 3, 39997409);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-06-2009 18:15:07', 'dd-mm-yyyy hh24:mi:ss'), 466, 10, 81, 193, 42253574);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-11-2009 05:09:53', 'dd-mm-yyyy hh24:mi:ss'), 467, 7, 14, 954, 13611451);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-05-2009 22:11:51', 'dd-mm-yyyy hh24:mi:ss'), 468, 9, 68, 298, 65058862);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-10-2020 23:31:55', 'dd-mm-yyyy hh24:mi:ss'), 469, 7, 60, 865, 2450269);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-11-2012 19:07:23', 'dd-mm-yyyy hh24:mi:ss'), 470, 5, 89, 249, 25112977);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-12-2022 05:48:28', 'dd-mm-yyyy hh24:mi:ss'), 471, 8, 61, 612, 2450269);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-07-2024 03:40:53', 'dd-mm-yyyy hh24:mi:ss'), 472, 6, 91, 865, 44623593);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-10-2008 04:16:19', 'dd-mm-yyyy hh24:mi:ss'), 473, 10, 22, 854, 53483220);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-05-2007 17:33:47', 'dd-mm-yyyy hh24:mi:ss'), 474, 5, 26, 941, 45505216);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-11-2012 03:10:30', 'dd-mm-yyyy hh24:mi:ss'), 475, 9, 34, 703, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-07-2002 16:01:29', 'dd-mm-yyyy hh24:mi:ss'), 476, 7, 84, 939, 29658657);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-10-2020 00:34:33', 'dd-mm-yyyy hh24:mi:ss'), 477, 5, 63, 854, 32846918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-10-2007 16:26:15', 'dd-mm-yyyy hh24:mi:ss'), 478, 8, 15, 519, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-09-2009 08:58:59', 'dd-mm-yyyy hh24:mi:ss'), 479, 7, 64, 907, 31471077);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-07-2003 07:29:34', 'dd-mm-yyyy hh24:mi:ss'), 480, 5, 6, 564, 42322889);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-01-2015 17:14:38', 'dd-mm-yyyy hh24:mi:ss'), 481, 10, 59, 193, 10951186);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-11-2024 23:01:58', 'dd-mm-yyyy hh24:mi:ss'), 482, 5, 45, 653, 45505216);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-05-2015 10:03:56', 'dd-mm-yyyy hh24:mi:ss'), 483, 6, 57, 930, 27719925);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-05-2002 13:44:58', 'dd-mm-yyyy hh24:mi:ss'), 484, 7, 84, 750, 64027261);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-10-2000 22:34:53', 'dd-mm-yyyy hh24:mi:ss'), 485, 8, 70, 591, 45505216);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-07-2010 02:48:02', 'dd-mm-yyyy hh24:mi:ss'), 486, 7, 36, 402, 70178481);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-07-2019 01:27:15', 'dd-mm-yyyy hh24:mi:ss'), 487, 7, 15, 610, 20103782);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-10-2014 03:26:38', 'dd-mm-yyyy hh24:mi:ss'), 488, 6, 47, 647, 29658657);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-11-2007 08:10:27', 'dd-mm-yyyy hh24:mi:ss'), 489, 5, 2, 932, 91089992);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-09-2016 11:10:10', 'dd-mm-yyyy hh24:mi:ss'), 490, 9, 62, 371, 8796425);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-07-2004 00:22:27', 'dd-mm-yyyy hh24:mi:ss'), 491, 6, 32, 703, 11221464);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-04-2005 07:24:23', 'dd-mm-yyyy hh24:mi:ss'), 492, 8, 84, 254, 25112977);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-11-2002 08:21:50', 'dd-mm-yyyy hh24:mi:ss'), 493, 5, 96, 758, 51948030);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-08-2004 14:02:32', 'dd-mm-yyyy hh24:mi:ss'), 494, 7, 93, 766, 96970243);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-11-2012 00:14:41', 'dd-mm-yyyy hh24:mi:ss'), 495, 5, 41, 83, 4370439);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-10-2004 21:04:53', 'dd-mm-yyyy hh24:mi:ss'), 496, 6, 26, 946, 25602009);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-07-2005 05:34:30', 'dd-mm-yyyy hh24:mi:ss'), 497, 10, 96, 502, 4370439);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-05-2000 17:35:13', 'dd-mm-yyyy hh24:mi:ss'), 498, 6, 46, 647, 88239853);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-01-2010 21:49:58', 'dd-mm-yyyy hh24:mi:ss'), 499, 6, 75, 750, 81865150);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-02-2000 15:50:32', 'dd-mm-yyyy hh24:mi:ss'), 500, 9, 26, 763, 30062117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-06-2014 13:34:36', 'dd-mm-yyyy hh24:mi:ss'), 501, 5, 21, 96, 87891090);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-03-2023 05:57:59', 'dd-mm-yyyy hh24:mi:ss'), 502, 8, 70, 674, 71805490);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-12-2002 16:41:31', 'dd-mm-yyyy hh24:mi:ss'), 503, 7, 71, 164, 50029824);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-12-2009 16:47:16', 'dd-mm-yyyy hh24:mi:ss'), 504, 6, 12, 830, 42322889);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-10-2005 12:51:41', 'dd-mm-yyyy hh24:mi:ss'), 505, 9, 45, 879, 50029824);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-12-2017 07:36:20', 'dd-mm-yyyy hh24:mi:ss'), 506, 10, 97, 582, 24290738);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-04-2008 07:59:13', 'dd-mm-yyyy hh24:mi:ss'), 507, 5, 52, 763, 30062117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-10-2022 18:39:36', 'dd-mm-yyyy hh24:mi:ss'), 508, 9, 16, 431, 83376974);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-02-2004 18:12:40', 'dd-mm-yyyy hh24:mi:ss'), 509, 7, 39, 806, 2591817);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-12-2005 16:40:04', 'dd-mm-yyyy hh24:mi:ss'), 510, 5, 37, 409, 25039816);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-02-2020 19:50:52', 'dd-mm-yyyy hh24:mi:ss'), 511, 7, 33, 879, 89122501);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-03-2024 21:30:05', 'dd-mm-yyyy hh24:mi:ss'), 512, 9, 6, 519, 2505457);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-03-2000 12:36:51', 'dd-mm-yyyy hh24:mi:ss'), 513, 7, 54, 188, 87218298);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-10-2024 06:18:34', 'dd-mm-yyyy hh24:mi:ss'), 514, 8, 93, 213, 64660127);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-04-2008 00:21:36', 'dd-mm-yyyy hh24:mi:ss'), 515, 10, 53, 766, 46639839);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-12-2024 17:40:59', 'dd-mm-yyyy hh24:mi:ss'), 516, 5, 81, 907, 88726887);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-02-2002 15:37:35', 'dd-mm-yyyy hh24:mi:ss'), 517, 6, 37, 659, 74889890);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-07-2006 12:22:19', 'dd-mm-yyyy hh24:mi:ss'), 518, 6, 42, 391, 92566199);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-03-2008 21:21:18', 'dd-mm-yyyy hh24:mi:ss'), 519, 5, 40, 967, 30062117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-03-2006 07:55:03', 'dd-mm-yyyy hh24:mi:ss'), 520, 6, 13, 195, 50900940);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-10-2008 08:20:32', 'dd-mm-yyyy hh24:mi:ss'), 521, 5, 2, 661, 35965202);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-03-2004 08:08:09', 'dd-mm-yyyy hh24:mi:ss'), 522, 5, 84, 244, 25039816);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-12-2021 12:04:19', 'dd-mm-yyyy hh24:mi:ss'), 523, 10, 35, 564, 87218298);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-01-2006 09:53:51', 'dd-mm-yyyy hh24:mi:ss'), 524, 8, 20, 129, 74889890);
commit;
prompt 300 records committed...
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-11-2001 19:03:04', 'dd-mm-yyyy hh24:mi:ss'), 525, 9, 11, 612, 54638372);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-06-2002 16:44:58', 'dd-mm-yyyy hh24:mi:ss'), 526, 10, 66, 653, 25039816);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-07-2004 17:51:21', 'dd-mm-yyyy hh24:mi:ss'), 527, 7, 53, 830, 13611451);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-09-2024 05:10:45', 'dd-mm-yyyy hh24:mi:ss'), 528, 6, 33, 363, 64027261);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-07-2010 07:45:07', 'dd-mm-yyyy hh24:mi:ss'), 529, 9, 39, 390, 46344277);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-06-2009 01:57:21', 'dd-mm-yyyy hh24:mi:ss'), 530, 10, 47, 901, 35965202);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-01-2016 12:59:54', 'dd-mm-yyyy hh24:mi:ss'), 531, 7, 52, 972, 11221464);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-08-2010 15:54:51', 'dd-mm-yyyy hh24:mi:ss'), 532, 7, 72, 421, 82804437);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-01-2006 09:36:43', 'dd-mm-yyyy hh24:mi:ss'), 533, 5, 8, 924, 6603015);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-09-2005 19:45:41', 'dd-mm-yyyy hh24:mi:ss'), 534, 6, 31, 294, 2938480);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-03-2002 06:51:50', 'dd-mm-yyyy hh24:mi:ss'), 535, 8, 28, 732, 24414730);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-09-2018 05:05:42', 'dd-mm-yyyy hh24:mi:ss'), 536, 7, 50, 244, 49908274);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-01-2018 19:31:00', 'dd-mm-yyyy hh24:mi:ss'), 537, 10, 30, 532, 15992467);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-04-2006 15:38:44', 'dd-mm-yyyy hh24:mi:ss'), 538, 7, 5, 577, 63595783);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-12-2021 12:23:54', 'dd-mm-yyyy hh24:mi:ss'), 539, 8, 69, 864, 42322889);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-05-2013 19:54:37', 'dd-mm-yyyy hh24:mi:ss'), 540, 7, 81, 193, 86272100);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-04-2018 17:50:12', 'dd-mm-yyyy hh24:mi:ss'), 541, 6, 99, 972, 88634045);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-01-2001 01:57:56', 'dd-mm-yyyy hh24:mi:ss'), 542, 8, 62, 815, 31471077);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-05-2020 04:10:07', 'dd-mm-yyyy hh24:mi:ss'), 543, 10, 36, 296, 33449046);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-06-2021 19:50:18', 'dd-mm-yyyy hh24:mi:ss'), 544, 6, 31, 659, 38125788);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-11-2023 15:31:49', 'dd-mm-yyyy hh24:mi:ss'), 545, 10, 8, 854, 87891090);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-12-2017 12:09:38', 'dd-mm-yyyy hh24:mi:ss'), 546, 6, 85, 83, 42322889);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-05-2004 23:03:33', 'dd-mm-yyyy hh24:mi:ss'), 547, 9, 48, 193, 32846918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-06-2019 13:06:05', 'dd-mm-yyyy hh24:mi:ss'), 548, 5, 75, 324, 88239853);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-09-2005 02:41:16', 'dd-mm-yyyy hh24:mi:ss'), 549, 10, 87, 651, 8081255);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-09-2009 02:22:07', 'dd-mm-yyyy hh24:mi:ss'), 550, 5, 13, 972, 4370439);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-05-2007 14:43:17', 'dd-mm-yyyy hh24:mi:ss'), 551, 5, 80, 865, 23041511);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-05-2023 03:08:29', 'dd-mm-yyyy hh24:mi:ss'), 552, 5, 25, 336, 34375443);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-10-2015 02:41:16', 'dd-mm-yyyy hh24:mi:ss'), 553, 8, 84, 564, 29742651);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-08-2021 21:07:46', 'dd-mm-yyyy hh24:mi:ss'), 554, 6, 47, 941, 54638372);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-05-2011 02:56:32', 'dd-mm-yyyy hh24:mi:ss'), 555, 9, 28, 946, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-10-2002 20:40:16', 'dd-mm-yyyy hh24:mi:ss'), 556, 6, 45, 698, 64027261);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-10-2005 08:03:07', 'dd-mm-yyyy hh24:mi:ss'), 557, 8, 46, 834, 90824185);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-04-2005 13:44:15', 'dd-mm-yyyy hh24:mi:ss'), 558, 10, 38, 901, 57601580);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-06-2001 05:01:32', 'dd-mm-yyyy hh24:mi:ss'), 559, 9, 76, 787, 49478035);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-04-2024 19:00:37', 'dd-mm-yyyy hh24:mi:ss'), 560, 9, 78, 255, 6603015);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-10-2013 12:08:12', 'dd-mm-yyyy hh24:mi:ss'), 561, 8, 63, 530, 91891117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-10-2020 01:55:03', 'dd-mm-yyyy hh24:mi:ss'), 562, 5, 67, 431, 13663159);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-03-2008 14:19:06', 'dd-mm-yyyy hh24:mi:ss'), 563, 10, 76, 45, 91891117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-06-2009 16:14:44', 'dd-mm-yyyy hh24:mi:ss'), 564, 9, 38, 246, 99375320);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-05-2004 20:47:02', 'dd-mm-yyyy hh24:mi:ss'), 565, 10, 84, 371, 22657272);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-03-2006 17:25:35', 'dd-mm-yyyy hh24:mi:ss'), 566, 9, 30, 391, 38125788);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-11-2024 21:01:26', 'dd-mm-yyyy hh24:mi:ss'), 567, 5, 27, 129, 88649232);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-06-2024 09:55:26', 'dd-mm-yyyy hh24:mi:ss'), 568, 8, 49, 651, 51397792);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-02-2001 06:03:18', 'dd-mm-yyyy hh24:mi:ss'), 569, 8, 12, 498, 14658929);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-10-2019 14:12:28', 'dd-mm-yyyy hh24:mi:ss'), 570, 6, 68, 255, 54757032);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-08-2018 00:24:11', 'dd-mm-yyyy hh24:mi:ss'), 571, 10, 21, 703, 30062117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-02-2024 11:49:55', 'dd-mm-yyyy hh24:mi:ss'), 572, 9, 44, 834, 49908274);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-07-2008 10:11:51', 'dd-mm-yyyy hh24:mi:ss'), 573, 7, 49, 591, 13663159);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-06-2019 13:43:14', 'dd-mm-yyyy hh24:mi:ss'), 574, 9, 7, 787, 47501817);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-10-2009 19:29:51', 'dd-mm-yyyy hh24:mi:ss'), 575, 6, 74, 3, 10951186);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-10-2004 04:32:00', 'dd-mm-yyyy hh24:mi:ss'), 576, 10, 29, 806, 27719925);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-06-2001 13:54:37', 'dd-mm-yyyy hh24:mi:ss'), 577, 7, 45, 253, 45412385);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-10-2024 00:05:11', 'dd-mm-yyyy hh24:mi:ss'), 578, 6, 14, 402, 24414730);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-03-2024 19:30:25', 'dd-mm-yyyy hh24:mi:ss'), 579, 9, 75, 610, 49537257);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-07-2001 11:16:30', 'dd-mm-yyyy hh24:mi:ss'), 580, 9, 2, 324, 730279);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-12-2014 05:06:08', 'dd-mm-yyyy hh24:mi:ss'), 581, 6, 57, 183, 20114821);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-04-2011 23:39:07', 'dd-mm-yyyy hh24:mi:ss'), 582, 7, 59, 83, 13663159);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-02-2008 12:56:44', 'dd-mm-yyyy hh24:mi:ss'), 583, 6, 25, 530, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-05-2021 20:52:13', 'dd-mm-yyyy hh24:mi:ss'), 584, 5, 72, 914, 42253574);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-01-2001 18:13:14', 'dd-mm-yyyy hh24:mi:ss'), 585, 10, 46, 246, 43217671);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-04-2021 17:36:48', 'dd-mm-yyyy hh24:mi:ss'), 586, 10, 61, 371, 11221464);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-01-2021 00:40:36', 'dd-mm-yyyy hh24:mi:ss'), 587, 6, 28, 659, 46639839);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-03-2011 19:13:09', 'dd-mm-yyyy hh24:mi:ss'), 588, 6, 7, 806, 86272100);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-04-2023 16:18:02', 'dd-mm-yyyy hh24:mi:ss'), 589, 5, 53, 11, 48536850);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-10-2003 14:19:32', 'dd-mm-yyyy hh24:mi:ss'), 590, 8, 51, 939, 32128888);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-07-2008 23:59:25', 'dd-mm-yyyy hh24:mi:ss'), 591, 8, 76, 164, 43436957);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-07-2013 01:02:55', 'dd-mm-yyyy hh24:mi:ss'), 592, 6, 29, 519, 78118267);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-03-2016 21:49:58', 'dd-mm-yyyy hh24:mi:ss'), 593, 6, 26, 626, 42253574);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-03-2003 13:54:11', 'dd-mm-yyyy hh24:mi:ss'), 594, 10, 64, 582, 41003550);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-09-2009 04:49:26', 'dd-mm-yyyy hh24:mi:ss'), 595, 5, 31, 96, 65058862);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-10-2021 09:32:49', 'dd-mm-yyyy hh24:mi:ss'), 596, 6, 18, 324, 31661429);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-06-2020 20:37:06', 'dd-mm-yyyy hh24:mi:ss'), 597, 10, 8, 246, 54985818);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-12-2023 11:45:27', 'dd-mm-yyyy hh24:mi:ss'), 598, 6, 79, 834, 9077728);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-05-2011 17:15:12', 'dd-mm-yyyy hh24:mi:ss'), 599, 9, 1, 659, 88239853);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-04-2001 17:27:53', 'dd-mm-yyyy hh24:mi:ss'), 600, 5, 92, 610, 10854394);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-05-2006 08:40:42', 'dd-mm-yyyy hh24:mi:ss'), 601, 8, 99, 864, 91089992);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-02-2003 01:41:57', 'dd-mm-yyyy hh24:mi:ss'), 602, 5, 32, 402, 34375443);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-12-2017 07:22:48', 'dd-mm-yyyy hh24:mi:ss'), 603, 9, 53, 402, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-02-2024 21:20:44', 'dd-mm-yyyy hh24:mi:ss'), 604, 5, 85, 806, 83376974);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-10-2009 06:24:37', 'dd-mm-yyyy hh24:mi:ss'), 605, 8, 41, 972, 31661429);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-08-2003 17:11:45', 'dd-mm-yyyy hh24:mi:ss'), 606, 8, 88, 612, 82804437);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-04-2011 00:45:12', 'dd-mm-yyyy hh24:mi:ss'), 607, 6, 26, 941, 39997409);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-01-2022 06:30:05', 'dd-mm-yyyy hh24:mi:ss'), 608, 7, 37, 183, 42322889);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-10-2006 14:02:32', 'dd-mm-yyyy hh24:mi:ss'), 609, 7, 6, 396, 27803037);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-01-2000 15:27:38', 'dd-mm-yyyy hh24:mi:ss'), 610, 6, 52, 164, 50900940);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-12-2005 18:25:29', 'dd-mm-yyyy hh24:mi:ss'), 611, 7, 24, 500, 54985818);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-07-2018 22:21:04', 'dd-mm-yyyy hh24:mi:ss'), 612, 5, 66, 391, 51948030);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-07-2010 08:34:48', 'dd-mm-yyyy hh24:mi:ss'), 613, 7, 77, 674, 53737541);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-02-2006 14:56:58', 'dd-mm-yyyy hh24:mi:ss'), 614, 8, 41, 20, 13663159);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-12-2012 08:47:45', 'dd-mm-yyyy hh24:mi:ss'), 615, 10, 96, 865, 2505457);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-11-2005 13:44:24', 'dd-mm-yyyy hh24:mi:ss'), 616, 8, 82, 658, 49478035);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-07-2007 16:19:29', 'dd-mm-yyyy hh24:mi:ss'), 617, 7, 55, 941, 37865911);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-10-2002 14:55:49', 'dd-mm-yyyy hh24:mi:ss'), 618, 7, 60, 530, 91703316);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-07-2004 12:20:09', 'dd-mm-yyyy hh24:mi:ss'), 619, 5, 59, 661, 91703316);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-03-2016 19:54:11', 'dd-mm-yyyy hh24:mi:ss'), 620, 8, 67, 939, 43217671);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-07-2002 13:05:57', 'dd-mm-yyyy hh24:mi:ss'), 621, 10, 32, 3, 6603015);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-08-2004 23:43:09', 'dd-mm-yyyy hh24:mi:ss'), 622, 10, 45, 298, 44623593);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-07-2004 14:21:41', 'dd-mm-yyyy hh24:mi:ss'), 623, 10, 1, 137, 58647622);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-04-2015 14:38:41', 'dd-mm-yyyy hh24:mi:ss'), 624, 9, 42, 188, 61751644);
commit;
prompt 400 records committed...
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-11-2001 10:19:03', 'dd-mm-yyyy hh24:mi:ss'), 625, 9, 5, 500, 33449046);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-03-2010 00:13:23', 'dd-mm-yyyy hh24:mi:ss'), 626, 8, 72, 389, 70178481);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-05-2011 02:55:32', 'dd-mm-yyyy hh24:mi:ss'), 627, 10, 64, 254, 35965202);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-07-2004 11:24:00', 'dd-mm-yyyy hh24:mi:ss'), 628, 9, 73, 73, 43436957);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-12-2016 19:00:46', 'dd-mm-yyyy hh24:mi:ss'), 629, 7, 34, 137, 73434651);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-12-2011 23:25:26', 'dd-mm-yyyy hh24:mi:ss'), 630, 8, 38, 94, 29207505);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-10-2013 11:00:23', 'dd-mm-yyyy hh24:mi:ss'), 631, 9, 10, 389, 47501817);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-09-2023 06:47:05', 'dd-mm-yyyy hh24:mi:ss'), 632, 7, 1, 591, 33449046);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-09-2005 21:57:18', 'dd-mm-yyyy hh24:mi:ss'), 633, 8, 67, 519, 43436957);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-05-2023 02:23:42', 'dd-mm-yyyy hh24:mi:ss'), 634, 6, 71, 946, 63990543);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-10-2019 00:04:53', 'dd-mm-yyyy hh24:mi:ss'), 635, 5, 18, 522, 73434651);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-07-2001 14:15:30', 'dd-mm-yyyy hh24:mi:ss'), 636, 6, 99, 213, 96970243);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-03-2021 17:57:59', 'dd-mm-yyyy hh24:mi:ss'), 637, 9, 71, 941, 34375443);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-01-2012 21:31:40', 'dd-mm-yyyy hh24:mi:ss'), 638, 9, 23, 502, 43436957);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-11-2021 00:14:06', 'dd-mm-yyyy hh24:mi:ss'), 639, 5, 59, 253, 20114821);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-08-2008 13:31:52', 'dd-mm-yyyy hh24:mi:ss'), 640, 7, 81, 336, 27719925);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-08-2021 16:35:28', 'dd-mm-yyyy hh24:mi:ss'), 641, 6, 55, 296, 53483220);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-08-2008 21:31:32', 'dd-mm-yyyy hh24:mi:ss'), 642, 7, 48, 20, 38125788);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-04-2005 15:54:17', 'dd-mm-yyyy hh24:mi:ss'), 643, 10, 43, 73, 43217671);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-04-2024 07:20:47', 'dd-mm-yyyy hh24:mi:ss'), 644, 6, 33, 244, 14725165);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-12-2024 11:12:46', 'dd-mm-yyyy hh24:mi:ss'), 645, 8, 74, 402, 89122501);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-09-2017 18:52:07', 'dd-mm-yyyy hh24:mi:ss'), 646, 8, 71, 865, 88634045);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-09-2010 04:24:31', 'dd-mm-yyyy hh24:mi:ss'), 647, 5, 45, 530, 30062117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-08-2007 23:14:55', 'dd-mm-yyyy hh24:mi:ss'), 648, 6, 21, 255, 11221464);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-09-2023 12:45:38', 'dd-mm-yyyy hh24:mi:ss'), 649, 10, 48, 498, 2376368);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-12-2012 08:17:48', 'dd-mm-yyyy hh24:mi:ss'), 650, 7, 4, 830, 11221464);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-05-2020 00:21:36', 'dd-mm-yyyy hh24:mi:ss'), 651, 10, 52, 502, 49908274);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-10-2021 23:57:41', 'dd-mm-yyyy hh24:mi:ss'), 652, 9, 2, 294, 41060366);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-06-2006 16:07:49', 'dd-mm-yyyy hh24:mi:ss'), 653, 7, 27, 854, 24414730);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-07-2005 18:59:28', 'dd-mm-yyyy hh24:mi:ss'), 654, 7, 66, 591, 92566199);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-12-2016 09:07:29', 'dd-mm-yyyy hh24:mi:ss'), 655, 9, 83, 196, 58647622);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-02-2015 08:01:06', 'dd-mm-yyyy hh24:mi:ss'), 656, 8, 62, 924, 87891090);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-12-2012 17:26:35', 'dd-mm-yyyy hh24:mi:ss'), 657, 10, 98, 834, 91089992);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-04-2005 09:03:53', 'dd-mm-yyyy hh24:mi:ss'), 658, 5, 2, 806, 54985818);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-04-2021 18:24:11', 'dd-mm-yyyy hh24:mi:ss'), 659, 6, 76, 555, 24290738);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-02-2021 12:15:50', 'dd-mm-yyyy hh24:mi:ss'), 660, 6, 26, 972, 13663159);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-09-2008 14:14:47', 'dd-mm-yyyy hh24:mi:ss'), 661, 5, 11, 363, 48536850);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-07-2001 08:57:59', 'dd-mm-yyyy hh24:mi:ss'), 662, 8, 20, 195, 92566199);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-02-2020 03:06:37', 'dd-mm-yyyy hh24:mi:ss'), 663, 9, 50, 914, 48536850);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-08-2016 21:49:40', 'dd-mm-yyyy hh24:mi:ss'), 664, 8, 38, 20, 39725987);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-12-2016 22:49:52', 'dd-mm-yyyy hh24:mi:ss'), 665, 8, 64, 570, 34375443);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-09-2019 18:27:04', 'dd-mm-yyyy hh24:mi:ss'), 666, 7, 82, 254, 30062117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-10-2003 20:37:58', 'dd-mm-yyyy hh24:mi:ss'), 667, 9, 77, 879, 26290962);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-08-2013 15:14:32', 'dd-mm-yyyy hh24:mi:ss'), 668, 6, 94, 763, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-05-2006 08:44:09', 'dd-mm-yyyy hh24:mi:ss'), 669, 6, 82, 421, 41518918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-01-2019 07:43:40', 'dd-mm-yyyy hh24:mi:ss'), 670, 10, 32, 787, 20114821);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-04-2012 19:37:03', 'dd-mm-yyyy hh24:mi:ss'), 671, 8, 20, 183, 1055314);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-11-2012 18:16:42', 'dd-mm-yyyy hh24:mi:ss'), 672, 10, 76, 519, 2505457);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-01-2011 16:35:54', 'dd-mm-yyyy hh24:mi:ss'), 673, 10, 76, 11, 30411578);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-12-2024 19:24:31', 'dd-mm-yyyy hh24:mi:ss'), 674, 10, 26, 732, 46344277);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-08-2020 23:25:09', 'dd-mm-yyyy hh24:mi:ss'), 675, 8, 40, 626, 30463411);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-05-2004 22:09:33', 'dd-mm-yyyy hh24:mi:ss'), 676, 9, 35, 732, 99375320);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-08-2017 23:27:27', 'dd-mm-yyyy hh24:mi:ss'), 677, 8, 71, 324, 24414730);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-11-2022 13:53:28', 'dd-mm-yyyy hh24:mi:ss'), 678, 6, 12, 183, 13663159);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-05-2001 11:18:14', 'dd-mm-yyyy hh24:mi:ss'), 679, 6, 62, 661, 2450269);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-01-2008 11:46:45', 'dd-mm-yyyy hh24:mi:ss'), 680, 9, 96, 498, 30463411);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-02-2009 05:39:33', 'dd-mm-yyyy hh24:mi:ss'), 681, 5, 31, 930, 91703316);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-12-2020 18:47:57', 'dd-mm-yyyy hh24:mi:ss'), 682, 7, 81, 73, 30411578);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-03-2007 02:33:47', 'dd-mm-yyyy hh24:mi:ss'), 683, 5, 47, 907, 10854394);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-01-2001 19:30:34', 'dd-mm-yyyy hh24:mi:ss'), 684, 9, 3, 758, 7673525);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-12-2011 19:27:07', 'dd-mm-yyyy hh24:mi:ss'), 685, 9, 27, 914, 20114821);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-03-2020 21:05:36', 'dd-mm-yyyy hh24:mi:ss'), 686, 9, 59, 389, 79260141);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-04-2022 14:38:15', 'dd-mm-yyyy hh24:mi:ss'), 687, 8, 33, 914, 61751644);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-10-2011 06:16:24', 'dd-mm-yyyy hh24:mi:ss'), 688, 5, 22, 879, 50968404);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-11-2024 05:26:09', 'dd-mm-yyyy hh24:mi:ss'), 689, 6, 25, 582, 51397792);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-07-2011 06:29:13', 'dd-mm-yyyy hh24:mi:ss'), 690, 7, 44, 653, 91089992);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-06-2015 04:24:57', 'dd-mm-yyyy hh24:mi:ss'), 691, 10, 27, 763, 1055314);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-09-2016 01:28:16', 'dd-mm-yyyy hh24:mi:ss'), 692, 5, 65, 901, 88726887);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-04-2012 16:57:47', 'dd-mm-yyyy hh24:mi:ss'), 693, 6, 85, 20, 89122501);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-07-2002 04:48:25', 'dd-mm-yyyy hh24:mi:ss'), 694, 7, 90, 707, 4370439);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-01-2005 03:46:13', 'dd-mm-yyyy hh24:mi:ss'), 695, 7, 51, 570, 63990543);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-03-2005 03:24:46', 'dd-mm-yyyy hh24:mi:ss'), 696, 5, 2, 363, 13611451);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-06-2003 18:37:43', 'dd-mm-yyyy hh24:mi:ss'), 697, 8, 6, 806, 53483220);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-08-2003 05:53:39', 'dd-mm-yyyy hh24:mi:ss'), 698, 10, 94, 3, 30411578);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-02-2005 18:31:58', 'dd-mm-yyyy hh24:mi:ss'), 699, 9, 98, 815, 99887779);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-01-2012 11:51:12', 'dd-mm-yyyy hh24:mi:ss'), 700, 8, 92, 20, 49537257);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-07-2017 20:59:08', 'dd-mm-yyyy hh24:mi:ss'), 1, 8, 43, 930, 2591817);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-08-2001 22:39:56', 'dd-mm-yyyy hh24:mi:ss'), 2, 5, 73, 582, 31471077);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-07-2021 17:13:20', 'dd-mm-yyyy hh24:mi:ss'), 3, 6, 1, 177, 31471077);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-11-2013 18:29:57', 'dd-mm-yyyy hh24:mi:ss'), 4, 7, 19, 610, 2505457);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-12-2008 15:15:59', 'dd-mm-yyyy hh24:mi:ss'), 5, 7, 9, 530, 35965202);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-06-2019 09:38:35', 'dd-mm-yyyy hh24:mi:ss'), 6, 8, 33, 246, 7673525);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-03-2015 20:03:07', 'dd-mm-yyyy hh24:mi:ss'), 7, 7, 82, 703, 90824185);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-09-2011 22:48:43', 'dd-mm-yyyy hh24:mi:ss'), 8, 10, 14, 698, 88634045);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-02-2016 16:36:28', 'dd-mm-yyyy hh24:mi:ss'), 9, 6, 55, 806, 40091598);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-03-2018 08:29:02', 'dd-mm-yyyy hh24:mi:ss'), 10, 9, 50, 10, 37865911);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-04-2014 09:07:46', 'dd-mm-yyyy hh24:mi:ss'), 11, 6, 20, 570, 63595783);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-05-2005 20:48:37', 'dd-mm-yyyy hh24:mi:ss'), 12, 6, 16, 73, 15992467);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-10-2021 08:34:04', 'dd-mm-yyyy hh24:mi:ss'), 13, 5, 81, 972, 37865911);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-06-2023 03:10:48', 'dd-mm-yyyy hh24:mi:ss'), 14, 6, 68, 402, 2376368);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-02-2022 18:43:37', 'dd-mm-yyyy hh24:mi:ss'), 15, 6, 48, 517, 8081255);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-09-2023 07:06:40', 'dd-mm-yyyy hh24:mi:ss'), 16, 5, 12, 907, 11221464);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-11-2020 19:39:38', 'dd-mm-yyyy hh24:mi:ss'), 17, 8, 44, 787, 50968404);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-01-2009 13:00:54', 'dd-mm-yyyy hh24:mi:ss'), 18, 10, 90, 249, 81865150);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-10-2015 14:30:02', 'dd-mm-yyyy hh24:mi:ss'), 19, 9, 35, 764, 25602009);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-10-2022 02:07:17', 'dd-mm-yyyy hh24:mi:ss'), 20, 7, 94, 707, 71805490);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-12-2017 16:30:34', 'dd-mm-yyyy hh24:mi:ss'), 21, 6, 91, 787, 14725165);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-02-2017 13:12:43', 'dd-mm-yyyy hh24:mi:ss'), 22, 10, 88, 854, 81865150);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-08-2011 20:36:48', 'dd-mm-yyyy hh24:mi:ss'), 23, 5, 22, 830, 63990543);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-04-2016 09:16:33', 'dd-mm-yyyy hh24:mi:ss'), 24, 5, 43, 254, 46344277);
commit;
prompt 500 records committed...
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-09-2002 01:23:57', 'dd-mm-yyyy hh24:mi:ss'), 25, 9, 35, 787, 82804437);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-06-2017 05:10:01', 'dd-mm-yyyy hh24:mi:ss'), 26, 9, 38, 787, 30411578);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-07-2001 13:14:52', 'dd-mm-yyyy hh24:mi:ss'), 27, 6, 13, 732, 13611451);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-03-2000 23:23:34', 'dd-mm-yyyy hh24:mi:ss'), 28, 10, 25, 196, 49537257);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-10-2017 11:01:58', 'dd-mm-yyyy hh24:mi:ss'), 29, 8, 82, 764, 2938480);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-01-2020 10:50:00', 'dd-mm-yyyy hh24:mi:ss'), 30, 7, 25, 254, 88634045);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-12-2010 19:39:12', 'dd-mm-yyyy hh24:mi:ss'), 31, 6, 90, 924, 25602009);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-05-2002 11:45:44', 'dd-mm-yyyy hh24:mi:ss'), 32, 7, 33, 647, 9077728);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-03-2022 14:37:49', 'dd-mm-yyyy hh24:mi:ss'), 33, 8, 89, 907, 30411578);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-07-2009 11:55:49', 'dd-mm-yyyy hh24:mi:ss'), 34, 5, 11, 907, 81276702);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-04-2008 03:49:23', 'dd-mm-yyyy hh24:mi:ss'), 35, 10, 35, 294, 1055314);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-06-2017 11:37:06', 'dd-mm-yyyy hh24:mi:ss'), 36, 9, 27, 10, 23041511);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-04-2008 03:29:48', 'dd-mm-yyyy hh24:mi:ss'), 37, 8, 38, 834, 52154939);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-03-2004 04:34:36', 'dd-mm-yyyy hh24:mi:ss'), 38, 7, 99, 914, 30411578);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-08-2004 13:57:30', 'dd-mm-yyyy hh24:mi:ss'), 39, 6, 74, 195, 10854394);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-07-2017 13:35:19', 'dd-mm-yyyy hh24:mi:ss'), 40, 6, 54, 707, 34375443);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-11-2013 18:09:12', 'dd-mm-yyyy hh24:mi:ss'), 41, 8, 55, 196, 27719925);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-10-2020 09:57:44', 'dd-mm-yyyy hh24:mi:ss'), 42, 9, 17, 577, 81276702);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-07-2009 16:50:09', 'dd-mm-yyyy hh24:mi:ss'), 43, 7, 68, 972, 24414730);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-02-2014 02:46:01', 'dd-mm-yyyy hh24:mi:ss'), 44, 7, 45, 651, 51948030);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-11-2024 09:12:14', 'dd-mm-yyyy hh24:mi:ss'), 45, 7, 28, 763, 88726887);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-07-2009 07:44:15', 'dd-mm-yyyy hh24:mi:ss'), 46, 5, 97, 363, 23041511);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-05-2020 02:10:53', 'dd-mm-yyyy hh24:mi:ss'), 47, 5, 27, 766, 99887779);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-07-2022 07:02:12', 'dd-mm-yyyy hh24:mi:ss'), 48, 9, 36, 748, 90824185);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-11-2021 10:01:12', 'dd-mm-yyyy hh24:mi:ss'), 49, 5, 89, 188, 2505457);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-11-2003 04:39:38', 'dd-mm-yyyy hh24:mi:ss'), 50, 6, 44, 612, 19067900);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-11-2023 10:12:43', 'dd-mm-yyyy hh24:mi:ss'), 51, 10, 20, 703, 41003550);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-05-2017 08:14:29', 'dd-mm-yyyy hh24:mi:ss'), 52, 8, 40, 748, 26290962);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-05-2004 01:24:23', 'dd-mm-yyyy hh24:mi:ss'), 53, 5, 67, 659, 45505216);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-05-2011 01:12:43', 'dd-mm-yyyy hh24:mi:ss'), 54, 9, 5, 188, 10951186);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-10-2022 05:25:43', 'dd-mm-yyyy hh24:mi:ss'), 55, 6, 100, 188, 33449046);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-11-2018 09:51:59', 'dd-mm-yyyy hh24:mi:ss'), 56, 7, 82, 196, 45505216);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-05-2007 06:19:00', 'dd-mm-yyyy hh24:mi:ss'), 57, 5, 22, 659, 83376974);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-12-2002 08:44:26', 'dd-mm-yyyy hh24:mi:ss'), 58, 5, 89, 530, 29658657);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-08-2006 05:49:46', 'dd-mm-yyyy hh24:mi:ss'), 59, 7, 76, 402, 53737541);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-09-2008 08:49:55', 'dd-mm-yyyy hh24:mi:ss'), 60, 10, 79, 177, 41003550);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-02-2008 22:49:52', 'dd-mm-yyyy hh24:mi:ss'), 61, 8, 25, 924, 57601580);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-05-2014 11:48:28', 'dd-mm-yyyy hh24:mi:ss'), 62, 5, 96, 431, 33915414);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-09-2014 18:38:00', 'dd-mm-yyyy hh24:mi:ss'), 63, 10, 94, 532, 25039816);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-10-2004 09:00:51', 'dd-mm-yyyy hh24:mi:ss'), 64, 5, 95, 924, 51397792);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-07-2024 09:24:54', 'dd-mm-yyyy hh24:mi:ss'), 65, 5, 45, 421, 37865911);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-08-2004 16:19:03', 'dd-mm-yyyy hh24:mi:ss'), 66, 7, 55, 94, 37921065);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-12-2023 11:39:15', 'dd-mm-yyyy hh24:mi:ss'), 67, 9, 14, 177, 30463411);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-04-2005 04:09:59', 'dd-mm-yyyy hh24:mi:ss'), 68, 6, 43, 659, 63990543);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-12-2014 22:41:22', 'dd-mm-yyyy hh24:mi:ss'), 69, 9, 48, 766, 92566199);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-10-2022 18:05:19', 'dd-mm-yyyy hh24:mi:ss'), 70, 9, 79, 65, 45505216);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-11-2021 11:27:18', 'dd-mm-yyyy hh24:mi:ss'), 71, 9, 92, 564, 41518918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-12-2018 07:47:25', 'dd-mm-yyyy hh24:mi:ss'), 72, 9, 98, 647, 50029824);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-10-2018 13:44:41', 'dd-mm-yyyy hh24:mi:ss'), 73, 7, 30, 193, 26290962);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-04-2015 20:28:53', 'dd-mm-yyyy hh24:mi:ss'), 74, 7, 97, 834, 70178481);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-11-2009 17:23:08', 'dd-mm-yyyy hh24:mi:ss'), 75, 6, 4, 766, 97813459);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-08-2004 21:40:01', 'dd-mm-yyyy hh24:mi:ss'), 76, 10, 28, 564, 40091598);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-04-2010 19:11:34', 'dd-mm-yyyy hh24:mi:ss'), 77, 7, 27, 519, 71805490);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-08-2012 19:41:48', 'dd-mm-yyyy hh24:mi:ss'), 78, 10, 100, 764, 1055314);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-09-2009 02:39:59', 'dd-mm-yyyy hh24:mi:ss'), 79, 10, 74, 3, 7860731);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-01-2024 08:35:31', 'dd-mm-yyyy hh24:mi:ss'), 80, 6, 79, 532, 43049144);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-03-2018 01:03:04', 'dd-mm-yyyy hh24:mi:ss'), 81, 8, 87, 213, 13611451);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-05-2015 02:22:50', 'dd-mm-yyyy hh24:mi:ss'), 82, 7, 30, 296, 96970243);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-10-2005 15:35:42', 'dd-mm-yyyy hh24:mi:ss'), 83, 10, 88, 183, 20103782);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-01-2019 13:00:02', 'dd-mm-yyyy hh24:mi:ss'), 84, 8, 60, 94, 1055314);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-06-2019 11:34:22', 'dd-mm-yyyy hh24:mi:ss'), 85, 5, 90, 907, 88726887);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-04-2005 06:10:22', 'dd-mm-yyyy hh24:mi:ss'), 86, 6, 98, 226, 50900940);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-06-2008 16:02:55', 'dd-mm-yyyy hh24:mi:ss'), 87, 8, 11, 651, 14725165);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-02-2004 03:05:28', 'dd-mm-yyyy hh24:mi:ss'), 88, 8, 23, 530, 29203895);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-06-2022 21:10:39', 'dd-mm-yyyy hh24:mi:ss'), 89, 9, 48, 659, 88726887);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-11-2014 11:47:19', 'dd-mm-yyyy hh24:mi:ss'), 90, 7, 90, 129, 33449046);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-07-2008 00:22:01', 'dd-mm-yyyy hh24:mi:ss'), 91, 10, 38, 914, 46639839);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-08-2023 22:02:03', 'dd-mm-yyyy hh24:mi:ss'), 92, 6, 15, 647, 86272100);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-06-2012 01:35:28', 'dd-mm-yyyy hh24:mi:ss'), 93, 6, 27, 763, 51948030);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-09-2017 17:17:57', 'dd-mm-yyyy hh24:mi:ss'), 94, 9, 25, 517, 22432753);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-01-2021 13:46:33', 'dd-mm-yyyy hh24:mi:ss'), 95, 6, 42, 764, 81276702);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-02-2001 17:57:33', 'dd-mm-yyyy hh24:mi:ss'), 96, 10, 67, 500, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-02-2010 22:18:46', 'dd-mm-yyyy hh24:mi:ss'), 97, 6, 76, 255, 45505216);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-08-2010 03:11:48', 'dd-mm-yyyy hh24:mi:ss'), 98, 10, 51, 830, 37921065);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-05-2000 15:26:29', 'dd-mm-yyyy hh24:mi:ss'), 99, 5, 3, 806, 37865911);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-07-2018 00:17:08', 'dd-mm-yyyy hh24:mi:ss'), 100, 8, 43, 763, 63990543);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-05-2003 04:33:18', 'dd-mm-yyyy hh24:mi:ss'), 101, 9, 44, 564, 57601580);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-10-2013 06:55:00', 'dd-mm-yyyy hh24:mi:ss'), 102, 10, 10, 834, 39997409);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-03-2013 23:18:40', 'dd-mm-yyyy hh24:mi:ss'), 103, 9, 33, 500, 74889890);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-04-2015 00:03:10', 'dd-mm-yyyy hh24:mi:ss'), 104, 8, 50, 932, 2376368);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-07-2017 06:45:56', 'dd-mm-yyyy hh24:mi:ss'), 105, 10, 21, 707, 49908274);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-12-2019 03:22:53', 'dd-mm-yyyy hh24:mi:ss'), 106, 8, 97, 726, 29742651);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-07-2012 11:50:55', 'dd-mm-yyyy hh24:mi:ss'), 107, 6, 27, 726, 41060366);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-09-2005 13:52:36', 'dd-mm-yyyy hh24:mi:ss'), 108, 8, 1, 65, 51948030);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-02-2020 01:50:44', 'dd-mm-yyyy hh24:mi:ss'), 109, 5, 53, 732, 24414730);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-02-2008 14:15:12', 'dd-mm-yyyy hh24:mi:ss'), 110, 7, 93, 946, 46344277);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-08-2012 01:47:34', 'dd-mm-yyyy hh24:mi:ss'), 111, 10, 11, 195, 88649232);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-01-2020 21:07:29', 'dd-mm-yyyy hh24:mi:ss'), 112, 9, 72, 213, 32846918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-08-2012 08:13:46', 'dd-mm-yyyy hh24:mi:ss'), 113, 9, 91, 498, 88634045);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-10-2015 10:28:59', 'dd-mm-yyyy hh24:mi:ss'), 114, 6, 58, 249, 41060366);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-01-2021 19:03:30', 'dd-mm-yyyy hh24:mi:ss'), 115, 6, 57, 941, 2591817);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-06-2003 01:59:13', 'dd-mm-yyyy hh24:mi:ss'), 116, 5, 91, 834, 40293735);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-09-2019 02:54:40', 'dd-mm-yyyy hh24:mi:ss'), 117, 8, 89, 815, 30463411);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-05-2020 18:45:56', 'dd-mm-yyyy hh24:mi:ss'), 118, 9, 4, 196, 24290738);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-05-2014 13:55:37', 'dd-mm-yyyy hh24:mi:ss'), 119, 6, 92, 967, 30411578);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-04-2015 10:01:03', 'dd-mm-yyyy hh24:mi:ss'), 120, 7, 62, 517, 79910635);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-10-2013 10:33:01', 'dd-mm-yyyy hh24:mi:ss'), 121, 8, 62, 254, 65058862);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-11-2013 08:35:31', 'dd-mm-yyyy hh24:mi:ss'), 122, 7, 90, 363, 20114821);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-10-2000 05:36:48', 'dd-mm-yyyy hh24:mi:ss'), 123, 8, 27, 519, 43217671);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-08-2001 22:48:34', 'dd-mm-yyyy hh24:mi:ss'), 124, 9, 4, 498, 88649232);
commit;
prompt 600 records committed...
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-11-2023 00:48:14', 'dd-mm-yyyy hh24:mi:ss'), 125, 5, 60, 763, 44623593);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-02-2007 06:26:38', 'dd-mm-yyyy hh24:mi:ss'), 126, 8, 4, 409, 41003550);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-05-2020 03:22:45', 'dd-mm-yyyy hh24:mi:ss'), 127, 6, 74, 577, 63990543);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-06-2020 20:23:08', 'dd-mm-yyyy hh24:mi:ss'), 128, 9, 52, 658, 41060366);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-06-2004 23:59:08', 'dd-mm-yyyy hh24:mi:ss'), 129, 5, 23, 246, 99887779);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-02-2011 01:49:00', 'dd-mm-yyyy hh24:mi:ss'), 130, 10, 23, 658, 33449046);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-01-2012 05:16:30', 'dd-mm-yyyy hh24:mi:ss'), 131, 8, 26, 363, 86272100);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-10-2004 03:00:00', 'dd-mm-yyyy hh24:mi:ss'), 132, 7, 70, 764, 32128888);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-09-2024 13:10:59', 'dd-mm-yyyy hh24:mi:ss'), 133, 8, 29, 73, 730279);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-06-2019 07:39:38', 'dd-mm-yyyy hh24:mi:ss'), 134, 7, 79, 967, 49537257);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-02-2011 21:40:01', 'dd-mm-yyyy hh24:mi:ss'), 135, 9, 25, 254, 13611451);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-01-2006 01:52:45', 'dd-mm-yyyy hh24:mi:ss'), 136, 10, 51, 164, 79693276);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-08-2017 06:58:27', 'dd-mm-yyyy hh24:mi:ss'), 137, 9, 42, 257, 1282269);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-05-2000 19:52:27', 'dd-mm-yyyy hh24:mi:ss'), 138, 9, 56, 389, 15992467);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-11-2019 04:39:30', 'dd-mm-yyyy hh24:mi:ss'), 139, 7, 44, 3, 2938480);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-12-2014 22:37:55', 'dd-mm-yyyy hh24:mi:ss'), 140, 8, 16, 164, 79260141);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-09-2010 16:50:18', 'dd-mm-yyyy hh24:mi:ss'), 141, 9, 25, 336, 79192786);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-06-2012 10:29:16', 'dd-mm-yyyy hh24:mi:ss'), 142, 10, 97, 244, 29742651);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-05-2000 02:32:29', 'dd-mm-yyyy hh24:mi:ss'), 143, 7, 46, 502, 63990543);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-09-2014 10:51:27', 'dd-mm-yyyy hh24:mi:ss'), 144, 5, 35, 177, 31661429);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-02-2016 17:24:25', 'dd-mm-yyyy hh24:mi:ss'), 145, 8, 73, 500, 40091598);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-04-2012 23:09:01', 'dd-mm-yyyy hh24:mi:ss'), 146, 8, 15, 83, 91891117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-09-2021 00:22:53', 'dd-mm-yyyy hh24:mi:ss'), 147, 6, 6, 865, 14725165);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-10-2002 07:39:04', 'dd-mm-yyyy hh24:mi:ss'), 148, 9, 30, 296, 90824185);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-08-2013 15:41:36', 'dd-mm-yyyy hh24:mi:ss'), 149, 5, 87, 555, 48536850);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-11-2006 13:32:00', 'dd-mm-yyyy hh24:mi:ss'), 150, 10, 11, 879, 58647622);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-05-2022 17:53:22', 'dd-mm-yyyy hh24:mi:ss'), 151, 8, 14, 658, 20103782);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-12-2020 20:35:22', 'dd-mm-yyyy hh24:mi:ss'), 152, 10, 36, 255, 1055314);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-11-2017 17:22:59', 'dd-mm-yyyy hh24:mi:ss'), 153, 10, 88, 502, 52154939);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-12-2007 19:17:54', 'dd-mm-yyyy hh24:mi:ss'), 154, 5, 63, 296, 8796425);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-02-2007 09:41:36', 'dd-mm-yyyy hh24:mi:ss'), 155, 10, 79, 787, 10854394);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('21-12-2018 05:49:37', 'dd-mm-yyyy hh24:mi:ss'), 156, 9, 27, 195, 14658929);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('07-10-2024 02:20:24', 'dd-mm-yyyy hh24:mi:ss'), 157, 8, 40, 658, 29658657);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-12-2000 02:15:21', 'dd-mm-yyyy hh24:mi:ss'), 158, 6, 28, 390, 49053838);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('24-04-2002 07:06:57', 'dd-mm-yyyy hh24:mi:ss'), 159, 8, 11, 854, 27719925);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-01-2005 02:57:15', 'dd-mm-yyyy hh24:mi:ss'), 160, 9, 37, 363, 88634045);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-05-2016 03:28:30', 'dd-mm-yyyy hh24:mi:ss'), 161, 6, 43, 83, 15992467);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-04-2024 07:18:02', 'dd-mm-yyyy hh24:mi:ss'), 162, 7, 70, 924, 89122501);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-01-2001 10:37:37', 'dd-mm-yyyy hh24:mi:ss'), 163, 9, 63, 707, 70178481);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-05-2018 14:12:02', 'dd-mm-yyyy hh24:mi:ss'), 164, 5, 27, 371, 61751644);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-02-2007 05:02:06', 'dd-mm-yyyy hh24:mi:ss'), 165, 9, 99, 83, 87218298);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-04-2010 16:48:17', 'dd-mm-yyyy hh24:mi:ss'), 166, 5, 25, 834, 43049144);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-07-2009 12:02:18', 'dd-mm-yyyy hh24:mi:ss'), 167, 7, 31, 939, 61751644);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-06-2016 17:38:58', 'dd-mm-yyyy hh24:mi:ss'), 168, 6, 82, 612, 91703316);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-12-2021 06:30:31', 'dd-mm-yyyy hh24:mi:ss'), 169, 5, 74, 901, 86272100);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-07-2019 13:03:12', 'dd-mm-yyyy hh24:mi:ss'), 170, 10, 34, 257, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-04-2014 03:37:52', 'dd-mm-yyyy hh24:mi:ss'), 171, 7, 69, 253, 13611451);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-04-2024 06:03:01', 'dd-mm-yyyy hh24:mi:ss'), 172, 9, 38, 389, 4370439);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('12-02-2003 04:13:43', 'dd-mm-yyyy hh24:mi:ss'), 173, 6, 7, 396, 37865911);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('09-03-2008 23:20:58', 'dd-mm-yyyy hh24:mi:ss'), 174, 8, 31, 941, 14725165);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-02-2018 05:16:39', 'dd-mm-yyyy hh24:mi:ss'), 175, 5, 66, 213, 44715352);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-08-2000 20:53:31', 'dd-mm-yyyy hh24:mi:ss'), 176, 8, 78, 213, 44623593);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-11-2022 08:48:46', 'dd-mm-yyyy hh24:mi:ss'), 177, 9, 28, 763, 88239853);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-09-2021 00:26:47', 'dd-mm-yyyy hh24:mi:ss'), 178, 10, 62, 363, 91891117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('19-03-2002 02:43:17', 'dd-mm-yyyy hh24:mi:ss'), 179, 10, 70, 555, 2376368);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-12-2005 13:20:03', 'dd-mm-yyyy hh24:mi:ss'), 180, 9, 40, 972, 88239853);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('30-09-2011 06:34:24', 'dd-mm-yyyy hh24:mi:ss'), 181, 7, 5, 865, 29742651);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-04-2018 20:53:39', 'dd-mm-yyyy hh24:mi:ss'), 182, 8, 59, 658, 67015963);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-09-2000 08:08:35', 'dd-mm-yyyy hh24:mi:ss'), 183, 9, 81, 658, 32846918);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('02-02-2015 17:37:14', 'dd-mm-yyyy hh24:mi:ss'), 184, 8, 19, 45, 37921065);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-10-2016 18:59:36', 'dd-mm-yyyy hh24:mi:ss'), 185, 9, 18, 750, 41003550);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-06-2002 17:56:24', 'dd-mm-yyyy hh24:mi:ss'), 186, 8, 10, 409, 2505457);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-01-2006 04:06:23', 'dd-mm-yyyy hh24:mi:ss'), 187, 8, 36, 879, 1055314);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-10-2020 00:38:35', 'dd-mm-yyyy hh24:mi:ss'), 188, 10, 83, 65, 61751644);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-12-2011 12:26:38', 'dd-mm-yyyy hh24:mi:ss'), 189, 10, 30, 396, 29207505);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-04-2008 23:37:14', 'dd-mm-yyyy hh24:mi:ss'), 190, 5, 93, 564, 37865911);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('15-02-2005 18:02:00', 'dd-mm-yyyy hh24:mi:ss'), 191, 9, 60, 764, 43217671);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('06-12-2009 05:11:54', 'dd-mm-yyyy hh24:mi:ss'), 192, 5, 3, 865, 46639839);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('16-01-2013 16:11:51', 'dd-mm-yyyy hh24:mi:ss'), 193, 5, 14, 653, 43217671);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('17-02-2003 04:38:29', 'dd-mm-yyyy hh24:mi:ss'), 194, 6, 69, 806, 88649232);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('13-12-2001 04:20:21', 'dd-mm-yyyy hh24:mi:ss'), 195, 6, 54, 707, 51948030);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('08-04-2020 10:39:47', 'dd-mm-yyyy hh24:mi:ss'), 196, 6, 87, 389, 1282269);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-12-2005 20:56:49', 'dd-mm-yyyy hh24:mi:ss'), 197, 6, 46, 73, 11221464);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('03-07-2010 14:42:25', 'dd-mm-yyyy hh24:mi:ss'), 198, 10, 38, 257, 43436957);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-07-2013 09:19:09', 'dd-mm-yyyy hh24:mi:ss'), 199, 9, 45, 96, 91891117);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('01-12-2021 20:37:06', 'dd-mm-yyyy hh24:mi:ss'), 200, 5, 63, 726, 9077728);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('27-06-2004 03:52:24', 'dd-mm-yyyy hh24:mi:ss'), 201, 10, 70, 11, 2505457);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('31-07-2012 23:52:56', 'dd-mm-yyyy hh24:mi:ss'), 202, 7, 21, 294, 8796425);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-03-2008 19:57:21', 'dd-mm-yyyy hh24:mi:ss'), 203, 7, 25, 431, 730279);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('23-11-2019 05:07:17', 'dd-mm-yyyy hh24:mi:ss'), 204, 7, 46, 183, 97813459);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-07-2007 00:26:47', 'dd-mm-yyyy hh24:mi:ss'), 205, 9, 9, 257, 25039816);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('10-09-2018 15:39:36', 'dd-mm-yyyy hh24:mi:ss'), 206, 7, 18, 658, 37865911);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-10-2009 07:43:58', 'dd-mm-yyyy hh24:mi:ss'), 207, 9, 44, 815, 90824185);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-11-2007 03:12:05', 'dd-mm-yyyy hh24:mi:ss'), 208, 5, 100, 661, 24414730);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-04-2010 05:02:58', 'dd-mm-yyyy hh24:mi:ss'), 209, 9, 70, 939, 43436957);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('20-10-2020 12:18:08', 'dd-mm-yyyy hh24:mi:ss'), 210, 6, 41, 396, 6603015);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('18-11-2024 12:36:43', 'dd-mm-yyyy hh24:mi:ss'), 211, 6, 41, 500, 53483220);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('22-07-2008 01:14:09', 'dd-mm-yyyy hh24:mi:ss'), 212, 7, 47, 647, 64660127);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('11-05-2001 16:34:19', 'dd-mm-yyyy hh24:mi:ss'), 213, 5, 57, 517, 1055314);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-11-2011 07:08:32', 'dd-mm-yyyy hh24:mi:ss'), 214, 9, 39, 409, 91703316);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-01-2004 22:16:01', 'dd-mm-yyyy hh24:mi:ss'), 215, 5, 28, 661, 49908274);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-02-2017 00:48:31', 'dd-mm-yyyy hh24:mi:ss'), 216, 6, 28, 879, 33915414);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('04-07-2013 23:04:59', 'dd-mm-yyyy hh24:mi:ss'), 217, 9, 14, 183, 52154939);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('28-09-2024 04:25:14', 'dd-mm-yyyy hh24:mi:ss'), 218, 5, 57, 409, 50029824);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('25-05-2006 07:43:49', 'dd-mm-yyyy hh24:mi:ss'), 219, 5, 50, 188, 61751644);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('29-07-2021 23:40:59', 'dd-mm-yyyy hh24:mi:ss'), 220, 7, 83, 11, 20114821);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-11-2021 13:43:49', 'dd-mm-yyyy hh24:mi:ss'), 221, 6, 36, 252, 10854394);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('26-06-2004 13:18:11', 'dd-mm-yyyy hh24:mi:ss'), 222, 8, 98, 195, 13663159);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('14-12-2015 02:33:21', 'dd-mm-yyyy hh24:mi:ss'), 223, 5, 8, 658, 23041511);
insert into LESSON (lessondate, lessonid, rating, classid, roomnum, personid)
values (to_date('05-01-2003 23:32:03', 'dd-mm-yyyy hh24:mi:ss'), 224, 10, 18, 972, 13663159);
commit;
prompt 700 records loaded
prompt Loading PERSON_PHONE...
insert into PERSON_PHONE (phone, personid)
values ('057-8049172', 5654694);
insert into PERSON_PHONE (phone, personid)
values ('057-8138678', 96098746);
insert into PERSON_PHONE (phone, personid)
values ('057-8362122', 39658357);
insert into PERSON_PHONE (phone, personid)
values ('057-8501678', 34375443);
insert into PERSON_PHONE (phone, personid)
values ('057-8532181', 99887779);
insert into PERSON_PHONE (phone, personid)
values ('057-8630213', 94174046);
insert into PERSON_PHONE (phone, personid)
values ('057-8740120', 96940369);
insert into PERSON_PHONE (phone, personid)
values ('057-8756379', 88310865);
insert into PERSON_PHONE (phone, personid)
values ('057-8788798', 31024696);
insert into PERSON_PHONE (phone, personid)
values ('057-8842147', 59560586);
insert into PERSON_PHONE (phone, personid)
values ('057-9229100', 96098746);
insert into PERSON_PHONE (phone, personid)
values ('057-9495675', 92566199);
insert into PERSON_PHONE (phone, personid)
values ('057-9714953', 37780928);
insert into PERSON_PHONE (phone, personid)
values ('057-9737119', 8752121);
insert into PERSON_PHONE (phone, personid)
values ('057-9780523', 60940200);
insert into PERSON_PHONE (phone, personid)
values ('057-9788701', 14658929);
insert into PERSON_PHONE (phone, personid)
values ('057-9840427', 22819264);
insert into PERSON_PHONE (phone, personid)
values ('057-9867730', 8752121);
insert into PERSON_PHONE (phone, personid)
values ('057-9873654', 45080144);
insert into PERSON_PHONE (phone, personid)
values ('057-9875334', 79260141);
insert into PERSON_PHONE (phone, personid)
values ('057-9979758', 29742651);
insert into PERSON_PHONE (phone, personid)
values ('058-0143321', 63595783);
insert into PERSON_PHONE (phone, personid)
values ('058-0192523', 91891117);
insert into PERSON_PHONE (phone, personid)
values ('058-0274910', 88726887);
insert into PERSON_PHONE (phone, personid)
values ('058-0463093', 71375160);
insert into PERSON_PHONE (phone, personid)
values ('058-0569690', 81276702);
insert into PERSON_PHONE (phone, personid)
values ('058-0615558', 10395000);
insert into PERSON_PHONE (phone, personid)
values ('058-0768513', 60776603);
insert into PERSON_PHONE (phone, personid)
values ('058-0910803', 29658657);
insert into PERSON_PHONE (phone, personid)
values ('058-1019166', 60776603);
insert into PERSON_PHONE (phone, personid)
values ('058-1046655', 33300460);
insert into PERSON_PHONE (phone, personid)
values ('058-1468301', 44623593);
insert into PERSON_PHONE (phone, personid)
values ('058-1517155', 98257068);
insert into PERSON_PHONE (phone, personid)
values ('058-1905753', 79192786);
insert into PERSON_PHONE (phone, personid)
values ('058-1994956', 45505216);
insert into PERSON_PHONE (phone, personid)
values ('058-2058371', 30899206);
insert into PERSON_PHONE (phone, personid)
values ('058-2262324', 88649232);
insert into PERSON_PHONE (phone, personid)
values ('058-2312305', 94475922);
insert into PERSON_PHONE (phone, personid)
values ('058-2322335', 36833753);
insert into PERSON_PHONE (phone, personid)
values ('058-2465811', 36833753);
insert into PERSON_PHONE (phone, personid)
values ('058-2531747', 22432753);
insert into PERSON_PHONE (phone, personid)
values ('058-2665287', 96098746);
insert into PERSON_PHONE (phone, personid)
values ('058-2810574', 42274072);
insert into PERSON_PHONE (phone, personid)
values ('058-2937490', 13611451);
insert into PERSON_PHONE (phone, personid)
values ('058-2978208', 67481341);
insert into PERSON_PHONE (phone, personid)
values ('058-3389421', 42253574);
insert into PERSON_PHONE (phone, personid)
values ('058-3405918', 18340976);
insert into PERSON_PHONE (phone, personid)
values ('058-3546324', 34375443);
insert into PERSON_PHONE (phone, personid)
values ('058-3591757', 93282325);
insert into PERSON_PHONE (phone, personid)
values ('058-3736912', 46344277);
insert into PERSON_PHONE (phone, personid)
values ('058-3917738', 38125788);
insert into PERSON_PHONE (phone, personid)
values ('058-3990169', 67887328);
insert into PERSON_PHONE (phone, personid)
values ('058-4454736', 81276702);
insert into PERSON_PHONE (phone, personid)
values ('058-4662256', 69838192);
insert into PERSON_PHONE (phone, personid)
values ('058-4687653', 77623385);
insert into PERSON_PHONE (phone, personid)
values ('058-4762700', 67461875);
insert into PERSON_PHONE (phone, personid)
values ('058-4778909', 81865150);
insert into PERSON_PHONE (phone, personid)
values ('058-4892998', 4027718);
insert into PERSON_PHONE (phone, personid)
values ('058-5002801', 10395000);
insert into PERSON_PHONE (phone, personid)
values ('058-5053942', 46327250);
insert into PERSON_PHONE (phone, personid)
values ('058-5085850', 86272100);
insert into PERSON_PHONE (phone, personid)
values ('058-5105813', 45080144);
insert into PERSON_PHONE (phone, personid)
values ('058-5158481', 79192786);
insert into PERSON_PHONE (phone, personid)
values ('058-5221588', 50885464);
insert into PERSON_PHONE (phone, personid)
values ('058-5263742', 34375443);
insert into PERSON_PHONE (phone, personid)
values ('058-5318076', 40293735);
insert into PERSON_PHONE (phone, personid)
values ('058-5383118', 48536850);
insert into PERSON_PHONE (phone, personid)
values ('058-5483032', 730279);
insert into PERSON_PHONE (phone, personid)
values ('058-5564132', 64027261);
insert into PERSON_PHONE (phone, personid)
values ('058-5866780', 32846918);
insert into PERSON_PHONE (phone, personid)
values ('058-5901204', 33915414);
insert into PERSON_PHONE (phone, personid)
values ('058-6249805', 64027261);
insert into PERSON_PHONE (phone, personid)
values ('058-6685768', 9077728);
insert into PERSON_PHONE (phone, personid)
values ('058-6968208', 6717674);
insert into PERSON_PHONE (phone, personid)
values ('058-6986572', 25602009);
insert into PERSON_PHONE (phone, personid)
values ('058-7073390', 54985818);
insert into PERSON_PHONE (phone, personid)
values ('058-7075262', 72508489);
insert into PERSON_PHONE (phone, personid)
values ('058-7269410', 90289319);
insert into PERSON_PHONE (phone, personid)
values ('058-7916767', 88726887);
insert into PERSON_PHONE (phone, personid)
values ('058-7956868', 71375160);
insert into PERSON_PHONE (phone, personid)
values ('058-8216821', 79192786);
insert into PERSON_PHONE (phone, personid)
values ('058-8309752', 8106308);
insert into PERSON_PHONE (phone, personid)
values ('058-8529819', 21317536);
insert into PERSON_PHONE (phone, personid)
values ('058-8534597', 62214926);
insert into PERSON_PHONE (phone, personid)
values ('058-8864245', 59560586);
insert into PERSON_PHONE (phone, personid)
values ('058-8999625', 91891117);
insert into PERSON_PHONE (phone, personid)
values ('058-9044197', 35042992);
insert into PERSON_PHONE (phone, personid)
values ('058-9083716', 43436957);
insert into PERSON_PHONE (phone, personid)
values ('058-9096737', 1055314);
insert into PERSON_PHONE (phone, personid)
values ('058-9285944', 79815731);
insert into PERSON_PHONE (phone, personid)
values ('058-9292635', 19894147);
insert into PERSON_PHONE (phone, personid)
values ('058-9314770', 94174046);
insert into PERSON_PHONE (phone, personid)
values ('058-9501034', 63990543);
insert into PERSON_PHONE (phone, personid)
values ('058-9618259', 30062117);
insert into PERSON_PHONE (phone, personid)
values ('058-9663457', 30899206);
insert into PERSON_PHONE (phone, personid)
values ('058-9670933', 23114002);
insert into PERSON_PHONE (phone, personid)
values ('058-9943433', 4027718);
insert into PERSON_PHONE (phone, personid)
values ('058-9951539', 29291564);
insert into PERSON_PHONE (phone, personid)
values ('058-9998127', 64820168);
insert into PERSON_PHONE (phone, personid)
values ('059-0200596', 71375160);
commit;
prompt 100 records committed...
insert into PERSON_PHONE (phone, personid)
values ('059-0577011', 50968404);
insert into PERSON_PHONE (phone, personid)
values ('059-0622721', 21317536);
insert into PERSON_PHONE (phone, personid)
values ('059-0685993', 16134366);
insert into PERSON_PHONE (phone, personid)
values ('059-1145056', 79693276);
insert into PERSON_PHONE (phone, personid)
values ('059-1214736', 23020212);
insert into PERSON_PHONE (phone, personid)
values ('059-1465609', 71649431);
insert into PERSON_PHONE (phone, personid)
values ('059-1520937', 49537257);
insert into PERSON_PHONE (phone, personid)
values ('059-1521550', 27035808);
insert into PERSON_PHONE (phone, personid)
values ('059-1576916', 79260141);
insert into PERSON_PHONE (phone, personid)
values ('059-1804886', 11451089);
insert into PERSON_PHONE (phone, personid)
values ('059-2027519', 33449046);
insert into PERSON_PHONE (phone, personid)
values ('059-2108435', 1055314);
insert into PERSON_PHONE (phone, personid)
values ('059-2124858', 90824185);
insert into PERSON_PHONE (phone, personid)
values ('059-2475270', 79910635);
insert into PERSON_PHONE (phone, personid)
values ('059-2537213', 61698245);
insert into PERSON_PHONE (phone, personid)
values ('059-2681724', 79260141);
insert into PERSON_PHONE (phone, personid)
values ('059-2833678', 88649232);
insert into PERSON_PHONE (phone, personid)
values ('059-2878296', 50029824);
insert into PERSON_PHONE (phone, personid)
values ('059-2955510', 54033988);
insert into PERSON_PHONE (phone, personid)
values ('059-3267536', 7299036);
insert into PERSON_PHONE (phone, personid)
values ('059-3277283', 79693276);
insert into PERSON_PHONE (phone, personid)
values ('059-3777098', 71989689);
insert into PERSON_PHONE (phone, personid)
values ('059-3821998', 68928002);
insert into PERSON_PHONE (phone, personid)
values ('059-4011362', 32846918);
insert into PERSON_PHONE (phone, personid)
values ('059-4535951', 25039816);
insert into PERSON_PHONE (phone, personid)
values ('059-4857159', 91349986);
insert into PERSON_PHONE (phone, personid)
values ('059-5223325', 58227833);
insert into PERSON_PHONE (phone, personid)
values ('059-5241957', 74889890);
insert into PERSON_PHONE (phone, personid)
values ('059-5264724', 4370439);
insert into PERSON_PHONE (phone, personid)
values ('059-5345864', 94625728);
insert into PERSON_PHONE (phone, personid)
values ('059-5354639', 81654249);
insert into PERSON_PHONE (phone, personid)
values ('059-5413238', 86272012);
insert into PERSON_PHONE (phone, personid)
values ('059-5469465', 91349986);
insert into PERSON_PHONE (phone, personid)
values ('059-5651306', 89421322);
insert into PERSON_PHONE (phone, personid)
values ('059-5768761', 19067900);
insert into PERSON_PHONE (phone, personid)
values ('059-5969966', 8039183);
insert into PERSON_PHONE (phone, personid)
values ('059-6234732', 20103782);
insert into PERSON_PHONE (phone, personid)
values ('059-6362481', 11451089);
insert into PERSON_PHONE (phone, personid)
values ('059-6394981', 15992467);
insert into PERSON_PHONE (phone, personid)
values ('059-6582291', 45505216);
insert into PERSON_PHONE (phone, personid)
values ('059-6587423', 31471077);
insert into PERSON_PHONE (phone, personid)
values ('059-6880979', 1601841);
insert into PERSON_PHONE (phone, personid)
values ('059-7004051', 81865150);
insert into PERSON_PHONE (phone, personid)
values ('059-7091143', 8081255);
insert into PERSON_PHONE (phone, personid)
values ('059-7170362', 78118267);
insert into PERSON_PHONE (phone, personid)
values ('059-7206347', 22432753);
insert into PERSON_PHONE (phone, personid)
values ('059-7218040', 24504822);
insert into PERSON_PHONE (phone, personid)
values ('059-7260566', 57601580);
insert into PERSON_PHONE (phone, personid)
values ('059-7446523', 20114821);
insert into PERSON_PHONE (phone, personid)
values ('059-7546558', 12760864);
insert into PERSON_PHONE (phone, personid)
values ('059-7735916', 89122501);
insert into PERSON_PHONE (phone, personid)
values ('059-7956461', 89596058);
insert into PERSON_PHONE (phone, personid)
values ('059-8017956', 6484710);
insert into PERSON_PHONE (phone, personid)
values ('059-8190950', 37780928);
insert into PERSON_PHONE (phone, personid)
values ('059-8231227', 46327250);
insert into PERSON_PHONE (phone, personid)
values ('059-8327326', 33449046);
insert into PERSON_PHONE (phone, personid)
values ('059-8394257', 67461875);
insert into PERSON_PHONE (phone, personid)
values ('059-8434716', 39997409);
insert into PERSON_PHONE (phone, personid)
values ('059-8629765', 65545343);
insert into PERSON_PHONE (phone, personid)
values ('059-8834902', 25139076);
insert into PERSON_PHONE (phone, personid)
values ('059-8850681', 90824185);
insert into PERSON_PHONE (phone, personid)
values ('059-9194298', 39725987);
insert into PERSON_PHONE (phone, personid)
values ('059-9311786', 91891117);
insert into PERSON_PHONE (phone, personid)
values ('059-9361372', 11451089);
insert into PERSON_PHONE (phone, personid)
values ('059-9536564', 30062117);
insert into PERSON_PHONE (phone, personid)
values ('059-9571149', 91703316);
insert into PERSON_PHONE (phone, personid)
values ('059-9807108', 99887779);
insert into PERSON_PHONE (phone, personid)
values ('059-9908432', 31471077);
insert into PERSON_PHONE (phone, personid)
values ('050-0179427', 46327250);
insert into PERSON_PHONE (phone, personid)
values ('050-0239035', 10252506);
insert into PERSON_PHONE (phone, personid)
values ('050-0397261', 24414730);
insert into PERSON_PHONE (phone, personid)
values ('050-0907357', 30062117);
insert into PERSON_PHONE (phone, personid)
values ('050-1015587', 5654694);
insert into PERSON_PHONE (phone, personid)
values ('050-1381670', 13611451);
insert into PERSON_PHONE (phone, personid)
values ('050-1402161', 1934281);
insert into PERSON_PHONE (phone, personid)
values ('050-1447947', 50900940);
insert into PERSON_PHONE (phone, personid)
values ('050-1461768', 11451089);
insert into PERSON_PHONE (phone, personid)
values ('050-1923127', 33915414);
insert into PERSON_PHONE (phone, personid)
values ('050-2013881', 11451089);
insert into PERSON_PHONE (phone, personid)
values ('050-2117971', 20103782);
insert into PERSON_PHONE (phone, personid)
values ('050-2182314', 99988900);
insert into PERSON_PHONE (phone, personid)
values ('050-2245231', 43217671);
insert into PERSON_PHONE (phone, personid)
values ('050-2380375', 62449525);
insert into PERSON_PHONE (phone, personid)
values ('050-2509700', 36833753);
insert into PERSON_PHONE (phone, personid)
values ('050-2523418', 92881950);
insert into PERSON_PHONE (phone, personid)
values ('050-2644537', 88634045);
insert into PERSON_PHONE (phone, personid)
values ('050-2759329', 40091598);
insert into PERSON_PHONE (phone, personid)
values ('050-2911125', 29207505);
insert into PERSON_PHONE (phone, personid)
values ('050-3058471', 22682672);
insert into PERSON_PHONE (phone, personid)
values ('050-3566311', 68928002);
insert into PERSON_PHONE (phone, personid)
values ('050-3581878', 91060231);
insert into PERSON_PHONE (phone, personid)
values ('050-3635999', 44715352);
insert into PERSON_PHONE (phone, personid)
values ('050-3668540', 35042992);
insert into PERSON_PHONE (phone, personid)
values ('050-3852269', 91089992);
insert into PERSON_PHONE (phone, personid)
values ('050-3933676', 49084441);
insert into PERSON_PHONE (phone, personid)
values ('050-4006247', 10252506);
insert into PERSON_PHONE (phone, personid)
values ('050-4043097', 40293735);
insert into PERSON_PHONE (phone, personid)
values ('050-4079008', 58513377);
insert into PERSON_PHONE (phone, personid)
values ('050-4128373', 91349986);
insert into PERSON_PHONE (phone, personid)
values ('050-4237792', 91703316);
commit;
prompt 200 records committed...
insert into PERSON_PHONE (phone, personid)
values ('050-4361596', 38494989);
insert into PERSON_PHONE (phone, personid)
values ('050-4690818', 88649232);
insert into PERSON_PHONE (phone, personid)
values ('050-4763260', 30434462);
insert into PERSON_PHONE (phone, personid)
values ('050-4781844', 21293730);
insert into PERSON_PHONE (phone, personid)
values ('050-4849639', 37865911);
insert into PERSON_PHONE (phone, personid)
values ('050-4897103', 23020212);
insert into PERSON_PHONE (phone, personid)
values ('050-5091056', 71649431);
insert into PERSON_PHONE (phone, personid)
values ('050-5189004', 65011242);
insert into PERSON_PHONE (phone, personid)
values ('050-5283723', 91282035);
insert into PERSON_PHONE (phone, personid)
values ('050-5408974', 39725987);
insert into PERSON_PHONE (phone, personid)
values ('050-5516542', 35042992);
insert into PERSON_PHONE (phone, personid)
values ('050-5746153', 79192786);
insert into PERSON_PHONE (phone, personid)
values ('050-5827674', 94625728);
insert into PERSON_PHONE (phone, personid)
values ('050-5866001', 1282269);
insert into PERSON_PHONE (phone, personid)
values ('050-6123272', 32846918);
insert into PERSON_PHONE (phone, personid)
values ('050-6236629', 30411578);
insert into PERSON_PHONE (phone, personid)
values ('050-6258464', 46010066);
insert into PERSON_PHONE (phone, personid)
values ('050-6311700', 54968773);
insert into PERSON_PHONE (phone, personid)
values ('050-6491390', 14725165);
insert into PERSON_PHONE (phone, personid)
values ('050-6614483', 29658657);
insert into PERSON_PHONE (phone, personid)
values ('050-6651963', 98037672);
insert into PERSON_PHONE (phone, personid)
values ('050-6712744', 64027261);
insert into PERSON_PHONE (phone, personid)
values ('050-6927163', 22682672);
insert into PERSON_PHONE (phone, personid)
values ('050-6964579', 1934281);
insert into PERSON_PHONE (phone, personid)
values ('050-7461424', 98257068);
insert into PERSON_PHONE (phone, personid)
values ('050-7856680', 33300460);
insert into PERSON_PHONE (phone, personid)
values ('050-7950920', 26290962);
insert into PERSON_PHONE (phone, personid)
values ('050-8071742', 6628587);
insert into PERSON_PHONE (phone, personid)
values ('050-8175786', 41060366);
insert into PERSON_PHONE (phone, personid)
values ('050-8402141', 94475922);
insert into PERSON_PHONE (phone, personid)
values ('050-8659299', 33915414);
insert into PERSON_PHONE (phone, personid)
values ('050-8779425', 15600946);
insert into PERSON_PHONE (phone, personid)
values ('050-8929343', 42274072);
insert into PERSON_PHONE (phone, personid)
values ('050-9222350', 65011242);
insert into PERSON_PHONE (phone, personid)
values ('050-9231757', 40293735);
insert into PERSON_PHONE (phone, personid)
values ('050-9586599', 32846918);
insert into PERSON_PHONE (phone, personid)
values ('050-9593960', 13611451);
insert into PERSON_PHONE (phone, personid)
values ('050-9684049', 89596058);
insert into PERSON_PHONE (phone, personid)
values ('050-9749851', 33449046);
insert into PERSON_PHONE (phone, personid)
values ('050-9772478', 51948030);
insert into PERSON_PHONE (phone, personid)
values ('050-9790575', 29207505);
insert into PERSON_PHONE (phone, personid)
values ('050-9939436', 31471077);
insert into PERSON_PHONE (phone, personid)
values ('051-0010338', 91060231);
insert into PERSON_PHONE (phone, personid)
values ('051-0252989', 90824185);
insert into PERSON_PHONE (phone, personid)
values ('051-0392872', 39997409);
insert into PERSON_PHONE (phone, personid)
values ('051-0462498', 77623385);
insert into PERSON_PHONE (phone, personid)
values ('051-0516272', 18340976);
insert into PERSON_PHONE (phone, personid)
values ('051-0544972', 91089992);
insert into PERSON_PHONE (phone, personid)
values ('051-0745522', 19099801);
insert into PERSON_PHONE (phone, personid)
values ('051-0976195', 64660127);
insert into PERSON_PHONE (phone, personid)
values ('051-0993490', 38494989);
insert into PERSON_PHONE (phone, personid)
values ('051-1039529', 63990543);
insert into PERSON_PHONE (phone, personid)
values ('051-1385387', 98877580);
insert into PERSON_PHONE (phone, personid)
values ('051-1462137', 25124557);
insert into PERSON_PHONE (phone, personid)
values ('051-1544232', 18340976);
insert into PERSON_PHONE (phone, personid)
values ('051-1737943', 85383287);
insert into PERSON_PHONE (phone, personid)
values ('051-2239967', 44597009);
insert into PERSON_PHONE (phone, personid)
values ('051-2410246', 12760864);
insert into PERSON_PHONE (phone, personid)
values ('051-2675909', 65011242);
insert into PERSON_PHONE (phone, personid)
values ('051-2702565', 88649232);
insert into PERSON_PHONE (phone, personid)
values ('051-2772329', 85383287);
insert into PERSON_PHONE (phone, personid)
values ('051-3061824', 51948030);
insert into PERSON_PHONE (phone, personid)
values ('051-3110785', 28260775);
insert into PERSON_PHONE (phone, personid)
values ('051-3250150', 23386909);
insert into PERSON_PHONE (phone, personid)
values ('051-3330044', 11798215);
insert into PERSON_PHONE (phone, personid)
values ('051-3522536', 28937802);
insert into PERSON_PHONE (phone, personid)
values ('051-3597684', 8106308);
insert into PERSON_PHONE (phone, personid)
values ('051-3778291', 93282325);
insert into PERSON_PHONE (phone, personid)
values ('051-4399846', 1055314);
insert into PERSON_PHONE (phone, personid)
values ('051-4544004', 37780928);
insert into PERSON_PHONE (phone, personid)
values ('051-4672557', 91060231);
insert into PERSON_PHONE (phone, personid)
values ('051-4844059', 8106308);
insert into PERSON_PHONE (phone, personid)
values ('051-4919410', 92566199);
insert into PERSON_PHONE (phone, personid)
values ('051-5212051', 63595783);
insert into PERSON_PHONE (phone, personid)
values ('051-5529525', 96973892);
insert into PERSON_PHONE (phone, personid)
values ('051-5726432', 54968773);
insert into PERSON_PHONE (phone, personid)
values ('051-5940670', 40293735);
insert into PERSON_PHONE (phone, personid)
values ('051-5982507', 24290738);
insert into PERSON_PHONE (phone, personid)
values ('051-6353833', 24414730);
insert into PERSON_PHONE (phone, personid)
values ('051-6358697', 72508489);
insert into PERSON_PHONE (phone, personid)
values ('051-6434783', 53109927);
insert into PERSON_PHONE (phone, personid)
values ('051-6499355', 2591817);
insert into PERSON_PHONE (phone, personid)
values ('051-6550469', 6484710);
insert into PERSON_PHONE (phone, personid)
values ('051-6604407', 28937802);
insert into PERSON_PHONE (phone, personid)
values ('051-6800231', 58227833);
insert into PERSON_PHONE (phone, personid)
values ('051-6801951', 5654694);
insert into PERSON_PHONE (phone, personid)
values ('051-6848022', 42253574);
insert into PERSON_PHONE (phone, personid)
values ('051-7033419', 64027261);
insert into PERSON_PHONE (phone, personid)
values ('051-7251609', 6717674);
insert into PERSON_PHONE (phone, personid)
values ('051-7354031', 89122501);
insert into PERSON_PHONE (phone, personid)
values ('051-7367903', 37780928);
insert into PERSON_PHONE (phone, personid)
values ('051-7378043', 13663159);
insert into PERSON_PHONE (phone, personid)
values ('051-7396586', 25539146);
insert into PERSON_PHONE (phone, personid)
values ('051-7482990', 37865911);
insert into PERSON_PHONE (phone, personid)
values ('051-7490796', 47501817);
insert into PERSON_PHONE (phone, personid)
values ('051-7504468', 29207505);
insert into PERSON_PHONE (phone, personid)
values ('051-7529042', 44597009);
insert into PERSON_PHONE (phone, personid)
values ('051-7801345', 25112977);
insert into PERSON_PHONE (phone, personid)
values ('051-7845442', 26290962);
insert into PERSON_PHONE (phone, personid)
values ('051-7933889', 64820168);
commit;
prompt 300 records committed...
insert into PERSON_PHONE (phone, personid)
values ('051-8315168', 46344277);
insert into PERSON_PHONE (phone, personid)
values ('051-8476331', 44623593);
insert into PERSON_PHONE (phone, personid)
values ('051-8487942', 94475922);
insert into PERSON_PHONE (phone, personid)
values ('051-8580133', 30884206);
insert into PERSON_PHONE (phone, personid)
values ('051-8617448', 25539146);
insert into PERSON_PHONE (phone, personid)
values ('051-8998812', 22819264);
insert into PERSON_PHONE (phone, personid)
values ('051-9445745', 37921065);
insert into PERSON_PHONE (phone, personid)
values ('051-9473270', 25139076);
insert into PERSON_PHONE (phone, personid)
values ('051-9650083', 35042992);
insert into PERSON_PHONE (phone, personid)
values ('051-9817074', 8081255);
insert into PERSON_PHONE (phone, personid)
values ('051-9915036', 49084441);
insert into PERSON_PHONE (phone, personid)
values ('052-0360786', 91703316);
insert into PERSON_PHONE (phone, personid)
values ('052-0690294', 25139076);
insert into PERSON_PHONE (phone, personid)
values ('052-0733708', 51397792);
insert into PERSON_PHONE (phone, personid)
values ('052-0738331', 42274072);
insert into PERSON_PHONE (phone, personid)
values ('052-1087362', 61751644);
insert into PERSON_PHONE (phone, personid)
values ('052-1108346', 71805490);
insert into PERSON_PHONE (phone, personid)
values ('052-1291185', 94174046);
insert into PERSON_PHONE (phone, personid)
values ('052-1354338', 71805490);
insert into PERSON_PHONE (phone, personid)
values ('052-1383198', 54638372);
insert into PERSON_PHONE (phone, personid)
values ('052-1512609', 46327250);
insert into PERSON_PHONE (phone, personid)
values ('052-1857342', 60940200);
insert into PERSON_PHONE (phone, personid)
values ('052-1880764', 19067900);
insert into PERSON_PHONE (phone, personid)
values ('052-1949099', 7673525);
insert into PERSON_PHONE (phone, personid)
values ('052-2146235', 51948030);
insert into PERSON_PHONE (phone, personid)
values ('052-2150250', 67887328);
insert into PERSON_PHONE (phone, personid)
values ('052-2555336', 79260141);
insert into PERSON_PHONE (phone, personid)
values ('052-2634864', 32128888);
insert into PERSON_PHONE (phone, personid)
values ('052-2738921', 99988900);
insert into PERSON_PHONE (phone, personid)
values ('052-2841779', 33147678);
insert into PERSON_PHONE (phone, personid)
values ('052-3048406', 8039183);
insert into PERSON_PHONE (phone, personid)
values ('052-3209917', 99988900);
insert into PERSON_PHONE (phone, personid)
values ('052-3418629', 25112977);
insert into PERSON_PHONE (phone, personid)
values ('052-3437152', 96511274);
insert into PERSON_PHONE (phone, personid)
values ('052-3575338', 32846918);
insert into PERSON_PHONE (phone, personid)
values ('052-4091893', 30845995);
insert into PERSON_PHONE (phone, personid)
values ('052-4523010', 33147678);
insert into PERSON_PHONE (phone, personid)
values ('052-4680345', 51397792);
insert into PERSON_PHONE (phone, personid)
values ('052-4716432', 81276702);
insert into PERSON_PHONE (phone, personid)
values ('052-4718043', 29203895);
insert into PERSON_PHONE (phone, personid)
values ('052-4783872', 71375160);
insert into PERSON_PHONE (phone, personid)
values ('052-4787706', 14389870);
insert into PERSON_PHONE (phone, personid)
values ('052-4810315', 99375320);
insert into PERSON_PHONE (phone, personid)
values ('052-4996394', 99434739);
insert into PERSON_PHONE (phone, personid)
values ('052-5016211', 65011242);
insert into PERSON_PHONE (phone, personid)
values ('052-5513182', 46327250);
insert into PERSON_PHONE (phone, personid)
values ('052-5749711', 37780928);
insert into PERSON_PHONE (phone, personid)
values ('052-5884226', 24317288);
insert into PERSON_PHONE (phone, personid)
values ('052-5898094', 59517988);
insert into PERSON_PHONE (phone, personid)
values ('052-6308793', 65545343);
insert into PERSON_PHONE (phone, personid)
values ('052-6413785', 10854394);
insert into PERSON_PHONE (phone, personid)
values ('052-6438804', 59413980);
insert into PERSON_PHONE (phone, personid)
values ('052-6872914', 81654249);
insert into PERSON_PHONE (phone, personid)
values ('055-4055908', 60940200);
insert into PERSON_PHONE (phone, personid)
values ('055-4112495', 50968404);
insert into PERSON_PHONE (phone, personid)
values ('055-4127950', 96940369);
insert into PERSON_PHONE (phone, personid)
values ('055-4176917', 90372109);
insert into PERSON_PHONE (phone, personid)
values ('055-4384221', 90289319);
insert into PERSON_PHONE (phone, personid)
values ('055-4402578', 61698245);
insert into PERSON_PHONE (phone, personid)
values ('055-4661073', 30899206);
insert into PERSON_PHONE (phone, personid)
values ('055-4765596', 25039816);
insert into PERSON_PHONE (phone, personid)
values ('055-5051216', 34375443);
insert into PERSON_PHONE (phone, personid)
values ('055-5054116', 55125627);
insert into PERSON_PHONE (phone, personid)
values ('055-5071871', 53737541);
insert into PERSON_PHONE (phone, personid)
values ('055-5170500', 61751644);
insert into PERSON_PHONE (phone, personid)
values ('055-5567081', 22432753);
insert into PERSON_PHONE (phone, personid)
values ('055-5701039', 67481341);
insert into PERSON_PHONE (phone, personid)
values ('055-5765373', 33147678);
insert into PERSON_PHONE (phone, personid)
values ('055-6052873', 67481341);
insert into PERSON_PHONE (phone, personid)
values ('055-6124186', 61751644);
insert into PERSON_PHONE (phone, personid)
values ('055-6404003', 91703316);
insert into PERSON_PHONE (phone, personid)
values ('055-6454134', 39997409);
insert into PERSON_PHONE (phone, personid)
values ('055-6507041', 43049144);
insert into PERSON_PHONE (phone, personid)
values ('055-6604827', 68928002);
insert into PERSON_PHONE (phone, personid)
values ('055-6835086', 25139076);
insert into PERSON_PHONE (phone, personid)
values ('055-6874459', 30062117);
insert into PERSON_PHONE (phone, personid)
values ('055-6972273', 98877580);
insert into PERSON_PHONE (phone, personid)
values ('055-6975470', 89122501);
insert into PERSON_PHONE (phone, personid)
values ('055-7048449', 87008506);
insert into PERSON_PHONE (phone, personid)
values ('055-7068505', 65545343);
insert into PERSON_PHONE (phone, personid)
values ('055-7170744', 77425508);
insert into PERSON_PHONE (phone, personid)
values ('055-7424452', 39413869);
insert into PERSON_PHONE (phone, personid)
values ('055-7436029', 81276702);
insert into PERSON_PHONE (phone, personid)
values ('055-7516721', 33300460);
insert into PERSON_PHONE (phone, personid)
values ('055-7629477', 43436957);
insert into PERSON_PHONE (phone, personid)
values ('055-7836364', 86272100);
insert into PERSON_PHONE (phone, personid)
values ('055-7925834', 66781374);
insert into PERSON_PHONE (phone, personid)
values ('055-8093738', 32410121);
insert into PERSON_PHONE (phone, personid)
values ('055-8121053', 62214926);
insert into PERSON_PHONE (phone, personid)
values ('055-8296063', 21293730);
insert into PERSON_PHONE (phone, personid)
values ('055-8395781', 10252506);
insert into PERSON_PHONE (phone, personid)
values ('055-8501388', 37921065);
insert into PERSON_PHONE (phone, personid)
values ('055-8535110', 64660127);
insert into PERSON_PHONE (phone, personid)
values ('055-8723076', 74889890);
insert into PERSON_PHONE (phone, personid)
values ('055-8732252', 38125788);
insert into PERSON_PHONE (phone, personid)
values ('055-8899406', 81654249);
insert into PERSON_PHONE (phone, personid)
values ('055-9108222', 25602009);
insert into PERSON_PHONE (phone, personid)
values ('055-9346518', 88649232);
insert into PERSON_PHONE (phone, personid)
values ('055-9356875', 41518918);
insert into PERSON_PHONE (phone, personid)
values ('055-9468670', 38494989);
commit;
prompt 400 records committed...
insert into PERSON_PHONE (phone, personid)
values ('055-9488174', 33915414);
insert into PERSON_PHONE (phone, personid)
values ('055-9567211', 730279);
insert into PERSON_PHONE (phone, personid)
values ('055-9772977', 10951186);
insert into PERSON_PHONE (phone, personid)
values ('055-9811183', 81238413);
insert into PERSON_PHONE (phone, personid)
values ('056-0237224', 52313162);
insert into PERSON_PHONE (phone, personid)
values ('056-0277941', 75363400);
insert into PERSON_PHONE (phone, personid)
values ('056-0519531', 22682672);
insert into PERSON_PHONE (phone, personid)
values ('056-0554475', 10854394);
insert into PERSON_PHONE (phone, personid)
values ('056-0675043', 50029824);
insert into PERSON_PHONE (phone, personid)
values ('056-0935068', 30884206);
insert into PERSON_PHONE (phone, personid)
values ('056-1074301', 52154939);
insert into PERSON_PHONE (phone, personid)
values ('056-1282818', 32460971);
insert into PERSON_PHONE (phone, personid)
values ('056-1511775', 21293730);
insert into PERSON_PHONE (phone, personid)
values ('056-1666498', 33300460);
insert into PERSON_PHONE (phone, personid)
values ('056-1686541', 54033988);
insert into PERSON_PHONE (phone, personid)
values ('056-1707626', 74889890);
insert into PERSON_PHONE (phone, personid)
values ('056-1786808', 6217460);
insert into PERSON_PHONE (phone, personid)
values ('056-1875031', 13611451);
insert into PERSON_PHONE (phone, personid)
values ('056-1946490', 22432753);
insert into PERSON_PHONE (phone, personid)
values ('056-1958781', 7299036);
insert into PERSON_PHONE (phone, personid)
values ('056-2275526', 67461875);
insert into PERSON_PHONE (phone, personid)
values ('056-2596618', 25539146);
insert into PERSON_PHONE (phone, personid)
values ('056-2646638', 1282269);
insert into PERSON_PHONE (phone, personid)
values ('056-2710992', 47362950);
insert into PERSON_PHONE (phone, personid)
values ('056-2930891', 73434651);
insert into PERSON_PHONE (phone, personid)
values ('056-2932544', 38125788);
insert into PERSON_PHONE (phone, personid)
values ('056-3082015', 37865911);
insert into PERSON_PHONE (phone, personid)
values ('056-3161940', 40293735);
insert into PERSON_PHONE (phone, personid)
values ('056-3283397', 25139076);
insert into PERSON_PHONE (phone, personid)
values ('056-3561818', 23760253);
insert into PERSON_PHONE (phone, personid)
values ('056-3660364', 85383287);
insert into PERSON_PHONE (phone, personid)
values ('056-3686936', 14725165);
insert into PERSON_PHONE (phone, personid)
values ('056-3799205', 1055314);
insert into PERSON_PHONE (phone, personid)
values ('056-3965651', 58227833);
insert into PERSON_PHONE (phone, personid)
values ('056-4227494', 23890659);
insert into PERSON_PHONE (phone, personid)
values ('056-4383103', 41060366);
insert into PERSON_PHONE (phone, personid)
values ('056-4458581', 52313162);
insert into PERSON_PHONE (phone, personid)
values ('056-4575885', 71375160);
insert into PERSON_PHONE (phone, personid)
values ('056-4594951', 2376368);
insert into PERSON_PHONE (phone, personid)
values ('056-4868073', 66781374);
insert into PERSON_PHONE (phone, personid)
values ('056-4905370', 41518918);
insert into PERSON_PHONE (phone, personid)
values ('056-5144294', 61698245);
insert into PERSON_PHONE (phone, personid)
values ('056-5197543', 44715352);
insert into PERSON_PHONE (phone, personid)
values ('056-5425785', 67015963);
insert into PERSON_PHONE (phone, personid)
values ('056-5488881', 61698245);
insert into PERSON_PHONE (phone, personid)
values ('056-5925299', 99887779);
insert into PERSON_PHONE (phone, personid)
values ('056-6196667', 49908274);
insert into PERSON_PHONE (phone, personid)
values ('056-6582419', 21317536);
insert into PERSON_PHONE (phone, personid)
values ('056-6739438', 97813459);
insert into PERSON_PHONE (phone, personid)
values ('056-6855291', 53737541);
insert into PERSON_PHONE (phone, personid)
values ('056-7095731', 51397792);
insert into PERSON_PHONE (phone, personid)
values ('056-7236968', 99375320);
insert into PERSON_PHONE (phone, personid)
values ('056-7437366', 27611255);
insert into PERSON_PHONE (phone, personid)
values ('056-7452054', 54033988);
insert into PERSON_PHONE (phone, personid)
values ('056-7679558', 89596058);
insert into PERSON_PHONE (phone, personid)
values ('056-8124299', 6717674);
insert into PERSON_PHONE (phone, personid)
values ('056-8161435', 64820168);
insert into PERSON_PHONE (phone, personid)
values ('056-8343816', 55252246);
insert into PERSON_PHONE (phone, personid)
values ('056-8712990', 27035808);
insert into PERSON_PHONE (phone, personid)
values ('056-8835380', 44715352);
insert into PERSON_PHONE (phone, personid)
values ('056-8978571', 77623385);
insert into PERSON_PHONE (phone, personid)
values ('056-9087946', 54638372);
insert into PERSON_PHONE (phone, personid)
values ('056-9482499', 97813459);
insert into PERSON_PHONE (phone, personid)
values ('056-9745657', 46010066);
insert into PERSON_PHONE (phone, personid)
values ('056-9774679', 66242981);
insert into PERSON_PHONE (phone, personid)
values ('057-0027795', 27803037);
insert into PERSON_PHONE (phone, personid)
values ('057-0070227', 6717674);
insert into PERSON_PHONE (phone, personid)
values ('057-0153921', 66242981);
insert into PERSON_PHONE (phone, personid)
values ('057-0178142', 12760864);
insert into PERSON_PHONE (phone, personid)
values ('057-0780763', 5654694);
insert into PERSON_PHONE (phone, personid)
values ('057-0981909', 55252246);
insert into PERSON_PHONE (phone, personid)
values ('057-1138979', 72508489);
insert into PERSON_PHONE (phone, personid)
values ('057-1414345', 49084441);
insert into PERSON_PHONE (phone, personid)
values ('057-1471646', 6484710);
insert into PERSON_PHONE (phone, personid)
values ('057-1493706', 25139076);
insert into PERSON_PHONE (phone, personid)
values ('057-1549210', 10481000);
insert into PERSON_PHONE (phone, personid)
values ('057-1713247', 64027261);
insert into PERSON_PHONE (phone, personid)
values ('057-1791602', 41518918);
insert into PERSON_PHONE (phone, personid)
values ('057-1889422', 99588313);
insert into PERSON_PHONE (phone, personid)
values ('057-1964364', 53737541);
insert into PERSON_PHONE (phone, personid)
values ('057-2307127', 24317288);
insert into PERSON_PHONE (phone, personid)
values ('057-2417615', 8039183);
insert into PERSON_PHONE (phone, personid)
values ('057-2456362', 8081255);
insert into PERSON_PHONE (phone, personid)
values ('057-2527647', 89122501);
insert into PERSON_PHONE (phone, personid)
values ('057-2671278', 88239853);
insert into PERSON_PHONE (phone, personid)
values ('057-2691172', 81276702);
insert into PERSON_PHONE (phone, personid)
values ('057-2733783', 81005094);
insert into PERSON_PHONE (phone, personid)
values ('057-2797725', 93282325);
insert into PERSON_PHONE (phone, personid)
values ('057-2822583', 22432753);
insert into PERSON_PHONE (phone, personid)
values ('057-2889761', 54968773);
insert into PERSON_PHONE (phone, personid)
values ('057-3140532', 73434651);
insert into PERSON_PHONE (phone, personid)
values ('057-3959807', 43217671);
insert into PERSON_PHONE (phone, personid)
values ('057-4033099', 50029824);
insert into PERSON_PHONE (phone, personid)
values ('057-4119274', 49537257);
insert into PERSON_PHONE (phone, personid)
values ('057-4126488', 39725987);
insert into PERSON_PHONE (phone, personid)
values ('057-4205345', 88649232);
insert into PERSON_PHONE (phone, personid)
values ('057-4206088', 24414730);
insert into PERSON_PHONE (phone, personid)
values ('057-4455775', 13346174);
insert into PERSON_PHONE (phone, personid)
values ('057-4507336', 31750692);
insert into PERSON_PHONE (phone, personid)
values ('057-4539911', 63229033);
commit;
prompt 500 records committed...
insert into PERSON_PHONE (phone, personid)
values ('057-4575377', 7488761);
insert into PERSON_PHONE (phone, personid)
values ('057-4620996', 81654249);
insert into PERSON_PHONE (phone, personid)
values ('057-4859948', 25124557);
insert into PERSON_PHONE (phone, personid)
values ('057-5026133', 94475922);
insert into PERSON_PHONE (phone, personid)
values ('057-5586492', 67015963);
insert into PERSON_PHONE (phone, personid)
values ('057-5679316', 77623385);
insert into PERSON_PHONE (phone, personid)
values ('057-5679831', 2376368);
insert into PERSON_PHONE (phone, personid)
values ('057-5847415', 7673525);
insert into PERSON_PHONE (phone, personid)
values ('057-5942218', 2376368);
insert into PERSON_PHONE (phone, personid)
values ('057-6056944', 14130558);
insert into PERSON_PHONE (phone, personid)
values ('057-6362853', 98257068);
insert into PERSON_PHONE (phone, personid)
values ('057-6495504', 39413869);
insert into PERSON_PHONE (phone, personid)
values ('057-6815771', 25139076);
insert into PERSON_PHONE (phone, personid)
values ('057-6867718', 85383287);
insert into PERSON_PHONE (phone, personid)
values ('057-6993039', 44623593);
insert into PERSON_PHONE (phone, personid)
values ('057-7090277', 1055314);
insert into PERSON_PHONE (phone, personid)
values ('057-7120474', 56902043);
insert into PERSON_PHONE (phone, personid)
values ('057-7179387', 39658357);
insert into PERSON_PHONE (phone, personid)
values ('052-7138347', 58227833);
insert into PERSON_PHONE (phone, personid)
values ('052-7449094', 2505457);
insert into PERSON_PHONE (phone, personid)
values ('052-7577022', 91089992);
insert into PERSON_PHONE (phone, personid)
values ('052-7602493', 49908274);
insert into PERSON_PHONE (phone, personid)
values ('052-7609291', 98257068);
insert into PERSON_PHONE (phone, personid)
values ('052-7730835', 71805490);
insert into PERSON_PHONE (phone, personid)
values ('052-7770268', 98877580);
insert into PERSON_PHONE (phone, personid)
values ('052-8176620', 92566199);
insert into PERSON_PHONE (phone, personid)
values ('052-8212364', 42253574);
insert into PERSON_PHONE (phone, personid)
values ('052-8303037', 96973892);
insert into PERSON_PHONE (phone, personid)
values ('052-8584519', 89596058);
insert into PERSON_PHONE (phone, personid)
values ('052-8725752', 69755509);
insert into PERSON_PHONE (phone, personid)
values ('052-8810015', 92566199);
insert into PERSON_PHONE (phone, personid)
values ('052-8848956', 13663159);
insert into PERSON_PHONE (phone, personid)
values ('052-9347816', 42274072);
insert into PERSON_PHONE (phone, personid)
values ('052-9381917', 99434739);
insert into PERSON_PHONE (phone, personid)
values ('052-9412733', 99988900);
insert into PERSON_PHONE (phone, personid)
values ('052-9859690', 2591817);
insert into PERSON_PHONE (phone, personid)
values ('053-0000371', 35042992);
insert into PERSON_PHONE (phone, personid)
values ('053-0049868', 81325843);
insert into PERSON_PHONE (phone, personid)
values ('053-0177623', 29207505);
insert into PERSON_PHONE (phone, personid)
values ('053-0186361', 33915414);
insert into PERSON_PHONE (phone, personid)
values ('053-0263268', 24414730);
insert into PERSON_PHONE (phone, personid)
values ('053-0402836', 42253574);
insert into PERSON_PHONE (phone, personid)
values ('053-0416509', 23890659);
insert into PERSON_PHONE (phone, personid)
values ('053-0426876', 43217671);
insert into PERSON_PHONE (phone, personid)
values ('053-0431657', 22432753);
insert into PERSON_PHONE (phone, personid)
values ('053-0633264', 56902043);
insert into PERSON_PHONE (phone, personid)
values ('053-0646014', 33300460);
insert into PERSON_PHONE (phone, personid)
values ('053-0995239', 92758832);
insert into PERSON_PHONE (phone, personid)
values ('053-1258494', 98877580);
insert into PERSON_PHONE (phone, personid)
values ('053-1781617', 38494989);
insert into PERSON_PHONE (phone, personid)
values ('053-1803339', 33300460);
insert into PERSON_PHONE (phone, personid)
values ('053-1958635', 98877580);
insert into PERSON_PHONE (phone, personid)
values ('053-2111422', 40091598);
insert into PERSON_PHONE (phone, personid)
values ('053-2508264', 65545343);
insert into PERSON_PHONE (phone, personid)
values ('053-2866721', 21317536);
insert into PERSON_PHONE (phone, personid)
values ('053-2995775', 57601580);
insert into PERSON_PHONE (phone, personid)
values ('053-3024441', 22819264);
insert into PERSON_PHONE (phone, personid)
values ('053-3044367', 1055314);
insert into PERSON_PHONE (phone, personid)
values ('053-3167787', 99375320);
insert into PERSON_PHONE (phone, personid)
values ('053-3175390', 56902043);
insert into PERSON_PHONE (phone, personid)
values ('053-3246628', 25112977);
insert into PERSON_PHONE (phone, personid)
values ('053-3247676', 38614060);
insert into PERSON_PHONE (phone, personid)
values ('053-3318028', 90372109);
insert into PERSON_PHONE (phone, personid)
values ('053-3414145', 44715352);
insert into PERSON_PHONE (phone, personid)
values ('053-3459410', 22819264);
insert into PERSON_PHONE (phone, personid)
values ('053-3613615', 8752121);
insert into PERSON_PHONE (phone, personid)
values ('053-4179842', 50029824);
insert into PERSON_PHONE (phone, personid)
values ('053-4516720', 67015963);
insert into PERSON_PHONE (phone, personid)
values ('053-4563176', 96973892);
insert into PERSON_PHONE (phone, personid)
values ('053-4674763', 19099801);
insert into PERSON_PHONE (phone, personid)
values ('053-4701794', 23890659);
insert into PERSON_PHONE (phone, personid)
values ('053-4820724', 7299036);
insert into PERSON_PHONE (phone, personid)
values ('053-5138327', 89421322);
insert into PERSON_PHONE (phone, personid)
values ('053-5463258', 2938480);
insert into PERSON_PHONE (phone, personid)
values ('053-5587080', 81654249);
insert into PERSON_PHONE (phone, personid)
values ('053-5593740', 5654694);
insert into PERSON_PHONE (phone, personid)
values ('053-5646892', 54033988);
insert into PERSON_PHONE (phone, personid)
values ('053-5651198', 75363400);
insert into PERSON_PHONE (phone, personid)
values ('053-5699245', 61751644);
insert into PERSON_PHONE (phone, personid)
values ('053-5975192', 40293735);
insert into PERSON_PHONE (phone, personid)
values ('053-6105979', 79815731);
insert into PERSON_PHONE (phone, personid)
values ('053-6111117', 41518918);
insert into PERSON_PHONE (phone, personid)
values ('053-6164481', 31661429);
insert into PERSON_PHONE (phone, personid)
values ('053-6311362', 33915414);
insert into PERSON_PHONE (phone, personid)
values ('053-6397589', 23020212);
insert into PERSON_PHONE (phone, personid)
values ('053-6411088', 25602009);
insert into PERSON_PHONE (phone, personid)
values ('053-7020052', 57601580);
insert into PERSON_PHONE (phone, personid)
values ('053-7422148', 59517988);
insert into PERSON_PHONE (phone, personid)
values ('053-7679534', 88634045);
insert into PERSON_PHONE (phone, personid)
values ('053-7696628', 67481341);
insert into PERSON_PHONE (phone, personid)
values ('053-7802719', 29291564);
insert into PERSON_PHONE (phone, personid)
values ('053-7984780', 8752121);
insert into PERSON_PHONE (phone, personid)
values ('053-8333482', 55743766);
insert into PERSON_PHONE (phone, personid)
values ('053-8512264', 44824683);
insert into PERSON_PHONE (phone, personid)
values ('053-8570857', 33449046);
insert into PERSON_PHONE (phone, personid)
values ('053-8778184', 66781374);
insert into PERSON_PHONE (phone, personid)
values ('053-8793644', 69270812);
insert into PERSON_PHONE (phone, personid)
values ('053-8849677', 81325843);
insert into PERSON_PHONE (phone, personid)
values ('053-8867509', 33915414);
insert into PERSON_PHONE (phone, personid)
values ('053-8888700', 42274072);
commit;
prompt 600 records committed...
insert into PERSON_PHONE (phone, personid)
values ('053-9338168', 51948030);
insert into PERSON_PHONE (phone, personid)
values ('053-9827744', 96098746);
insert into PERSON_PHONE (phone, personid)
values ('053-9944655', 14658929);
insert into PERSON_PHONE (phone, personid)
values ('054-0423888', 22820514);
insert into PERSON_PHONE (phone, personid)
values ('054-0528950', 67887328);
insert into PERSON_PHONE (phone, personid)
values ('054-0601202', 47501817);
insert into PERSON_PHONE (phone, personid)
values ('054-0692272', 7299036);
insert into PERSON_PHONE (phone, personid)
values ('054-0842916', 30899206);
insert into PERSON_PHONE (phone, personid)
values ('054-0964403', 29291564);
insert into PERSON_PHONE (phone, personid)
values ('054-1122209', 98037672);
insert into PERSON_PHONE (phone, personid)
values ('054-1368665', 29203895);
insert into PERSON_PHONE (phone, personid)
values ('054-1475654', 46639839);
insert into PERSON_PHONE (phone, personid)
values ('054-1492154', 10395000);
insert into PERSON_PHONE (phone, personid)
values ('054-1680108', 53737541);
insert into PERSON_PHONE (phone, personid)
values ('054-1758828', 57601580);
insert into PERSON_PHONE (phone, personid)
values ('054-1850265', 10951186);
insert into PERSON_PHONE (phone, personid)
values ('054-2281637', 13356721);
insert into PERSON_PHONE (phone, personid)
values ('054-2422294', 25112977);
insert into PERSON_PHONE (phone, personid)
values ('054-2469317', 79910635);
insert into PERSON_PHONE (phone, personid)
values ('054-2475997', 30884206);
insert into PERSON_PHONE (phone, personid)
values ('054-2479258', 54638372);
insert into PERSON_PHONE (phone, personid)
values ('054-2494175', 29207505);
insert into PERSON_PHONE (phone, personid)
values ('054-2529175', 64660127);
insert into PERSON_PHONE (phone, personid)
values ('054-2642592', 41518918);
insert into PERSON_PHONE (phone, personid)
values ('054-2686383', 36833753);
insert into PERSON_PHONE (phone, personid)
values ('054-2697643', 48277353);
insert into PERSON_PHONE (phone, personid)
values ('054-2937458', 72508489);
insert into PERSON_PHONE (phone, personid)
values ('054-3145279', 10951186);
insert into PERSON_PHONE (phone, personid)
values ('054-3202345', 96098746);
insert into PERSON_PHONE (phone, personid)
values ('054-3742383', 41060366);
insert into PERSON_PHONE (phone, personid)
values ('054-3860341', 89122501);
insert into PERSON_PHONE (phone, personid)
values ('054-3868734', 1601841);
insert into PERSON_PHONE (phone, personid)
values ('054-3964907', 28089404);
insert into PERSON_PHONE (phone, personid)
values ('054-3976658', 71989689);
insert into PERSON_PHONE (phone, personid)
values ('054-3996964', 50900940);
insert into PERSON_PHONE (phone, personid)
values ('054-4343981', 91349986);
insert into PERSON_PHONE (phone, personid)
values ('054-4539270', 92758832);
insert into PERSON_PHONE (phone, personid)
values ('054-4941269', 35042992);
insert into PERSON_PHONE (phone, personid)
values ('054-5026583', 70178481);
insert into PERSON_PHONE (phone, personid)
values ('054-5148760', 2591817);
insert into PERSON_PHONE (phone, personid)
values ('054-5268581', 23760253);
insert into PERSON_PHONE (phone, personid)
values ('054-5338489', 33147678);
insert into PERSON_PHONE (phone, personid)
values ('054-5548964', 88310865);
insert into PERSON_PHONE (phone, personid)
values ('054-5761157', 7164065);
insert into PERSON_PHONE (phone, personid)
values ('054-6098317', 57601580);
insert into PERSON_PHONE (phone, personid)
values ('054-6395883', 54757032);
insert into PERSON_PHONE (phone, personid)
values ('054-6395916', 58513377);
insert into PERSON_PHONE (phone, personid)
values ('054-6752466', 81190517);
insert into PERSON_PHONE (phone, personid)
values ('054-6970960', 2376368);
insert into PERSON_PHONE (phone, personid)
values ('054-6977119', 94625728);
insert into PERSON_PHONE (phone, personid)
values ('054-6994111', 77623385);
insert into PERSON_PHONE (phone, personid)
values ('054-7134785', 730279);
insert into PERSON_PHONE (phone, personid)
values ('054-7198096', 70595940);
insert into PERSON_PHONE (phone, personid)
values ('054-7216735', 31024696);
insert into PERSON_PHONE (phone, personid)
values ('054-7265024', 62214926);
insert into PERSON_PHONE (phone, personid)
values ('054-7503920', 86453357);
insert into PERSON_PHONE (phone, personid)
values ('054-7551552', 60940200);
insert into PERSON_PHONE (phone, personid)
values ('054-7996722', 79192786);
insert into PERSON_PHONE (phone, personid)
values ('054-8016472', 15992467);
insert into PERSON_PHONE (phone, personid)
values ('054-8025507', 32846918);
insert into PERSON_PHONE (phone, personid)
values ('054-8133344', 64027261);
insert into PERSON_PHONE (phone, personid)
values ('054-8214897', 55743766);
insert into PERSON_PHONE (phone, personid)
values ('054-8678528', 57601580);
insert into PERSON_PHONE (phone, personid)
values ('054-8728676', 31024696);
insert into PERSON_PHONE (phone, personid)
values ('054-8784430', 24290738);
insert into PERSON_PHONE (phone, personid)
values ('054-8809211', 87891090);
insert into PERSON_PHONE (phone, personid)
values ('054-8984844', 77623385);
insert into PERSON_PHONE (phone, personid)
values ('054-9516529', 88634045);
insert into PERSON_PHONE (phone, personid)
values ('054-9670310', 33300460);
insert into PERSON_PHONE (phone, personid)
values ('054-9685433', 59413980);
insert into PERSON_PHONE (phone, personid)
values ('054-9886074', 81005094);
insert into PERSON_PHONE (phone, personid)
values ('055-0107629', 7299036);
insert into PERSON_PHONE (phone, personid)
values ('055-0190651', 64660127);
insert into PERSON_PHONE (phone, personid)
values ('055-0227342', 63229033);
insert into PERSON_PHONE (phone, personid)
values ('055-0343965', 8796425);
insert into PERSON_PHONE (phone, personid)
values ('055-0718785', 30434462);
insert into PERSON_PHONE (phone, personid)
values ('055-0724042', 83376974);
insert into PERSON_PHONE (phone, personid)
values ('055-0765969', 88239853);
insert into PERSON_PHONE (phone, personid)
values ('055-0869059', 10252506);
insert into PERSON_PHONE (phone, personid)
values ('055-0911706', 23020212);
insert into PERSON_PHONE (phone, personid)
values ('055-0929900', 38614060);
insert into PERSON_PHONE (phone, personid)
values ('055-0961990', 39997409);
insert into PERSON_PHONE (phone, personid)
values ('055-1066091', 10252506);
insert into PERSON_PHONE (phone, personid)
values ('055-1147636', 8752121);
insert into PERSON_PHONE (phone, personid)
values ('055-1412670', 29203895);
insert into PERSON_PHONE (phone, personid)
values ('055-1491785', 60940200);
insert into PERSON_PHONE (phone, personid)
values ('055-1554283', 45505216);
insert into PERSON_PHONE (phone, personid)
values ('055-1674880', 6161238);
insert into PERSON_PHONE (phone, personid)
values ('055-1750000', 12760864);
insert into PERSON_PHONE (phone, personid)
values ('055-1761989', 53483220);
insert into PERSON_PHONE (phone, personid)
values ('055-1828311', 84018267);
insert into PERSON_PHONE (phone, personid)
values ('055-1982214', 30463411);
insert into PERSON_PHONE (phone, personid)
values ('055-2015130', 96098746);
insert into PERSON_PHONE (phone, personid)
values ('055-2144409', 79693276);
insert into PERSON_PHONE (phone, personid)
values ('055-2187856', 6717674);
insert into PERSON_PHONE (phone, personid)
values ('055-2332225', 47362950);
insert into PERSON_PHONE (phone, personid)
values ('055-2348188', 96973892);
insert into PERSON_PHONE (phone, personid)
values ('055-2525744', 91089992);
insert into PERSON_PHONE (phone, personid)
values ('055-2627317', 2591817);
insert into PERSON_PHONE (phone, personid)
values ('055-2890148', 48084398);
commit;
prompt 700 records committed...
insert into PERSON_PHONE (phone, personid)
values ('055-2898921', 18340976);
insert into PERSON_PHONE (phone, personid)
values ('055-3306378', 99988900);
insert into PERSON_PHONE (phone, personid)
values ('055-3340067', 10252506);
commit;
prompt 703 records loaded
prompt Loading TAKES_LESSON...
insert into TAKES_LESSON (lessonid, classid, personid)
values (646, 71, 34899411);
insert into TAKES_LESSON (lessonid, classid, personid)
values (672, 76, 17922070);
insert into TAKES_LESSON (lessonid, classid, personid)
values (107, 27, 30174663);
insert into TAKES_LESSON (lessonid, classid, personid)
values (43, 68, 70178481);
insert into TAKES_LESSON (lessonid, classid, personid)
values (9, 55, 66242981);
insert into TAKES_LESSON (lessonid, classid, personid)
values (220, 83, 23041511);
insert into TAKES_LESSON (lessonid, classid, personid)
values (61, 25, 99588313);
insert into TAKES_LESSON (lessonid, classid, personid)
values (38, 99, 22010069);
insert into TAKES_LESSON (lessonid, classid, personid)
values (197, 46, 35448349);
insert into TAKES_LESSON (lessonid, classid, personid)
values (146, 15, 58227833);
insert into TAKES_LESSON (lessonid, classid, personid)
values (409, 67, 60383864);
insert into TAKES_LESSON (lessonid, classid, personid)
values (486, 36, 95620746);
insert into TAKES_LESSON (lessonid, classid, personid)
values (644, 33, 57848591);
insert into TAKES_LESSON (lessonid, classid, personid)
values (152, 36, 79693276);
insert into TAKES_LESSON (lessonid, classid, personid)
values (95, 42, 44938507);
insert into TAKES_LESSON (lessonid, classid, personid)
values (296, 89, 29203895);
insert into TAKES_LESSON (lessonid, classid, personid)
values (498, 46, 23020212);
insert into TAKES_LESSON (lessonid, classid, personid)
values (457, 61, 11451089);
insert into TAKES_LESSON (lessonid, classid, personid)
values (456, 78, 49478035);
insert into TAKES_LESSON (lessonid, classid, personid)
values (352, 32, 99988900);
insert into TAKES_LESSON (lessonid, classid, personid)
values (367, 97, 36378696);
insert into TAKES_LESSON (lessonid, classid, personid)
values (522, 84, 58302395);
insert into TAKES_LESSON (lessonid, classid, personid)
values (530, 47, 20114821);
insert into TAKES_LESSON (lessonid, classid, personid)
values (495, 41, 34375443);
insert into TAKES_LESSON (lessonid, classid, personid)
values (243, 71, 90372109);
insert into TAKES_LESSON (lessonid, classid, personid)
values (199, 45, 29995549);
insert into TAKES_LESSON (lessonid, classid, personid)
values (461, 92, 25039816);
insert into TAKES_LESSON (lessonid, classid, personid)
values (596, 18, 10775180);
insert into TAKES_LESSON (lessonid, classid, personid)
values (437, 58, 53483220);
insert into TAKES_LESSON (lessonid, classid, personid)
values (150, 11, 99203358);
insert into TAKES_LESSON (lessonid, classid, personid)
values (428, 54, 65058862);
insert into TAKES_LESSON (lessonid, classid, personid)
values (232, 52, 55252246);
insert into TAKES_LESSON (lessonid, classid, personid)
values (385, 11, 96098746);
insert into TAKES_LESSON (lessonid, classid, personid)
values (343, 90, 53815807);
insert into TAKES_LESSON (lessonid, classid, personid)
values (590, 51, 91891117);
insert into TAKES_LESSON (lessonid, classid, personid)
values (419, 20, 48277353);
insert into TAKES_LESSON (lessonid, classid, personid)
values (180, 40, 87218298);
insert into TAKES_LESSON (lessonid, classid, personid)
values (191, 60, 50968404);
insert into TAKES_LESSON (lessonid, classid, personid)
values (260, 8, 15164192);
insert into TAKES_LESSON (lessonid, classid, personid)
values (600, 92, 10481000);
insert into TAKES_LESSON (lessonid, classid, personid)
values (266, 12, 11534770);
insert into TAKES_LESSON (lessonid, classid, personid)
values (497, 96, 19894147);
insert into TAKES_LESSON (lessonid, classid, personid)
values (683, 47, 99434739);
insert into TAKES_LESSON (lessonid, classid, personid)
values (699, 98, 41060366);
insert into TAKES_LESSON (lessonid, classid, personid)
values (694, 90, 29742651);
insert into TAKES_LESSON (lessonid, classid, personid)
values (651, 52, 90717124);
insert into TAKES_LESSON (lessonid, classid, personid)
values (10, 50, 1055314);
insert into TAKES_LESSON (lessonid, classid, personid)
values (14, 68, 84018267);
insert into TAKES_LESSON (lessonid, classid, personid)
values (693, 85, 35114555);
insert into TAKES_LESSON (lessonid, classid, personid)
values (55, 100, 17739277);
insert into TAKES_LESSON (lessonid, classid, personid)
values (646, 71, 87218298);
insert into TAKES_LESSON (lessonid, classid, personid)
values (13, 81, 50968404);
insert into TAKES_LESSON (lessonid, classid, personid)
values (624, 42, 91282035);
insert into TAKES_LESSON (lessonid, classid, personid)
values (675, 40, 73038198);
insert into TAKES_LESSON (lessonid, classid, personid)
values (449, 22, 33300460);
insert into TAKES_LESSON (lessonid, classid, personid)
values (141, 25, 53109927);
insert into TAKES_LESSON (lessonid, classid, personid)
values (231, 95, 96511274);
insert into TAKES_LESSON (lessonid, classid, personid)
values (483, 57, 33915414);
insert into TAKES_LESSON (lessonid, classid, personid)
values (259, 43, 86453357);
insert into TAKES_LESSON (lessonid, classid, personid)
values (117, 89, 67461875);
insert into TAKES_LESSON (lessonid, classid, personid)
values (501, 21, 8796425);
insert into TAKES_LESSON (lessonid, classid, personid)
values (570, 68, 26290962);
insert into TAKES_LESSON (lessonid, classid, personid)
values (576, 29, 25128415);
insert into TAKES_LESSON (lessonid, classid, personid)
values (691, 27, 86755439);
insert into TAKES_LESSON (lessonid, classid, personid)
values (63, 94, 68928002);
insert into TAKES_LESSON (lessonid, classid, personid)
values (600, 92, 50885464);
insert into TAKES_LESSON (lessonid, classid, personid)
values (376, 74, 24290738);
insert into TAKES_LESSON (lessonid, classid, personid)
values (658, 2, 37780928);
insert into TAKES_LESSON (lessonid, classid, personid)
values (67, 14, 81005094);
insert into TAKES_LESSON (lessonid, classid, personid)
values (440, 82, 58302395);
insert into TAKES_LESSON (lessonid, classid, personid)
values (178, 62, 83376974);
insert into TAKES_LESSON (lessonid, classid, personid)
values (167, 31, 2303105);
insert into TAKES_LESSON (lessonid, classid, personid)
values (354, 61, 88634045);
insert into TAKES_LESSON (lessonid, classid, personid)
values (294, 59, 1402178);
insert into TAKES_LESSON (lessonid, classid, personid)
values (601, 99, 64820168);
insert into TAKES_LESSON (lessonid, classid, personid)
values (523, 35, 79260141);
insert into TAKES_LESSON (lessonid, classid, personid)
values (528, 33, 64820168);
insert into TAKES_LESSON (lessonid, classid, personid)
values (570, 68, 67503959);
insert into TAKES_LESSON (lessonid, classid, personid)
values (9, 55, 79910635);
insert into TAKES_LESSON (lessonid, classid, personid)
values (524, 20, 96970243);
insert into TAKES_LESSON (lessonid, classid, personid)
values (444, 32, 30434462);
insert into TAKES_LESSON (lessonid, classid, personid)
values (339, 83, 8752121);
insert into TAKES_LESSON (lessonid, classid, personid)
values (682, 81, 42253574);
insert into TAKES_LESSON (lessonid, classid, personid)
values (405, 40, 16134366);
insert into TAKES_LESSON (lessonid, classid, personid)
values (377, 15, 6717674);
insert into TAKES_LESSON (lessonid, classid, personid)
values (655, 83, 31471077);
insert into TAKES_LESSON (lessonid, classid, personid)
values (95, 42, 81677750);
insert into TAKES_LESSON (lessonid, classid, personid)
values (514, 93, 82804437);
insert into TAKES_LESSON (lessonid, classid, personid)
values (482, 45, 7488761);
insert into TAKES_LESSON (lessonid, classid, personid)
values (457, 61, 48084398);
insert into TAKES_LESSON (lessonid, classid, personid)
values (486, 36, 98877580);
insert into TAKES_LESSON (lessonid, classid, personid)
values (73, 30, 72046835);
insert into TAKES_LESSON (lessonid, classid, personid)
values (513, 54, 85383287);
insert into TAKES_LESSON (lessonid, classid, personid)
values (323, 62, 5654694);
insert into TAKES_LESSON (lessonid, classid, personid)
values (141, 25, 65058862);
insert into TAKES_LESSON (lessonid, classid, personid)
values (258, 8, 24504822);
insert into TAKES_LESSON (lessonid, classid, personid)
values (500, 26, 38614060);
insert into TAKES_LESSON (lessonid, classid, personid)
values (609, 6, 31874543);
insert into TAKES_LESSON (lessonid, classid, personid)
values (594, 64, 6505329);
insert into TAKES_LESSON (lessonid, classid, personid)
values (678, 12, 67503959);
commit;
prompt 100 records committed...
insert into TAKES_LESSON (lessonid, classid, personid)
values (689, 25, 61586151);
insert into TAKES_LESSON (lessonid, classid, personid)
values (671, 20, 30241470);
insert into TAKES_LESSON (lessonid, classid, personid)
values (145, 73, 3691273);
insert into TAKES_LESSON (lessonid, classid, personid)
values (202, 21, 21293730);
insert into TAKES_LESSON (lessonid, classid, personid)
values (467, 14, 54638372);
insert into TAKES_LESSON (lessonid, classid, personid)
values (180, 40, 10481000);
insert into TAKES_LESSON (lessonid, classid, personid)
values (561, 63, 99887779);
insert into TAKES_LESSON (lessonid, classid, personid)
values (608, 37, 31874543);
insert into TAKES_LESSON (lessonid, classid, personid)
values (590, 51, 75966451);
insert into TAKES_LESSON (lessonid, classid, personid)
values (176, 78, 22920110);
insert into TAKES_LESSON (lessonid, classid, personid)
values (663, 50, 65011242);
insert into TAKES_LESSON (lessonid, classid, personid)
values (619, 59, 75033915);
insert into TAKES_LESSON (lessonid, classid, personid)
values (454, 38, 27425173);
insert into TAKES_LESSON (lessonid, classid, personid)
values (457, 61, 61751644);
insert into TAKES_LESSON (lessonid, classid, personid)
values (114, 58, 64070950);
insert into TAKES_LESSON (lessonid, classid, personid)
values (609, 6, 10517860);
insert into TAKES_LESSON (lessonid, classid, personid)
values (532, 72, 27449638);
insert into TAKES_LESSON (lessonid, classid, personid)
values (588, 7, 8421656);
insert into TAKES_LESSON (lessonid, classid, personid)
values (71, 92, 32313288);
insert into TAKES_LESSON (lessonid, classid, personid)
values (384, 23, 64975686);
insert into TAKES_LESSON (lessonid, classid, personid)
values (86, 98, 51193500);
insert into TAKES_LESSON (lessonid, classid, personid)
values (333, 4, 47501817);
insert into TAKES_LESSON (lessonid, classid, personid)
values (538, 5, 66340561);
insert into TAKES_LESSON (lessonid, classid, personid)
values (291, 9, 46344277);
insert into TAKES_LESSON (lessonid, classid, personid)
values (550, 13, 33915414);
insert into TAKES_LESSON (lessonid, classid, personid)
values (370, 36, 12760864);
insert into TAKES_LESSON (lessonid, classid, personid)
values (505, 45, 59560586);
insert into TAKES_LESSON (lessonid, classid, personid)
values (545, 8, 8796425);
insert into TAKES_LESSON (lessonid, classid, personid)
values (100, 43, 11798215);
insert into TAKES_LESSON (lessonid, classid, personid)
values (531, 52, 2376368);
insert into TAKES_LESSON (lessonid, classid, personid)
values (492, 84, 41518918);
insert into TAKES_LESSON (lessonid, classid, personid)
values (398, 81, 60078010);
insert into TAKES_LESSON (lessonid, classid, personid)
values (189, 30, 91703316);
insert into TAKES_LESSON (lessonid, classid, personid)
values (41, 55, 91349986);
insert into TAKES_LESSON (lessonid, classid, personid)
values (590, 51, 76641085);
insert into TAKES_LESSON (lessonid, classid, personid)
values (129, 23, 63595783);
insert into TAKES_LESSON (lessonid, classid, personid)
values (336, 51, 72046835);
insert into TAKES_LESSON (lessonid, classid, personid)
values (696, 2, 45080144);
insert into TAKES_LESSON (lessonid, classid, personid)
values (118, 4, 10775180);
insert into TAKES_LESSON (lessonid, classid, personid)
values (578, 14, 20114821);
insert into TAKES_LESSON (lessonid, classid, personid)
values (225, 37, 4027718);
insert into TAKES_LESSON (lessonid, classid, personid)
values (396, 35, 81238413);
insert into TAKES_LESSON (lessonid, classid, personid)
values (637, 71, 53663079);
insert into TAKES_LESSON (lessonid, classid, personid)
values (510, 37, 89421322);
insert into TAKES_LESSON (lessonid, classid, personid)
values (27, 13, 46327250);
insert into TAKES_LESSON (lessonid, classid, personid)
values (355, 31, 27449638);
insert into TAKES_LESSON (lessonid, classid, personid)
values (392, 29, 7673525);
insert into TAKES_LESSON (lessonid, classid, personid)
values (192, 3, 88649232);
insert into TAKES_LESSON (lessonid, classid, personid)
values (646, 71, 30899206);
insert into TAKES_LESSON (lessonid, classid, personid)
values (368, 56, 19894147);
insert into TAKES_LESSON (lessonid, classid, personid)
values (459, 13, 47501817);
insert into TAKES_LESSON (lessonid, classid, personid)
values (90, 90, 13736563);
insert into TAKES_LESSON (lessonid, classid, personid)
values (615, 96, 21552259);
insert into TAKES_LESSON (lessonid, classid, personid)
values (36, 27, 83635789);
insert into TAKES_LESSON (lessonid, classid, personid)
values (291, 9, 22920110);
insert into TAKES_LESSON (lessonid, classid, personid)
values (666, 82, 70753258);
insert into TAKES_LESSON (lessonid, classid, personid)
values (125, 60, 58647622);
insert into TAKES_LESSON (lessonid, classid, personid)
values (609, 6, 25039816);
insert into TAKES_LESSON (lessonid, classid, personid)
values (74, 97, 91416453);
insert into TAKES_LESSON (lessonid, classid, personid)
values (158, 28, 27425173);
insert into TAKES_LESSON (lessonid, classid, personid)
values (420, 42, 30174663);
insert into TAKES_LESSON (lessonid, classid, personid)
values (431, 4, 40573112);
insert into TAKES_LESSON (lessonid, classid, personid)
values (248, 14, 70753258);
insert into TAKES_LESSON (lessonid, classid, personid)
values (677, 71, 25128415);
insert into TAKES_LESSON (lessonid, classid, personid)
values (249, 10, 13356721);
insert into TAKES_LESSON (lessonid, classid, personid)
values (366, 26, 54138899);
insert into TAKES_LESSON (lessonid, classid, personid)
values (447, 13, 76960313);
insert into TAKES_LESSON (lessonid, classid, personid)
values (443, 84, 86272012);
insert into TAKES_LESSON (lessonid, classid, personid)
values (51, 20, 31033551);
insert into TAKES_LESSON (lessonid, classid, personid)
values (220, 83, 7299036);
insert into TAKES_LESSON (lessonid, classid, personid)
values (195, 54, 26290962);
insert into TAKES_LESSON (lessonid, classid, personid)
values (657, 98, 79776408);
insert into TAKES_LESSON (lessonid, classid, personid)
values (644, 33, 22799537);
insert into TAKES_LESSON (lessonid, classid, personid)
values (5, 9, 67503959);
insert into TAKES_LESSON (lessonid, classid, personid)
values (648, 21, 70424737);
insert into TAKES_LESSON (lessonid, classid, personid)
values (93, 27, 29742651);
insert into TAKES_LESSON (lessonid, classid, personid)
values (212, 47, 22682672);
insert into TAKES_LESSON (lessonid, classid, personid)
values (372, 69, 23386909);
insert into TAKES_LESSON (lessonid, classid, personid)
values (99, 3, 27035808);
insert into TAKES_LESSON (lessonid, classid, personid)
values (620, 67, 51193500);
insert into TAKES_LESSON (lessonid, classid, personid)
values (85, 90, 35448349);
insert into TAKES_LESSON (lessonid, classid, personid)
values (451, 85, 99504749);
insert into TAKES_LESSON (lessonid, classid, personid)
values (63, 94, 18340976);
insert into TAKES_LESSON (lessonid, classid, personid)
values (244, 43, 27611255);
insert into TAKES_LESSON (lessonid, classid, personid)
values (466, 81, 22820514);
insert into TAKES_LESSON (lessonid, classid, personid)
values (540, 81, 39385617);
insert into TAKES_LESSON (lessonid, classid, personid)
values (622, 45, 4370439);
insert into TAKES_LESSON (lessonid, classid, personid)
values (550, 13, 26603974);
insert into TAKES_LESSON (lessonid, classid, personid)
values (67, 14, 81946276);
insert into TAKES_LESSON (lessonid, classid, personid)
values (292, 30, 54761032);
insert into TAKES_LESSON (lessonid, classid, personid)
values (518, 42, 45505216);
insert into TAKES_LESSON (lessonid, classid, personid)
values (526, 66, 45080144);
insert into TAKES_LESSON (lessonid, classid, personid)
values (268, 11, 99956255);
insert into TAKES_LESSON (lessonid, classid, personid)
values (308, 84, 34241869);
insert into TAKES_LESSON (lessonid, classid, personid)
values (166, 25, 67653817);
insert into TAKES_LESSON (lessonid, classid, personid)
values (336, 51, 13356721);
insert into TAKES_LESSON (lessonid, classid, personid)
values (514, 93, 77487007);
insert into TAKES_LESSON (lessonid, classid, personid)
values (466, 81, 48536850);
insert into TAKES_LESSON (lessonid, classid, personid)
values (293, 7, 67461875);
insert into TAKES_LESSON (lessonid, classid, personid)
values (655, 83, 9669009);
commit;
prompt 200 records committed...
insert into TAKES_LESSON (lessonid, classid, personid)
values (190, 93, 72778564);
insert into TAKES_LESSON (lessonid, classid, personid)
values (595, 31, 99956255);
insert into TAKES_LESSON (lessonid, classid, personid)
values (31, 90, 50683846);
insert into TAKES_LESSON (lessonid, classid, personid)
values (466, 81, 3267255);
insert into TAKES_LESSON (lessonid, classid, personid)
values (5, 9, 50900940);
insert into TAKES_LESSON (lessonid, classid, personid)
values (533, 8, 49053838);
insert into TAKES_LESSON (lessonid, classid, personid)
values (418, 80, 2450269);
insert into TAKES_LESSON (lessonid, classid, personid)
values (516, 81, 66781374);
insert into TAKES_LESSON (lessonid, classid, personid)
values (38, 99, 24168528);
insert into TAKES_LESSON (lessonid, classid, personid)
values (167, 31, 25602009);
insert into TAKES_LESSON (lessonid, classid, personid)
values (60, 79, 23114002);
insert into TAKES_LESSON (lessonid, classid, personid)
values (626, 72, 37921065);
insert into TAKES_LESSON (lessonid, classid, personid)
values (609, 6, 76364758);
insert into TAKES_LESSON (lessonid, classid, personid)
values (351, 53, 91089992);
insert into TAKES_LESSON (lessonid, classid, personid)
values (533, 8, 21317536);
insert into TAKES_LESSON (lessonid, classid, personid)
values (579, 75, 15164192);
insert into TAKES_LESSON (lessonid, classid, personid)
values (453, 45, 99887779);
insert into TAKES_LESSON (lessonid, classid, personid)
values (532, 72, 97400551);
insert into TAKES_LESSON (lessonid, classid, personid)
values (336, 51, 33449046);
insert into TAKES_LESSON (lessonid, classid, personid)
values (34, 11, 55252246);
insert into TAKES_LESSON (lessonid, classid, personid)
values (652, 2, 81024259);
insert into TAKES_LESSON (lessonid, classid, personid)
values (642, 48, 21293730);
insert into TAKES_LESSON (lessonid, classid, personid)
values (163, 63, 57848591);
insert into TAKES_LESSON (lessonid, classid, personid)
values (640, 81, 5179001);
insert into TAKES_LESSON (lessonid, classid, personid)
values (229, 59, 92676944);
insert into TAKES_LESSON (lessonid, classid, personid)
values (352, 32, 76641085);
insert into TAKES_LESSON (lessonid, classid, personid)
values (338, 32, 75363400);
insert into TAKES_LESSON (lessonid, classid, personid)
values (148, 30, 70595940);
insert into TAKES_LESSON (lessonid, classid, personid)
values (131, 26, 62214926);
insert into TAKES_LESSON (lessonid, classid, personid)
values (593, 26, 19067900);
insert into TAKES_LESSON (lessonid, classid, personid)
values (371, 10, 79476002);
insert into TAKES_LESSON (lessonid, classid, personid)
values (467, 14, 19099801);
insert into TAKES_LESSON (lessonid, classid, personid)
values (29, 82, 35965202);
insert into TAKES_LESSON (lessonid, classid, personid)
values (657, 98, 26278207);
insert into TAKES_LESSON (lessonid, classid, personid)
values (509, 39, 25112977);
insert into TAKES_LESSON (lessonid, classid, personid)
values (27, 13, 81946276);
insert into TAKES_LESSON (lessonid, classid, personid)
values (490, 62, 29724492);
insert into TAKES_LESSON (lessonid, classid, personid)
values (268, 11, 73049091);
insert into TAKES_LESSON (lessonid, classid, personid)
values (305, 58, 22920110);
insert into TAKES_LESSON (lessonid, classid, personid)
values (524, 20, 42322889);
insert into TAKES_LESSON (lessonid, classid, personid)
values (418, 80, 6603015);
insert into TAKES_LESSON (lessonid, classid, personid)
values (242, 66, 35965202);
insert into TAKES_LESSON (lessonid, classid, personid)
values (560, 78, 13081784);
insert into TAKES_LESSON (lessonid, classid, personid)
values (268, 11, 21293730);
insert into TAKES_LESSON (lessonid, classid, personid)
values (534, 31, 78118267);
insert into TAKES_LESSON (lessonid, classid, personid)
values (679, 62, 64070950);
insert into TAKES_LESSON (lessonid, classid, personid)
values (543, 36, 30241470);
insert into TAKES_LESSON (lessonid, classid, personid)
values (603, 53, 66340561);
insert into TAKES_LESSON (lessonid, classid, personid)
values (95, 42, 6292018);
insert into TAKES_LESSON (lessonid, classid, personid)
values (676, 35, 23412617);
insert into TAKES_LESSON (lessonid, classid, personid)
values (676, 35, 75033915);
insert into TAKES_LESSON (lessonid, classid, personid)
values (402, 16, 30899206);
insert into TAKES_LESSON (lessonid, classid, personid)
values (50, 44, 32410121);
insert into TAKES_LESSON (lessonid, classid, personid)
values (229, 59, 2505457);
insert into TAKES_LESSON (lessonid, classid, personid)
values (464, 79, 20103782);
insert into TAKES_LESSON (lessonid, classid, personid)
values (605, 41, 84377393);
insert into TAKES_LESSON (lessonid, classid, personid)
values (515, 53, 20767492);
insert into TAKES_LESSON (lessonid, classid, personid)
values (700, 92, 64820168);
insert into TAKES_LESSON (lessonid, classid, personid)
values (676, 35, 39385617);
insert into TAKES_LESSON (lessonid, classid, personid)
values (302, 40, 21837118);
insert into TAKES_LESSON (lessonid, classid, personid)
values (535, 28, 11612959);
insert into TAKES_LESSON (lessonid, classid, personid)
values (56, 82, 81654249);
insert into TAKES_LESSON (lessonid, classid, personid)
values (55, 100, 46532727);
insert into TAKES_LESSON (lessonid, classid, personid)
values (651, 52, 70363242);
insert into TAKES_LESSON (lessonid, classid, personid)
values (344, 60, 50550367);
insert into TAKES_LESSON (lessonid, classid, personid)
values (685, 27, 18340976);
insert into TAKES_LESSON (lessonid, classid, personid)
values (544, 31, 69408426);
insert into TAKES_LESSON (lessonid, classid, personid)
values (599, 1, 9077728);
insert into TAKES_LESSON (lessonid, classid, personid)
values (211, 41, 314024);
insert into TAKES_LESSON (lessonid, classid, personid)
values (311, 4, 52313162);
insert into TAKES_LESSON (lessonid, classid, personid)
values (288, 8, 60383864);
insert into TAKES_LESSON (lessonid, classid, personid)
values (513, 54, 96970243);
insert into TAKES_LESSON (lessonid, classid, personid)
values (71, 92, 54968773);
insert into TAKES_LESSON (lessonid, classid, personid)
values (46, 97, 74889890);
insert into TAKES_LESSON (lessonid, classid, personid)
values (572, 44, 86453357);
insert into TAKES_LESSON (lessonid, classid, personid)
values (329, 8, 76734801);
insert into TAKES_LESSON (lessonid, classid, personid)
values (54, 5, 49478035);
insert into TAKES_LESSON (lessonid, classid, personid)
values (426, 47, 33449046);
insert into TAKES_LESSON (lessonid, classid, personid)
values (687, 33, 69408426);
insert into TAKES_LESSON (lessonid, classid, personid)
values (22, 88, 71263062);
insert into TAKES_LESSON (lessonid, classid, personid)
values (674, 26, 10517860);
insert into TAKES_LESSON (lessonid, classid, personid)
values (217, 14, 26603974);
insert into TAKES_LESSON (lessonid, classid, personid)
values (190, 93, 29203895);
insert into TAKES_LESSON (lessonid, classid, personid)
values (113, 91, 81325843);
insert into TAKES_LESSON (lessonid, classid, personid)
values (338, 32, 81884643);
insert into TAKES_LESSON (lessonid, classid, personid)
values (522, 84, 62531988);
insert into TAKES_LESSON (lessonid, classid, personid)
values (318, 51, 90824185);
insert into TAKES_LESSON (lessonid, classid, personid)
values (25, 35, 49908274);
insert into TAKES_LESSON (lessonid, classid, personid)
values (587, 28, 45968098);
insert into TAKES_LESSON (lessonid, classid, personid)
values (644, 33, 24414730);
insert into TAKES_LESSON (lessonid, classid, personid)
values (259, 43, 53483220);
insert into TAKES_LESSON (lessonid, classid, personid)
values (20, 94, 23071061);
insert into TAKES_LESSON (lessonid, classid, personid)
values (315, 64, 96973892);
insert into TAKES_LESSON (lessonid, classid, personid)
values (186, 10, 55478450);
insert into TAKES_LESSON (lessonid, classid, personid)
values (689, 25, 19894147);
insert into TAKES_LESSON (lessonid, classid, personid)
values (340, 30, 25602009);
insert into TAKES_LESSON (lessonid, classid, personid)
values (623, 1, 62531988);
insert into TAKES_LESSON (lessonid, classid, personid)
values (70, 79, 58302395);
insert into TAKES_LESSON (lessonid, classid, personid)
values (444, 32, 90372030);
insert into TAKES_LESSON (lessonid, classid, personid)
values (210, 41, 27803037);
commit;
prompt 300 records committed...
insert into TAKES_LESSON (lessonid, classid, personid)
values (315, 64, 23491578);
insert into TAKES_LESSON (lessonid, classid, personid)
values (247, 24, 79776408);
insert into TAKES_LESSON (lessonid, classid, personid)
values (256, 37, 61698245);
insert into TAKES_LESSON (lessonid, classid, personid)
values (72, 98, 58647622);
insert into TAKES_LESSON (lessonid, classid, personid)
values (667, 77, 29203895);
insert into TAKES_LESSON (lessonid, classid, personid)
values (363, 85, 37099706);
insert into TAKES_LESSON (lessonid, classid, personid)
values (599, 1, 70595940);
insert into TAKES_LESSON (lessonid, classid, personid)
values (657, 98, 22179745);
insert into TAKES_LESSON (lessonid, classid, personid)
values (251, 81, 16134366);
insert into TAKES_LESSON (lessonid, classid, personid)
values (17, 44, 1601841);
insert into TAKES_LESSON (lessonid, classid, personid)
values (168, 82, 22934957);
insert into TAKES_LESSON (lessonid, classid, personid)
values (432, 4, 92676944);
insert into TAKES_LESSON (lessonid, classid, personid)
values (497, 96, 88239853);
insert into TAKES_LESSON (lessonid, classid, personid)
values (525, 11, 16134366);
insert into TAKES_LESSON (lessonid, classid, personid)
values (557, 46, 78118267);
insert into TAKES_LESSON (lessonid, classid, personid)
values (631, 10, 79776408);
insert into TAKES_LESSON (lessonid, classid, personid)
values (73, 30, 9754733);
insert into TAKES_LESSON (lessonid, classid, personid)
values (296, 89, 22642135);
insert into TAKES_LESSON (lessonid, classid, personid)
values (28, 25, 79192786);
insert into TAKES_LESSON (lessonid, classid, personid)
values (577, 45, 25112977);
insert into TAKES_LESSON (lessonid, classid, personid)
values (338, 32, 27803037);
insert into TAKES_LESSON (lessonid, classid, personid)
values (447, 13, 73038198);
insert into TAKES_LESSON (lessonid, classid, personid)
values (408, 18, 66107157);
insert into TAKES_LESSON (lessonid, classid, personid)
values (464, 79, 98257068);
insert into TAKES_LESSON (lessonid, classid, personid)
values (543, 36, 27449638);
insert into TAKES_LESSON (lessonid, classid, personid)
values (83, 88, 75033915);
insert into TAKES_LESSON (lessonid, classid, personid)
values (589, 53, 42253574);
insert into TAKES_LESSON (lessonid, classid, personid)
values (583, 25, 42253574);
insert into TAKES_LESSON (lessonid, classid, personid)
values (190, 93, 21837118);
insert into TAKES_LESSON (lessonid, classid, personid)
values (597, 8, 8039183);
insert into TAKES_LESSON (lessonid, classid, personid)
values (481, 59, 54757032);
insert into TAKES_LESSON (lessonid, classid, personid)
values (455, 50, 11798215);
insert into TAKES_LESSON (lessonid, classid, personid)
values (531, 52, 32313288);
insert into TAKES_LESSON (lessonid, classid, personid)
values (308, 84, 34375443);
insert into TAKES_LESSON (lessonid, classid, personid)
values (627, 64, 66588970);
insert into TAKES_LESSON (lessonid, classid, personid)
values (147, 6, 48277353);
insert into TAKES_LESSON (lessonid, classid, personid)
values (359, 52, 66340561);
insert into TAKES_LESSON (lessonid, classid, personid)
values (658, 2, 76734801);
insert into TAKES_LESSON (lessonid, classid, personid)
values (326, 78, 36833753);
insert into TAKES_LESSON (lessonid, classid, personid)
values (14, 68, 30884206);
insert into TAKES_LESSON (lessonid, classid, personid)
values (618, 60, 13010901);
insert into TAKES_LESSON (lessonid, classid, personid)
values (139, 44, 88061228);
insert into TAKES_LESSON (lessonid, classid, personid)
values (164, 27, 62846464);
insert into TAKES_LESSON (lessonid, classid, personid)
values (443, 84, 41003550);
insert into TAKES_LESSON (lessonid, classid, personid)
values (423, 23, 32128888);
insert into TAKES_LESSON (lessonid, classid, personid)
values (59, 76, 58660984);
insert into TAKES_LESSON (lessonid, classid, personid)
values (147, 6, 24414730);
insert into TAKES_LESSON (lessonid, classid, personid)
values (422, 42, 4245084);
insert into TAKES_LESSON (lessonid, classid, personid)
values (90, 90, 33915414);
insert into TAKES_LESSON (lessonid, classid, personid)
values (18, 90, 23386909);
insert into TAKES_LESSON (lessonid, classid, personid)
values (336, 51, 61498790);
insert into TAKES_LESSON (lessonid, classid, personid)
values (480, 6, 22819264);
insert into TAKES_LESSON (lessonid, classid, personid)
values (173, 7, 97695307);
insert into TAKES_LESSON (lessonid, classid, personid)
values (67, 14, 99887779);
insert into TAKES_LESSON (lessonid, classid, personid)
values (472, 91, 25310202);
insert into TAKES_LESSON (lessonid, classid, personid)
values (105, 21, 25310202);
insert into TAKES_LESSON (lessonid, classid, personid)
values (496, 26, 45080144);
insert into TAKES_LESSON (lessonid, classid, personid)
values (147, 6, 35548775);
insert into TAKES_LESSON (lessonid, classid, personid)
values (518, 42, 21837118);
insert into TAKES_LESSON (lessonid, classid, personid)
values (542, 62, 4370439);
insert into TAKES_LESSON (lessonid, classid, personid)
values (199, 45, 8752121);
insert into TAKES_LESSON (lessonid, classid, personid)
values (587, 28, 58647622);
insert into TAKES_LESSON (lessonid, classid, personid)
values (50, 44, 25039816);
insert into TAKES_LESSON (lessonid, classid, personid)
values (55, 100, 38289354);
insert into TAKES_LESSON (lessonid, classid, personid)
values (681, 31, 8421656);
insert into TAKES_LESSON (lessonid, classid, personid)
values (280, 70, 19894147);
insert into TAKES_LESSON (lessonid, classid, personid)
values (465, 96, 27611255);
insert into TAKES_LESSON (lessonid, classid, personid)
values (449, 22, 19067900);
insert into TAKES_LESSON (lessonid, classid, personid)
values (696, 2, 48536850);
insert into TAKES_LESSON (lessonid, classid, personid)
values (368, 56, 8752121);
insert into TAKES_LESSON (lessonid, classid, personid)
values (543, 36, 61886377);
insert into TAKES_LESSON (lessonid, classid, personid)
values (76, 28, 73049091);
insert into TAKES_LESSON (lessonid, classid, personid)
values (78, 100, 30845995);
insert into TAKES_LESSON (lessonid, classid, personid)
values (472, 91, 24504822);
insert into TAKES_LESSON (lessonid, classid, personid)
values (448, 74, 99988900);
insert into TAKES_LESSON (lessonid, classid, personid)
values (41, 55, 75363400);
insert into TAKES_LESSON (lessonid, classid, personid)
values (208, 100, 11534770);
insert into TAKES_LESSON (lessonid, classid, personid)
values (99, 3, 57601580);
insert into TAKES_LESSON (lessonid, classid, personid)
values (555, 28, 97813459);
insert into TAKES_LESSON (lessonid, classid, personid)
values (166, 25, 58227833);
insert into TAKES_LESSON (lessonid, classid, personid)
values (559, 76, 69838192);
insert into TAKES_LESSON (lessonid, classid, personid)
values (111, 11, 40573112);
insert into TAKES_LESSON (lessonid, classid, personid)
values (363, 85, 38289354);
insert into TAKES_LESSON (lessonid, classid, personid)
values (615, 96, 6628587);
insert into TAKES_LESSON (lessonid, classid, personid)
values (10, 50, 19099801);
insert into TAKES_LESSON (lessonid, classid, personid)
values (354, 61, 88310865);
insert into TAKES_LESSON (lessonid, classid, personid)
values (452, 7, 76734801);
insert into TAKES_LESSON (lessonid, classid, personid)
values (102, 10, 54467502);
insert into TAKES_LESSON (lessonid, classid, personid)
values (175, 66, 76641085);
insert into TAKES_LESSON (lessonid, classid, personid)
values (209, 70, 96098746);
insert into TAKES_LESSON (lessonid, classid, personid)
values (111, 11, 47501817);
insert into TAKES_LESSON (lessonid, classid, personid)
values (366, 26, 47501817);
insert into TAKES_LESSON (lessonid, classid, personid)
values (101, 44, 45412385);
insert into TAKES_LESSON (lessonid, classid, personid)
values (7, 82, 35548775);
insert into TAKES_LESSON (lessonid, classid, personid)
values (13, 81, 31393240);
insert into TAKES_LESSON (lessonid, classid, personid)
values (628, 73, 23114002);
insert into TAKES_LESSON (lessonid, classid, personid)
values (658, 2, 30104584);
insert into TAKES_LESSON (lessonid, classid, personid)
values (308, 84, 46327250);
insert into TAKES_LESSON (lessonid, classid, personid)
values (559, 76, 62214926);
insert into TAKES_LESSON (lessonid, classid, personid)
values (460, 2, 48536850);
commit;
prompt 400 records committed...
insert into TAKES_LESSON (lessonid, classid, personid)
values (642, 48, 15164192);
insert into TAKES_LESSON (lessonid, classid, personid)
values (576, 29, 31874543);
insert into TAKES_LESSON (lessonid, classid, personid)
values (139, 44, 83635789);
insert into TAKES_LESSON (lessonid, classid, personid)
values (92, 15, 54761032);
insert into TAKES_LESSON (lessonid, classid, personid)
values (349, 72, 87891090);
insert into TAKES_LESSON (lessonid, classid, personid)
values (671, 20, 8081255);
insert into TAKES_LESSON (lessonid, classid, personid)
values (463, 58, 90372109);
insert into TAKES_LESSON (lessonid, classid, personid)
values (668, 94, 40293735);
insert into TAKES_LESSON (lessonid, classid, personid)
values (622, 45, 67887328);
insert into TAKES_LESSON (lessonid, classid, personid)
values (397, 9, 14432183);
insert into TAKES_LESSON (lessonid, classid, personid)
values (99, 3, 45505216);
insert into TAKES_LESSON (lessonid, classid, personid)
values (167, 31, 26603974);
insert into TAKES_LESSON (lessonid, classid, personid)
values (21, 91, 30062117);
insert into TAKES_LESSON (lessonid, classid, personid)
values (339, 83, 22682672);
insert into TAKES_LESSON (lessonid, classid, personid)
values (638, 23, 94625728);
insert into TAKES_LESSON (lessonid, classid, personid)
values (606, 88, 37099706);
insert into TAKES_LESSON (lessonid, classid, personid)
values (357, 49, 66588970);
insert into TAKES_LESSON (lessonid, classid, personid)
values (90, 90, 25112977);
insert into TAKES_LESSON (lessonid, classid, personid)
values (411, 82, 29724492);
insert into TAKES_LESSON (lessonid, classid, personid)
values (397, 9, 67887328);
insert into TAKES_LESSON (lessonid, classid, personid)
values (104, 50, 38066771);
insert into TAKES_LESSON (lessonid, classid, personid)
values (588, 7, 88634045);
insert into TAKES_LESSON (lessonid, classid, personid)
values (616, 82, 9228447);
insert into TAKES_LESSON (lessonid, classid, personid)
values (525, 11, 11451089);
insert into TAKES_LESSON (lessonid, classid, personid)
values (260, 8, 73593804);
insert into TAKES_LESSON (lessonid, classid, personid)
values (443, 84, 42688439);
insert into TAKES_LESSON (lessonid, classid, personid)
values (377, 15, 93842287);
insert into TAKES_LESSON (lessonid, classid, personid)
values (32, 33, 75363400);
insert into TAKES_LESSON (lessonid, classid, personid)
values (614, 41, 41407116);
insert into TAKES_LESSON (lessonid, classid, personid)
values (640, 81, 50885464);
insert into TAKES_LESSON (lessonid, classid, personid)
values (278, 16, 68928002);
insert into TAKES_LESSON (lessonid, classid, personid)
values (644, 33, 67481341);
insert into TAKES_LESSON (lessonid, classid, personid)
values (198, 38, 28702001);
insert into TAKES_LESSON (lessonid, classid, personid)
values (131, 26, 77425508);
insert into TAKES_LESSON (lessonid, classid, personid)
values (252, 52, 81884643);
insert into TAKES_LESSON (lessonid, classid, personid)
values (576, 29, 62213084);
insert into TAKES_LESSON (lessonid, classid, personid)
values (355, 31, 60383864);
insert into TAKES_LESSON (lessonid, classid, personid)
values (300, 96, 8796425);
insert into TAKES_LESSON (lessonid, classid, personid)
values (12, 16, 75003632);
insert into TAKES_LESSON (lessonid, classid, personid)
values (474, 26, 23890659);
insert into TAKES_LESSON (lessonid, classid, personid)
values (456, 78, 46861565);
insert into TAKES_LESSON (lessonid, classid, personid)
values (361, 74, 314024);
insert into TAKES_LESSON (lessonid, classid, personid)
values (547, 48, 67481341);
insert into TAKES_LESSON (lessonid, classid, personid)
values (82, 30, 7860731);
insert into TAKES_LESSON (lessonid, classid, personid)
values (454, 38, 30411578);
insert into TAKES_LESSON (lessonid, classid, personid)
values (504, 12, 13356721);
insert into TAKES_LESSON (lessonid, classid, personid)
values (348, 45, 13081784);
insert into TAKES_LESSON (lessonid, classid, personid)
values (566, 30, 62214926);
insert into TAKES_LESSON (lessonid, classid, personid)
values (99, 3, 46339943);
insert into TAKES_LESSON (lessonid, classid, personid)
values (143, 46, 23386909);
insert into TAKES_LESSON (lessonid, classid, personid)
values (100, 43, 63990543);
insert into TAKES_LESSON (lessonid, classid, personid)
values (171, 69, 30899206);
insert into TAKES_LESSON (lessonid, classid, personid)
values (69, 48, 36349653);
insert into TAKES_LESSON (lessonid, classid, personid)
values (629, 34, 37099706);
insert into TAKES_LESSON (lessonid, classid, personid)
values (346, 35, 81024259);
insert into TAKES_LESSON (lessonid, classid, personid)
values (378, 28, 49478035);
insert into TAKES_LESSON (lessonid, classid, personid)
values (591, 76, 57848591);
insert into TAKES_LESSON (lessonid, classid, personid)
values (211, 41, 10517860);
insert into TAKES_LESSON (lessonid, classid, personid)
values (626, 72, 94174046);
insert into TAKES_LESSON (lessonid, classid, personid)
values (437, 58, 79260141);
insert into TAKES_LESSON (lessonid, classid, personid)
values (310, 55, 39658357);
insert into TAKES_LESSON (lessonid, classid, personid)
values (301, 16, 67443455);
insert into TAKES_LESSON (lessonid, classid, personid)
values (173, 7, 23041511);
insert into TAKES_LESSON (lessonid, classid, personid)
values (582, 59, 70178481);
insert into TAKES_LESSON (lessonid, classid, personid)
values (211, 41, 59413980);
insert into TAKES_LESSON (lessonid, classid, personid)
values (326, 78, 23412617);
insert into TAKES_LESSON (lessonid, classid, personid)
values (529, 39, 71989689);
insert into TAKES_LESSON (lessonid, classid, personid)
values (611, 24, 70389865);
insert into TAKES_LESSON (lessonid, classid, personid)
values (500, 26, 79776408);
insert into TAKES_LESSON (lessonid, classid, personid)
values (520, 13, 2303105);
insert into TAKES_LESSON (lessonid, classid, personid)
values (266, 12, 6484710);
insert into TAKES_LESSON (lessonid, classid, personid)
values (496, 26, 67503959);
insert into TAKES_LESSON (lessonid, classid, personid)
values (425, 21, 17739277);
insert into TAKES_LESSON (lessonid, classid, personid)
values (604, 85, 59560586);
insert into TAKES_LESSON (lessonid, classid, personid)
values (231, 95, 69335813);
insert into TAKES_LESSON (lessonid, classid, personid)
values (200, 63, 23041511);
insert into TAKES_LESSON (lessonid, classid, personid)
values (215, 28, 41407116);
insert into TAKES_LESSON (lessonid, classid, personid)
values (444, 32, 65755336);
insert into TAKES_LESSON (lessonid, classid, personid)
values (466, 81, 88726887);
insert into TAKES_LESSON (lessonid, classid, personid)
values (215, 28, 54968773);
insert into TAKES_LESSON (lessonid, classid, personid)
values (107, 27, 11221464);
insert into TAKES_LESSON (lessonid, classid, personid)
values (694, 90, 38614060);
insert into TAKES_LESSON (lessonid, classid, personid)
values (132, 70, 28260775);
insert into TAKES_LESSON (lessonid, classid, personid)
values (533, 8, 55252246);
insert into TAKES_LESSON (lessonid, classid, personid)
values (295, 77, 10573645);
insert into TAKES_LESSON (lessonid, classid, personid)
values (49, 89, 34375443);
insert into TAKES_LESSON (lessonid, classid, personid)
values (335, 60, 63532139);
insert into TAKES_LESSON (lessonid, classid, personid)
values (463, 58, 80691820);
insert into TAKES_LESSON (lessonid, classid, personid)
values (559, 76, 19099801);
insert into TAKES_LESSON (lessonid, classid, personid)
values (289, 35, 81005094);
insert into TAKES_LESSON (lessonid, classid, personid)
values (615, 96, 46339943);
insert into TAKES_LESSON (lessonid, classid, personid)
values (380, 29, 730279);
insert into TAKES_LESSON (lessonid, classid, personid)
values (646, 71, 24504822);
insert into TAKES_LESSON (lessonid, classid, personid)
values (502, 70, 54315940);
insert into TAKES_LESSON (lessonid, classid, personid)
values (436, 30, 62213084);
insert into TAKES_LESSON (lessonid, classid, personid)
values (118, 4, 91089992);
insert into TAKES_LESSON (lessonid, classid, personid)
values (411, 82, 2591817);
insert into TAKES_LESSON (lessonid, classid, personid)
values (203, 25, 19099801);
insert into TAKES_LESSON (lessonid, classid, personid)
values (411, 82, 90717124);
insert into TAKES_LESSON (lessonid, classid, personid)
values (527, 53, 54033988);
commit;
prompt 500 records committed...
insert into TAKES_LESSON (lessonid, classid, personid)
values (478, 15, 55996197);
commit;
prompt 501 records loaded
prompt Enabling foreign key constraints for GYM_CLASS_MEDICAL_CONSTRAINS...
alter table GYM_CLASS_MEDICAL_CONSTRAINS enable constraint SYS_C00706158;
prompt Enabling foreign key constraints for GYM_MEMBER...
alter table GYM_MEMBER enable constraint SYS_C00709988;
prompt Enabling foreign key constraints for GYM_MEMBER_MEDICAL_CONSTRAINS...
alter table GYM_MEMBER_MEDICAL_CONSTRAINS enable constraint SYS_C00709992;
prompt Enabling foreign key constraints for TRAINER...
alter table TRAINER enable constraint SYS_C00706149;
prompt Enabling foreign key constraints for LESSON...
alter table LESSON enable constraint SYS_C00711879;
alter table LESSON enable constraint SYS_C00711880;
alter table LESSON enable constraint SYS_C00711881;
prompt Enabling foreign key constraints for PERSON_PHONE...
alter table PERSON_PHONE enable constraint SYS_C00706162;
prompt Enabling foreign key constraints for TAKES_LESSON...
alter table TAKES_LESSON enable constraint SYS_C00711886;
alter table TAKES_LESSON enable constraint SYS_C00711887;
prompt Enabling triggers for GYM_CLASS...
alter table GYM_CLASS enable all triggers;
prompt Enabling triggers for GYM_CLASS_MEDICAL_CONSTRAINS...
alter table GYM_CLASS_MEDICAL_CONSTRAINS enable all triggers;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for GYM_MEMBER...
alter table GYM_MEMBER enable all triggers;
prompt Enabling triggers for GYM_MEMBER_MEDICAL_CONSTRAINS...
alter table GYM_MEMBER_MEDICAL_CONSTRAINS enable all triggers;
prompt Enabling triggers for ROOM...
alter table ROOM enable all triggers;
prompt Enabling triggers for TRAINER...
alter table TRAINER enable all triggers;
prompt Enabling triggers for LESSON...
alter table LESSON enable all triggers;
prompt Enabling triggers for PERSON_PHONE...
alter table PERSON_PHONE enable all triggers;
prompt Enabling triggers for TAKES_LESSON...
alter table TAKES_LESSON enable all triggers;
