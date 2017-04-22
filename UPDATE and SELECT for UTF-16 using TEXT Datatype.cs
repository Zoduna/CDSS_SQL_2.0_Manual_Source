
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
	Console.WriteLine("zodunadb error while opening database"); 
	return; 
} 
bool result = _db.exec("CREATE TABLE table1 (col1 int, col2 TEXT)"); 
_db.begintransaction(); 
result = _db.exec("INSERT INTO table1 VALUES(2345, '\U0001F30D')"); 
_db.commit();
result = _db.exec("UDPATE SET col2='\U0001F30D\U0001F30D" WHERE col1 = 2345(); 
_db.commit();
result = _db.exec("SELECT col2 FROM table1"); 
_rs = _db.getresultset(); 
while (_rs.getnext() == ZodunaDBOO_Database.ZODUNADB_ROW) 
{ 
	string    text1 = _rs.gettext16(1); 
}
_rs.release(); 
_db.close();
