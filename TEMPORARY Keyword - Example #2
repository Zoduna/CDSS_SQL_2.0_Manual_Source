
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
bool result = _db.exec("CREATE DATABASE db1"); 
result = _db.exec("CREATE SCHEMA db1.test1"); 
result = _db.exec("ATTACH db1.test1 AS test"); 
result = _db.exec("CREATE TABLE table1 (col1 int, col2 VARCHAR(100))"); 
result = _db.exec("CREATE UNIQUE INDEX idx1 ON table1 (col1)");
result = _db.exec("CREATE  INDEX idx2 ON table1 (col2)");
result = _db.exec("CREATE TEMP TABLE table2 (col1 int, col2 VARCHAR(100))");
result = _db.exec("CREATE TEMPORARY TABLE table3 (col1 int, col2 VARCHAR(100))");
result = _db.exec("CREATE TEMP TABLE IF NOT EXISTS table4 (col1 int, col2 VARCHAR(100))");
_db.begintransaction(); 
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')"); 
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')"); 
_db.commit(); 
result = _db.exec("CREATE TEMPORARY TABLE table5 AS SELECT col1, col2 FROM table1"); 
_db.close();
