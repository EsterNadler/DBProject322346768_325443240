--insert to Person table (from data generator)
insert into PERSON (PERSONID, BIRTHDATE, FIRSTNAME, LASTNAME, CITY, ADDRESS, HOUSENUM, EMAIL, GENDER)
values (81654249, to_date('31-01-1953', 'dd-mm-yyyy'), 'Dar', 'Popper', 'Fuerth', '"ezra"', 54, 'dar.popper@fds.de', 'F');

insert into PERSON (PERSONID, BIRTHDATE, FIRSTNAME, LASTNAME, CITY, ADDRESS, HOUSENUM, EMAIL, GENDER)
values (13611451, to_date('17-03-1970', 'dd-mm-yyyy'), 'Mika', 'Lonsdale', 'Juneau', '"gotlieb"', 121, 'mika@kimberlyclark.com', 'F');

insert into PERSON (PERSONID, BIRTHDATE, FIRSTNAME, LASTNAME, CITY, ADDRESS, HOUSENUM, EMAIL, GENDER)
values (65545343, to_date('08-02-1910', 'dd-mm-yyyy'), 'Hal', 'Makowicz', 'Edwardstown', '"etzel"', 13, 'hal.makowicz@nha.au', 'M');

commit;

--insert to Gym_Class table (from a file created by a python program)
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (1, 'Prenatal Yoga', 62, 69, 82);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (2, 'Postnatal Yoga', 49, 56, 61);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (3, 'Youth Sports Training', 43, 66, 50);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (4, 'Healthy Cooking', 60, 108, 43);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (5, 'Muscle Gain Strategies', 45, 91, 89);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (6, 'Spinning', 69, 71, 119);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (7, 'Nutrition 101', 53, 88, 36);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (8, 'Body Sculpt', 70, 104, 100);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (9, 'Water Aerobics', 64, 79, 93);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (10, 'Postnatal Yoga', 18, 57, 58);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (11, 'Cycling', 22, 84, 71);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (12, 'Tai Chi', 28, 84, 72);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (13, 'Gymnastics Conditioning', 61, 70, 53);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (14, 'HIIT', 16, 18, 32);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (15, 'Senior Fitness', 28, 41, 58);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (16, 'Healthy Cooking', 38, 97, 78);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (17, 'Tai Chi', 40, 68, 66);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (18, 'Kickboxing', 41, 47, 47);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (19, 'Bodybuilding Basics', 35, 86, 86);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (20, 'Aerobics', 23, 88, 30);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (21, 'Pilates for Beginners', 6, 8, 102);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (22, 'Flexibility Training', 41, 86, 120);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (23, 'Zumba Dance', 64, 78, 82);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (24, 'Nutrition 101', 22, 68, 119);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (25, 'Youth Sports Training', 19, 61, 102);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (26, 'Muscle Gain Strategies', 64, 118, 73);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (27, 'Aqua Zumba', 52, 92, 102);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (28, 'Weight Loss Tips', 2, 50, 39);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (29, 'Stretch and Flex', 10, 12, 68);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (30, 'Spinning', 39, 101, 52);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (31, 'Zumba Dance', 64, 112, 90);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (32, 'Water Aerobics', 10, 41, 110);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (33, 'HIIT', 35, 82, 42);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (34, 'Kids Yoga', 52, 116, 87);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (35, 'Trail Running', 60, 119, 92);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (36, 'Stretch and Flex', 39, 87, 79);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (37, 'Dance Aerobics', 43, 93, 49);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (38, 'Tai Chi', 8, 25, 43);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (39, 'Muscle Gain Strategies', 66, 84, 61);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (40, 'Bodybuilding Basics', 12, 53, 69);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (41, 'Kickboxing', 37, 62, 32);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (42, 'Nutrition 101', 70, 86, 108);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (43, 'Advanced Yoga', 11, 24, 42);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (44, 'Weight Loss Tips', 65, 94, 61);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (45, 'Meditation and Relaxation', 19, 30, 114);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (46, 'Powerlifting Basics', 12, 15, 56);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (47, 'Walking Group', 20, 29, 54);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (48, 'Running Club', 22, 87, 55);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (49, 'Rowing', 11, 22, 116);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (50, 'Bodybuilding Basics', 51, 90, 54);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (51, 'Core Strength', 70, 125, 89);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (52, 'Dance Aerobics', 65, 102, 72);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (53, 'Powerlifting Basics', 51, 113, 116);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (54, 'Boot Camp', 30, 56, 87);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (55, 'Aqua Zumba', 65, 71, 93);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (56, 'Sports Nutrition', 44, 58, 37);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (57, 'Mindfulness Meditation', 63, 66, 104);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (58, 'Trail Running', 46, 78, 105);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (59, 'Water Aerobics', 6, 70, 33);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (60, 'Gymnastics Conditioning', 41, 93, 39);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (61, 'Cycling', 50, 109, 95);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (62, 'Walking Group', 18, 70, 43);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (63, 'Meditation and Relaxation', 20, 43, 52);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (64, 'Advanced Yoga', 25, 28, 38);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (65, 'Tai Chi', 10, 23, 46);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (66, 'Aqua Zumba', 40, 69, 115);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (67, 'Obstacle Course Training', 4, 9, 46);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (68, 'Water Aerobics', 54, 115, 66);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (69, 'Functional Fitness', 67, 98, 110);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (70, 'Powerlifting Basics', 44, 90, 80);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (71, 'Weight Loss Tips', 58, 75, 120);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (72, 'Water Aerobics', 14, 75, 75);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (73, 'Rowing', 62, 111, 36);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (74, 'Strength Training', 50, 98, 66);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (75, 'Teen Fitness', 37, 54, 67);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (76, 'Sports Nutrition', 52, 99, 105);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (77, 'Obstacle Course Training', 50, 96, 83);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (78, 'Kids Yoga', 62, 93, 67);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (79, 'Postnatal Yoga', 67, 68, 53);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (80, 'Kids Yoga', 40, 54, 49);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (81, 'Dance Aerobics', 55, 119, 94);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (82, 'Boot Camp', 33, 44, 113);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (83, 'Zumba Dance', 58, 97, 78);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (84, 'Sports Nutrition', 8, 53, 109);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (85, 'Trail Running', 48, 74, 87);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (86, 'Dance Aerobics', 7, 71, 103);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (87, 'CrossFit Intro', 10, 43, 51);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (88, 'Flexibility Training', 22, 66, 95);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (89, 'Cardio Blast', 58, 104, 84);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (90, 'Senior Fitness', 22, 29, 45);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (91, 'Mindfulness Meditation', 61, 84, 70);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (92, 'Aerobics', 31, 64, 46);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (93, 'Postnatal Yoga', 20, 80, 101);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (94, 'Postnatal Yoga', 32, 63, 40);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (95, 'CrossFit Intro', 7, 60, 54);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (96, 'Aerobics', 19, 40, 57);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (97, 'Obstacle Course Training', 64, 84, 34);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (98, 'Kids Yoga', 2, 21, 84);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (99, 'Tai Chi', 27, 30, 73);
INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES
  (100, 'Teen Fitness', 62, 94, 50);
commit;

----insert to Person_Phone table (from data generator)
insert into PERSON_PHONE (PHONE, PERSONID)
values ('050-6927163', 22682672);

insert into PERSON_PHONE (PHONE, PERSONID)
values ('059-0685993', 16134366);

insert into PERSON_PHONE (PHONE, PERSONID)
values ('058-5564132', 64027261);

commit;
