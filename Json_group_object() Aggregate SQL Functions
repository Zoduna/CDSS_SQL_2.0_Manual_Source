
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
bool result = _db.exec("CREATE TABLE table1 (col1 VARCHAR(100), col2 VARCHAR(100))"); 
_db.begintransaction(); 
result = _db.exec("INSERT INTO table1 VALUES('abcd', '1234')"); 
result = _db.exec("INSERT INTO table1 VALUES('bcde', '2345')"); 
result = _db.exec("INSERT INTO table1 VALUES('cdef', '3456')"); 
_db.commit(); 
result = _db.exec("SELECT json_group_object(col1, col2) FROM table1"); 
_rs = _db.getresultset(); 
while (_rs.getnext() == ZodunaDBOO_Database.ZODUNADB_ROW) 
{ 
	string    text1 = _rs.gettext(1); 
	Console.WriteLine("zodunadb test json = " + 
		text1);
}
_rs.release();
_db.close(); 
