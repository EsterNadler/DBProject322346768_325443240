
[General]
Version=1

[Preferences]
Username=
Password=2880
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=TAKES_LESSON
Count=10..20

[Record]
Name=LESSONID
Type=NUMBER
Size=
Data=list(select lessonId from Lesson)
Master=

[Record]
Name=CLASSID
Type=NUMBER
Size=
Data=list(select classId from GYM_CLASS)
Master=

[Record]
Name=PERSONID
Type=NUMBER
Size=
Data=list(select personId from person)
Master=

