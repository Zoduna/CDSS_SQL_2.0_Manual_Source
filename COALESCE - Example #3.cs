
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
result = _db.exec("INSERT INTO table1 VALUES(12, 'abcd')"); 
result = _db.exec("INSERT INTO table1 (col2) VALUES('abcd')"); 
result = _db.exec("INSERT INTO table1 VALUES(12, 'abcd')"); 
result = _db.exec("INSERT INTO table1 VALUES(54, 'efgh')"); 
_db.commit(); 
result = _db.exec("SELECT COALESCE(NULL, 23, col1) AS 'col5' FROM table1");
_rs = _db.getresultset(); 
while (_rs.getnext() == ZodunaDBOO_Database.ZODUNADB_ROW) 
{ 
	int	int1 = _rs.getint(1); 
	Console.WriteLine("zodunadb test col5 = " + 
		int1);
}
_rs.release();
_db.close(); 
