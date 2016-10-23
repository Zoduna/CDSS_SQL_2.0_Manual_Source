
//following should be used as include
using ZodunaCDBCSharpWrapper;



//following should be used in the method where DataStore is to be accessed
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

_stmt = _db.prepare("SELECT col1 FROM table1 WHERE col1 > ?");
_stmt.bind_int(1, 1000);
while (_stmt.step() == ZodunaDBOO_Database.ZODUNADB_ROW)
{
	int	col1value = _stmt.column_int(0);
	Console.WriteLine("zodunadb test ...... col1 value = " + col1value);
}
_stmt.finalize();
_db.close();
