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
  LeaveDate DATE,
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
  LessonDate DATE NOT NULL,
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
