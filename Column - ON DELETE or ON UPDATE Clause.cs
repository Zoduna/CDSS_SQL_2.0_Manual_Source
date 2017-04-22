
//following should be used as include
using ZodunaCDBCSharpWrapper;



//following should be used in the method where a DataStore is to be accessed
ZodunaDBOO_Database _db; 
ZodunaDBOO_ResultSet _rs; 
ZodunaDBOO_Statement _stmt; 
_db = new ZodunaDBOO_Database("testfolder/"); 
bool isOpen = db.open(); //returns "true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
	Console.WriteLine("zodunadb error while opening DataStore"); 
	return; 
}
bool result = _db.exec("CREATE TABLE table1 (col1 int, col2 VARCHAR(100))"); 
result = _db.exec("CREATE TABLE table2 (col1 byte, col2 short, col3 int, col4 long, col5 float, col6 double)"); 
result = _db.exec("CREATE TABLE table3 (col1 VARCHAR(100), col2 blob)"); 
result = _db.exec("CREATE TABLE table4 (col1 int NOT NULL, col2 VARCHAR(100), PRIMARY KEY(col1))"); 
result = _db.exec("CREATE TABLE table5 (col1 int, col2 VARCHAR(100), UNIQUE(col1))"); 
result = _db.exec("CREATE TABLE table6 (col1 int autoincrement, col2 VARCHAR(100))"); 
result = _db.exec("CREATE TABLE table7 (col1 int , col2 VARCHAR(100), CHECK col1 > 200)"); 
result = _db.exec("CREATE TABLE table6 (col1 int DEFAULT 100, col2 VARCHAR(100) DEFAULT 'abcd')"); 
result = _db.exec("CREATE TABLE table8 (col1 date, col2 time, col3 timestamp DEFAULT CURRENT_TIMESTAMP)"); 
result = _db.exec("CREATE table table10 (col1 int not null, primary key (col1), constraint key_check check (col1 > 10)"); 
result = _db.exec("CREATE table table20 (col2 int, constraint key_reference foreign key (col2) references table10 (col1) on delete cascade on update cascade)"); 
result = _db.exec("CREATE table table30 (col2 int, constraint key_reference foreign key (col2) references table10 (col1) on delete SET NULL on update cascade)"); 
result = _db.exec("CREATE table table40 (col2 int, constraint key_reference foreign key (col2) references table10 (col1) on delete SET DEFAULT on update cascade)"); 
result = _db.exec("CREATE table table20 (col2 int, constraint key_reference foreign key (col2) references table10 (col1) on delete  NO ACTION on update cascade)"); 
_db.begintransaction(); 
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')"); 
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')"); 
_db.commit(); 
result = _db.exec("SELECT col1, col2 FROM table1 WHERE col1 = 1234"); 
_rs = _db.getresultset(); 
while (_rs.getnext() == ZodunaDBOO_Database.ZODUNADB_ROW) 
{ 
	int	   int1 = _rs.getint(1); 
	string    text1 = _rs.gettext(2); 
	Console.WriteLine("zodunadb test col1 = " + int1 + ", col2 = " + 
		text1);
}
_rs.release();
_db.close();
