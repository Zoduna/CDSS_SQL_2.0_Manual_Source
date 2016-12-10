
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
_db.commit(); 
result = _db.exec("SELECT a.col1 AS 'x', a.col2 AS 'y' FROM table1 AS a"); 
_rs = _db.getresultset(); 
while (_rs.getnext() == ZodunaDBOO_Database.ZODUNADB_ROW) 
{ 
	int	   int1 = _rs.getint(1); 
	string    text1 = _rs.gettext(2); 
	Console.WriteLine("zodunadb test x = " + int1 + ", y = " + 
		text1);
}
_rs.release();
_db.close();
