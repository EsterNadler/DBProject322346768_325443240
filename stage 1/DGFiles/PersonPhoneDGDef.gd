
[General]
Version=1

[Preferences]
Username=
Password=2871
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=PERSON_PHONE
Count=3

[Record]
Name=PHONE
Type=VARCHAR2
Size=20
Data=['05'9'-'9(7)]
Master=

[Record]
Name=PERSONID
Type=NUMBER
Size=
Data=list(select personId from Person)
Master=

