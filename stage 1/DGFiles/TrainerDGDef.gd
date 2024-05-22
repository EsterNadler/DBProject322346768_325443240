
[General]
Version=1

[Preferences]
Username=
Password=2509
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=TRAINER
Count=200

[Record]
Name=LICENSE
Type=VARCHAR2
Size=20
Data=[9(4)'-'9(4)]
Master=

[Record]
Name=EXPERIENCE
Type=FLOAT
Size=22
Data=random(0,40)
Master=

[Record]
Name=PERSONID
Type=NUMBER
Size=
Data=list(select personId from Person)
Master=

