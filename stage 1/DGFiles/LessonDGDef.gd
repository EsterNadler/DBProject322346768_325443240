
[General]
Version=1

[Preferences]
Username=
Password=2278
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=LESSON
Count=500

[Record]
Name=LESSONDAY
Type=DATE
Size=
Data=Random(01/01/2000,01/01/2025)
Master=

[Record]
Name=LESSONHOUR
Type=DATE
Size=
Data=SELECT CURTIME();
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
Size=22
Data=Random(1,10)
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
Data=list(select personId from Trainer)
Master=

