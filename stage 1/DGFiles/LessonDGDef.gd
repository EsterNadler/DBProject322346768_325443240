
[General]
Version=1

[Preferences]
Username=
Password=2538
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=LESSON
Count=700

[Record]
Name=LESSONDATE
Type=DATE
Size=
Data=Random(01/01/2000 00:00:00, 01/01/2025 23:59:59)
Master=

[Record]
Name=LESSONID
Type=NUMBER
Size=
Data=Sequence(Start, [Inc], [WithinParent])
Master=

[Record]
Name=RATING
Type=FLOAT
Size=4
Data=Random(5,10)
Master=

[Record]
Name=CLASSID
Type=NUMBER
Size=
Data=list(select classId from GYM_CLASS)
Master=

[Record]
Name=ROOMNUM
Type=NUMBER
Size=
Data=list(select roomNum from ROOM)
Master=

[Record]
Name=PERSONID
Type=NUMBER
Size=
Data=list(select PersonId from Person)
Master=

