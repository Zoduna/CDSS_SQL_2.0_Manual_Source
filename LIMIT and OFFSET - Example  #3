
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
bool result = _db.exec("CREATE TABLE table1 (col1 int, col2 varchar(100))"); 
_db.begintransaction(); 
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')"); 
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')"); 
result = _db.exec("INSERT INTO table1 VALUES(12341, 'abcd1')"); 
result = _db.exec("INSERT INTO table1 VALUES(23451, 'efgh1')"); 
result = _db.exec("INSERT INTO table1 VALUES(12342, 'abcd2')"); 
result = _db.exec("INSERT INTO table1 VALUES(23452, 'efgh2')"); 
result = _db.exec("INSERT INTO table1 VALUES(12343, 'abcd3')"); 
result = _db.exec("INSERT INTO table1 VALUES(23453, 'efgh3')"); 
result = _db.exec("INSERT INTO table1 VALUES(12344, 'abcd4')"); 
result = _db.exec("INSERT INTO table1 VALUES(23454, 'efgh4')"); 
result = _db.exec("INSERT INTO table1 VALUES(12345, 'abcd5')"); 
result = _db.exec("INSERT INTO table1 VALUES(23455, 'efgh5')"); 
result = _db.exec("INSERT INTO table1 VALUES(12346, 'abcd6')"); 
result = _db.exec("INSERT INTO table1 VALUES(23456, 'efgh6')"); 
_db.commit(); 
result = _db.exec("SELECT col1, col2 FROM table1 OFFSET 10 LIMIT 20"); 
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
