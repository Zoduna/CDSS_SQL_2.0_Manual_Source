
//following should be used as include
using ZodunaCDBCSharpWrapper;



//following should be used in the method where the DataStore is to be accessed
ZodunaDBOO_Database _db; 
IZodunaDBOO_ResultSet _rs; 
IZodunaDBOO_Statement _stmt; 
int		rc = 0;

_db = new ZodunaDBOO_Database("testfolder/");

//use createadminuser only when creating the DataStore
rc = _db.createadminuser("testfolder/", "master", "master", ZodunaDBOO_Database. ZODUNADB_ENCRYPTION_AES_128 ,"key for encryption");

//used every time to create/open encrypted DataStore
bool isOpen = _db.open_encrypted("master" ,"master", ZodunaDBOO_Database. ZODUNADB_ENCRYPTION_AES_128, "key for encryption"); //returns "true" if successful and "false" if the command fails.
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
_rs.releaseResult Set();
_db.close();
