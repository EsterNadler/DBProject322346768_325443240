
[General]
Version=1

[Preferences]
Username=
Password=2281
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=MAROKO
Name=PERSON
Count=3

[Record]
Name=PERSONID
Type=NUMBER
Size=
Data=[9(8)]
Master=

[Record]
Name=BIRTHDATE
Type=DATE
Size=
Data=Random(01/01/1900,01/01/2024)
Master=

[Record]
Name=FIRSTNAME
Type=VARCHAR2
Size=20
Data=FirstName
Master=

[Record]
Name=LASTNAME
Type=VARCHAR2
Size=30
Data=LastName
Master=

[Record]
Name=CITY
Type=VARCHAR2
Size=30
Data=City
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=50
Data=list("abarbanel", "abba hillel silver", "abu hatseira", "achiezer", "admorei alexander",
=    "aharon dov", "aharonovitch", "ahavat shalom", "ahiya hashiloni", "ahronson",
=    "al-harizi", "alkalai", "alsheikh", "aluf hanizachon", "aluf simchoni",
=    "ami", "amiel", "amos", "anilevich", "aviad",
=    "avney nezer", "avodat israel", "avraham ben david", "avtalyon", "baal hatanya",
=    "baal shem tov", "bagano", "bar kokhba", "bar yohai", "baruch hirsch",
=    "beer mayim hayim", "beeri", "beit horon", "beit shammai", "beit yosef",
=    "ben arieh", "ben azay", "ben gurion", "ben ptachia", "ben zoma",
=    "bertanura", "bet hilel", "bialik", "bilu", "bin-nun",
=    "binyamin avraham", "borochov", "bradnshtetter", "bruriya", "chida",
=    "dakar", "damesek eliezer", "dangoor", "daniel", "david hamelekh",
=    "david pinkas", "derekh sheshet hayamim", "don yoseph nasi", "donnolo", "dov gruner",
=    "dov hoz", "dr. broyer", "dvora hanevia", "eli hacohen", "elisha",
=    "eliyahu hanavi", "elkabetz", "em hamoshavot", "emek jezreel", "eshel abraham",
=    "esther hamalka", "etzel", "ezra", "federman", "gaonei brisk",
=    "gerstenkorn", "giborei israel", "givat pinhas", "gnai gad", "gnishovski",
=    "gold", "golomb", "gordon", "gotlieb", "greenberg",
=    "haadmon minadvorna", "haadmor merojin", "haadmor mibelz", "haadmor migur", "haadmor mikotsk",
=    "haadmor mivishoy", "haadmor miznaz", "haadmormis spinka", "haahim meir", "haaliya hashniya",
=    "haarmor miradzymin", "habanim", "habarzel", "habayit")
Master=

[Record]
Name=HOUSENUM
Type=NUMBER
Size=
Data=Random(1,150)
Master=

[Record]
Name=EMAIL
Type=VARCHAR2
Size=40
Data=Email
Master=

[Record]
Name=GENDER
Type=VARCHAR2
Size=1
Data=list("M","F")
Master=

