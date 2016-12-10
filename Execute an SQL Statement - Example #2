
Anything other than "true" in result means an error has happened and execution of SQL statement is unsuccessful. The above statement will never create a Result Set.
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
result = _db.exec("SELECT * FROM table1"); 
_rs = _db.getresultset(); 
while (_rs.getnext() == ZodunaDBOO_Database.ZODUNADB_ROW) 
{ 
	int        column_type = _rs.getcolumntype(1); 
	string    column_name = _rs.getcolumnname(1); 
	int        column_type_2 = _rs.getcolumntype(2); 
	string    column_name_2 = _rs.getcolumnname(2); 

	int        int1 = _rs.getint(1); 
	string    text1 = _rs.gettext(2); 
	Console.WriteLine("zodunadb test column 1.... type = " + column_type + ", name = " + column_name + ",  intvalue = " + int1); 
	Console.WriteLine("zodunadb test column 2.... type = " + column_type_2 + ", name = " + column_name_2 + ",  textvalue = " + text1);
}
_rs.release();
_db.close(); 

