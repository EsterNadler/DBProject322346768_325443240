
[General]
Version=1

[Preferences]
Username=
Password=2950
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=GYM_MEMBER
Count=100

[Record]
Name=JOINDATE
Type=DATE
Size=
Data=Random(01/01/2000,01/06/2025)
Master=

[Record]
Name=LEAVEDATE
Type=DATE
Size=
Data=NULL
Master=

[Record]
Name=PERSONID
Type=NUMBER
Size=
Data=list(select personId from Person)
Master=

