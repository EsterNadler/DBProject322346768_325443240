# מיני פרויקט בבסיסי נתונים- ניהול מערכת שיעורים במכון כושר
מגישות: אסתר נדלר-איצקוביץ וצפורה מארוקו

## תיאור כללי 
המערכת שלנו עוסקת בניהול מערכת המידע של קורסים ושיעורים במכון כושר, וכוללת את הישויות הבאות:
מדריכים, מתאמנים, קורסים (כגון פילאטיס, אירובי), שיעורים (שיהוו מפגש של קורס מסוים) וכן את החדר הפיזי אליו משויך השיעור.
בהמשך נציג שאילתות שונות שיעזרו לנו לדלות מידע מהנתונים וכן לערוך שינויים על הטבלאות הקיימות..

## תוכן עניינים
- [שלב א](#שלב-א)
  - [דיאגרמת ERD](#דיאגרמת-erd)
  - [דיאגרמת DSD](#דיאגרמת-dsd)
  - [תוכן קובץ ה-CreateTables](#תוכן-קובץ-ה-createtables)
  - [הפעלת פקודות DESC](#הפעלת-פקודות-description)
 
## שלב א 

### דיאגרמת ERD
<img src="https://github.com/EsterNadler/DataBase-Project/assets/116155777/736b99a2-40f8-4dab-8653-52c03f412ab9" alt="1דיאגרמה" width="1000">

### דיאגרמת DSD
<img src="https://github.com/EsterNadler/DataBase-Project/assets/116155777/1d3dc8c2-b440-410f-8765-046a4418abf9" alt="2דיאגרמה" width="1000">

### תוכן קובץ ה CreateTables:
```sh
CREATE TABLE Gym_Class
(
  ClassId INT NOT NULL,
  ClassName VARCHAR2(50) NOT NULL,
  MinAge INT NOT NULL,
  MaxAge INT NOT NULL,
  Duration INT NOT NULL,
  PRIMARY KEY (ClassId)
);

CREATE TABLE Room
(
  Capacity INT NOT NULL,
  RoomNum INT NOT NULL,
  RoomType VARCHAR2(50) NOT NULL,
  PRIMARY KEY (RoomNum)
);

CREATE TABLE Person
(
  PersonId INT NOT NULL,
  BirthDate DATE NOT NULL,
  FirstName VARCHAR2(20) NOT NULL,
  LastName VARCHAR2(30) NOT NULL,
  City VARCHAR2(30) NOT NULL,
  Address VARCHAR2(50) NOT NULL,
  HouseNum INT NOT NULL,
  Email VARCHAR2(40),
  Gender VARCHAR2(1) NOT NULL,
  PRIMARY KEY (PersonId)
);

CREATE TABLE Trainer
(
  License VARCHAR2(20) NOT NULL,
  Experience FLOAT NOT NULL,
  PersonId INT NOT NULL,
  PRIMARY KEY (PersonId),
  FOREIGN KEY (PersonId) REFERENCES Person(PersonId)
);

CREATE TABLE Gym_Member
(
  JoinDate DATE NOT NULL,
  LeaveDate DATE NOT NULL,
  PersonId INT NOT NULL,
  PRIMARY KEY (PersonId),
  FOREIGN KEY (PersonId) REFERENCES Person(PersonId)
);

CREATE TABLE Gym_Class_Medical_Constrains
(
  Medical_Constrains VARCHAR2(50) NOT NULL,
  ClassId INT NOT NULL,
  PRIMARY KEY (Medical_Constrains, ClassId),
  FOREIGN KEY (ClassId) REFERENCES Gym_Class(ClassId)
);

CREATE TABLE Person_Phone
(
  Phone VARCHAR2(20) NOT NULL,
  PersonId INT NOT NULL,
  PRIMARY KEY (Phone, PersonId),
  FOREIGN KEY (PersonId) REFERENCES Person(PersonId)
);

CREATE TABLE Gym_Member_Medical_Constrains
(
  MedicalConstrains VARCHAR2(50) NOT NULL,
  PersonId INT NOT NULL,
  PRIMARY KEY (MedicalConstrains, PersonId),
  FOREIGN KEY (PersonId) REFERENCES Gym_Member(PersonId)
);

CREATE TABLE Lesson
(
  LessonDay DATE NOT NULL,
  LessonHour DATE NOT NULL,
  LessonId INT NOT NULL,
  Rating FLOAT NOT NULL,
  ClassId INT NOT NULL,
  RoomNum INT NOT NULL,
  PersonId INT NOT NULL,
  PRIMARY KEY (LessonId, ClassId),
  FOREIGN KEY (ClassId) REFERENCES Gym_Class(ClassId),
  FOREIGN KEY (RoomNum) REFERENCES Room(RoomNum),
  FOREIGN KEY (PersonId) REFERENCES Trainer(PersonId)
);

CREATE TABLE Takes_Lesson
(
  LessonId INT NOT NULL,
  ClassId INT NOT NULL,
  PersonId INT NOT NULL,
  PRIMARY KEY (LessonId, ClassId, PersonId),
  FOREIGN KEY (LessonId, ClassId) REFERENCES Lesson(LessonId, ClassId),
  FOREIGN KEY (PersonId) REFERENCES Gym_Member(PersonId)
);
```
### הפעלת פקודות Description:
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/4e0e344e-bda2-47ca-b6b3-353eadf30069)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/ff488dbe-5bb9-4308-b4eb-fe552bcc0c5a)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/a72fb1d2-b7b1-4413-939c-5fb6a105ca3c)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/8e0ad917-7ed4-4aa9-a27c-703c9f67c954)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/f028d449-b7ee-4b96-9596-0b7508b8794a)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/18fdd636-feb1-43e9-bc48-3c6f7936d191)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/9928c246-1fcd-49b2-89bc-4bcf2c649b71)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/cfd0e628-d6d2-44ea-8f9f-a9e377f54ad4)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/1a367893-eb72-427b-86e1-f184195d4aa3)
![image](https://github.com/EsterNadler/DataBase-Project/assets/116155777/1a4485e7-5275-4745-89f7-b7effffee812)









