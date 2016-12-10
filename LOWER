
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
result = _db.exec("SELECT LOWER('ABC') AS 'col1', LOWER('abc') AS 'col2', LOWER('123') AS 'col3' from dumtab "); 
_rs = _db.getresultset(); 
while (_rs.getnext() == ZodunaDBOO_Database.ZODUNADB_ROW) 
{ 
	string    text1 = _rs.gettext(1); 
	string    text2 = _rs.gettext(2); 
	string    text3 = _rs.gettext(3); 
	Console.WriteLine("zodunadb test col1 = " + text1 + ", col2 = " + text2 + ", col3 = " +
		text3);
}
_rs.release();
_db.close(); 
