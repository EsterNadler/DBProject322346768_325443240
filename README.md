# מיני פרויקט בבסיסי נתונים- ניהול מערכת שיעורים במכון כושר
מגישות: אסתר נדלר-איצקוביץ וצפורה מארוקו

## תיאור כללי 
המערכת שלנו עוסקת בניהול מערכת המידע של קורסים ושיעורים במכון כושר, וכוללת את הישויות הבאות: מדריכים, מתאמנים, קורסים (כגון פילאטיס, אירובי), שיעורים (שיהוו מפגש של קורס מסוים) וכן את החדר הפיזי אליו משויך השיעור. בהמשך נציג שאילתות שונות שיעזרו לנו לדלות מידע מהנתונים וכן לערוך שינויים על הטבלאות הקיימות.

## תוכן עניינים
- [שלב א](#שלב-א)
  - [דיאגרמת ERD](#דיאגרמת-erd)
  - [דיאגרמת DSD](#דיאגרמת-dsd)
  - [תוכן קובץ ה-CreateTables](#תוכן-קובץ-ה-createtables)
  - [הפעלת פקודות DESC](#הפעלת-פקודות-description)
  - [ייבוא נתונים](#ייבוא-נתונים)
    - [ייבוא נתונים מקובץ טקסט](#ייבוא-נתונים-מקובץ-טקסט)
    - [הכנסת נתונים ע"י Data Generator](#הכנסת-נתונים-עי-data-generator)
    - [הכנסת נתונים ע"י תוכנית Python](#הכנסת-נתונים-עי-תוכנית-python)
  - [יצירת קובץ הגיבוי](#יצירת-קובץ-הגיבוי)
- [שלב ב](#שלב-ב)
  - [הרצת השאילתות](#הרצת-השאילתות)
    - [הרצת שאילתות ללא פרמטרים](#הרצת-שאילתות-ללא-פרמטרים)
    - [הרצת שאילתות עם פרמטרים](#הרצת-שאילתות-עם-פרמטרים)
    - [הרצת שאילתות עדכון](#הרצת-שאילתות-עדכון)
    - [הרצת שאילתות מחיקה](#הרצת-שאילתות-מחיקה)
  - [הוספת constrains](#הוספת-constrains)
- [שלב ג](#שלב-ג)
  - [תוכנית א](#תוכנית-א)
    - [תיאור התוכנית](#תיאור-התוכנית)
    - [קוד התוכנית](#קוד-התוכנית)
    - [הרצת התוכנית](#הרצת-התוכנית)
  - [תוכנית ב](#תוכנית-ב)
    - [תיאור התוכנית](#תיאור-התכנית)
    - [קוד התוכנית](#קוד-התכנית)
    - [הרצת התוכנית](#הרצת-התכנית)


## שלב א 

### דיאגרמת ERD
![1דיאגרמה](https://github.com/EsterNadler/DataBase-Project/assets/116155777/736b99a2-40f8-4dab-8653-52c03f412ab9)

### דיאגרמת DSD
![2דיאגרמה](https://github.com/EsterNadler/DataBase-Project/assets/116155777/1d3dc8c2-b440-410f-8765-046a4418abf9)

### תוכן קובץ ה CreateTables:
```sql
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

## ייבוא נתונים
### ייבוא נתונים מקובץ טקסט:
-----------לטבלה ROOM-----------
קובץ הטקסט:  
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/31001be1-07ee-4318-9499-d582967315dc)

קובץ ה Importer:  
![צילום מסך 2024-05-25 210951](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/6d1ea58d-35c0-404f-bf9c-cb8b73f6bab6)

### הכנסת נתונים ע"י Data Generator:
--------לטבלה PERSON----------  
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/c32fe676-113e-4802-a2a6-df156c4e62e7)

--------לטבלה TRAINER---------  
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/b99c730b-8fdb-4ce4-b348-0d534b4191db)

-------לטבלה MEMBER_MEDICAL_CONSTRAINS--------  
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/31689c49-fcb4-4c2f-b1e4-8c221113c65c)

-------לטבלה CLASS_MEDICAL_CONSTRAINS--------  
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/cba7355f-c2ba-4474-be33-a78923ba4baa)

---------------לטבלה LESSON---------------  
![צילום מסך 2024-05-27 201635](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/6f3a01c9-a32c-45f0-9d4a-9caf970ab202)

-------לטבלה PERSON_PHONE--------  
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/7f21812f-00c4-4696-a005-d84c2d4d92bb)

### הכנסת נתונים ע"י תוכנית Python: 
-------עבור הטבלה COURSES---------  
הרצת התוכנית שמייצרת את פקודות הINSERT:  
![צילום מסך 2024-05-27 121645](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/66d30f73-ac43-48a6-86f2-0552557f4b57)

הקובץ המתקבל:  
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/352a4cd5-d879-4266-8ae0-8eb4a4fa6b2b)

------עבור הטבלה TAKES_LESSON---------  
הרצת התוכנית שמייצרת את פקודות הINSERT:  
(עבור המפתחות הזרים השתמשנו בייבוא נתונים מקבצי CSV שיצרנו באמצעות שאילתות מתאימות)  
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/37e8a0ee-e29e-4785-86a2-80afd130334f)

הקובץ המתקבל:  
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/7bfa5519-f637-4edd-98ca-3edab6d8c6d9)

------עבור הטבלה ROOMS---------  
הרצת התוכנית שמייצרת את קובץ הטקסט:  
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/6afad479-1dfc-4e1e-9b19-3bdd07e9032c)

הקובץ המתקבל:  
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/cd101a78-b3ac-4c18-9b45-cea699627da9)

## יצירת קובץ הגיבוי:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/fa4fd4b3-460e-429b-8d52-57647c84bab3)

### שחזור קובץ הגיבוי:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/87d94d92-8f1f-4896-a6c3-470c4eaf2699)

## שלב ב

## הרצת השאילתות
### הרצת שאילתות ללא פרמטרים
  - שאילתא למציאת כל השיעורים שהשתתפו בהם 6 משתתפים או יותר ופרטי כל שיעור:
    ![צילום מסך 2024-06-09 135709](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/189fdbd8-a768-4100-bcff-6f7737b1dc01)
  - שאילתא למציאת כל החברים במכון הכושר שהשתתפו לפחות בשיעור אחד מכל כיתה: (החברים המצטיינים)
    ![צילום מסך 2024-06-09 135742](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/fdaa260c-1565-484f-a57e-3d3c2bb9c039)
  - שאילתא למציאת כל הסדנאות שדירוגן הממוצע זהה או קטן מדירוג כל המאמנים שמעבירים את אותה סדנא:
    ![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/167e310b-e906-444d-842e-fcca58971192)
  - שאילתא למציאת מספר המאמנים בכל רמת נסיון:
![צילום מסך 2024-06-09 124931](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/aeecbeaa-9328-49be-ae6b-ce2432af5e60)

### הרצת שאילתות עם פרמטרים
- שאילתא להצגת המשתתפים שיש להם יום הולדת בחודש הנבחר והשתתפו לפחות בשיעור אחד בשנה החולפת:
  - הרצה:
![צילום מסך 2024-06-09 125047](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/7f29a1a1-4c31-4602-bbb1-2e9ae2314d78)
  - תוצאה:
  ![צילום מסך 2024-06-09 125239](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/af5d2762-e572-4922-b9dd-04144e166360)
- שאילתא להצגת מספר השיעורים שמאמן מסוים העביר בחודש ספציפי:
  - הרצה:
![צילום מסך 2024-06-09 130048](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/43d48110-8b31-4582-82fd-b0522bd442c7)
  - תוצאה:
![צילום מסך 2024-06-09 130119](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/78c0928a-7550-436e-87df-eca7a8b387ff)
- שאילתא להצגת כל הסדנאות המתאימות לטווח גילאים מסויים:
  - הרצה:
![צילום מסך 2024-06-09 130236](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/45e7c59a-f86a-40d3-982c-6dc3673edd83)
  - תוצאה:
![צילום מסך 2024-06-09 130324](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/04ac770a-b55a-431b-8ea4-956fe4a68fb7)
- שאילתא להצגת השיעורים שנערכו בתאריך מסויים ואת מספר המשתתפים בכל שיעור:
  - הרצה:
![צילום מסך 2024-06-09 130324](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/0e779c90-7ab3-47de-a224-d3cbb1c39f12)
  - תוצאה:
![צילום מסך 2024-06-09 130641](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/77a8dd36-e20f-4a60-834a-b67d427fe421)

### הרצת שאילתות עדכון
- שאילתא לעדכון (הגדלת) נסיון המאמנים שהעבירו לפחות שיעור אחד בשנה החולפת:
 ![צילום מסך 2024-06-09 140429](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/49566749-2324-4d77-8d77-4f7a4d6bf0d6)
  - בסיס הנתונים לפני העדכון:
![צילום מסך 2024-06-09 140332](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/5057b5eb-2af8-418a-8620-e92afab1a302)
  - בסיס הנתונים אחרי העדכון:
![צילום מסך 2024-06-09 140540](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/64a431b1-fb0e-4e77-af8c-ded4c8f27d33)

- שאילתא לעדכון תאריך העזיבה של החברים שלא השתתפו באף שיעור בשנה החולפת לתאריך הנוכחי:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/5c00a790-b46e-4d7a-9f04-5ec20f92adbf)
  - בסיס הנתונים לפני העדכון:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/ab082430-672e-42c5-ad76-c85bee908d93)
  - בסיס הנתונים אחרי העדכון:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/556b199c-a1c4-490a-a2ae-71910545cb4a)

### הרצת שאילתות מחיקה
- שאילתא למחיקת מאמנים עם פחות משנה נסיון שלא העבירו שום שיעור בשנה האחרונה:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/f3cf1e82-6c76-4a0e-bfde-cc38419b8c37)
  - בסיס הנתונים לפני העדכון:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/2f8893df-130b-4e43-9db0-fb2e4bd90884)
  - בסיס הנתונים אחרי העדכון:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/64787287-afa9-444d-8e82-daf782e0612b)

- שאילתא למחיקת המשתתפים שעזבו לפני שנתיים או יותר ולא הצטרפו מאז:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/04060c10-12cc-4702-a478-d4274e7b2c04)
  - בסיס הנתונים לפני העדכון:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/8e94f07a-9d2b-43e0-b8df-2e4ddd98dfd4)
  - בסיס הנתונים אחרי העדכון:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/c9ed1d80-2094-47d7-9f14-286d90f9c517)

## הוספת constrains
- תנאי לבדיקה שגיל המינימום לסדנא קטן מגיל המקסימום:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/2f4748a9-be09-4e29-b6c3-b11f1b86a6d4)
 - הפרת התנאי:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/7043e1a2-d65c-4184-98d8-3c0c0de361a0)

- תנאי להשמת ערך ברירת מחדל "Unknown" במקרה ולא הוכנס ערך לשדה עיר:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/cbf81699-753c-49f7-a9d3-61f5fdd8cd59)
 - ביצוע התנאי:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/cda90164-cce5-4dc6-8ed7-15ce3f009d03)

- תנאי לבדיקה שסוג החדר בטבלת ROOM אינו NULL:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/d2ecd492-e7f0-4a0e-a745-3de4b4a4de90)
- הפרת התנאי:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/98e2b3c2-77d8-4159-aa1a-901ea800c916)
 
## שלב ג
## תוכנית א
### תיאור התוכנית
תוכנית זו מיועדת לרישום מתאמן לקורס מסוים ביום מסוים. התכנית קוראת לפונקציה שמוודאת שלמשתתף אין הגבלת גיל או מגבלה רפואית המתנגשת עם מגבלה רפואית שמהווה הגבלה לרישום לקורס, אם אין פונה לפרוצדורה שמוסיפה את המשתתף לשיעור באותו יום (אם קיים כזה שיעור בתפוסה לא מלאה).
### קוד התוכנית
#### התוכנית הראשית:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/b9a6cacb-c468-4f02-ba70-485c8e1a9f68)
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/690066e2-7790-4472-a383-45b42cf4302f)

- פונקציה לבדיקת התאמת הגיל ואי חפיפה של המגבלות הרפואיות:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/7e57364c-d412-4624-89a3-9dfc4335a6bd)
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/0db75f82-b139-4538-9fd0-b4d5d0e6bf3e)

- פרוצדורה להוספת המתאמן לשיעור שתפוסתו אינה מלאה:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/b25824e1-7525-49e3-9939-9277677fb453)
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/baaa0bef-d815-4dc5-8d3d-c787adc65c7c)

### הרצת התוכנית
- הנתונים לפני ביצוע הטסט:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/2c65b7e1-293a-4b80-945e-3e0acb1e765b)
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/660c6bfb-f8ad-40e5-a57d-71a8f882c9be)
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/c0b21390-3394-467d-800b-73ece0349e4b)
- הרצת הטסט:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/24f1a0a2-1785-4e76-b306-51afa8432f7e)
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/278f4255-2fd2-4944-981e-63d54bda2124)
- בסיס הנתונים לאחר ביצוע הטסט:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/9583534c-56d8-4bb7-86e9-49cef3c5e568)

## תוכנית ב
### תיאור התכנית
תוכנית זו מיועדת למקרה שמאמן נצרך לקחת יום מחלה או חופשה. התכנית תקרא לפרוצדורה שתעבור על כל השיעורים של אותו מאמן לאותו תאריך ותבדוק ע"י קריאה לפונקציה האם קיים מאמן פנוי היכול להחליף את המאמן הנ"ל, אם קיים הפרוצדורה תעדכן את בסיס הנתונים בהתאם (תחליף את המאמן בשיעורים הרלוונטים) אם לא נמצאו מאמניים חלופיים לכל השיעורים של אותו מאמן, לא יתאפשר למאמן להיעדר באותו יום.
### קוד התכנית
- התוכנית הראשית:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/7866db9c-8aaa-426c-8062-ff50fb4dd606)

- פרוצדורה למציאת ועדכון כל שיעורי המאמן באותו תאריך:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/8006549f-f06f-4e3a-831a-e1e5c9c6aef6)
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/6fe36eb4-fac6-46ac-bcae-d053bf60d3fe)
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/8b5e9bb9-c7ac-45bb-aba1-71b682490578)
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/1866ff8d-4d94-4368-bbcf-38a174f65d9b)

- פונקציה למציאת מאמן זמין עבור ההחלפה:
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/29897e30-466f-4a6b-89a8-a96cbbd487e3)
![image](https://github.com/EsterNadler/DBProject322346768_325443240/assets/116155777/930578d1-8d3d-49d2-ab5f-0741602c14c7)

### הרצת התכנית
