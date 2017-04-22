
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
bool result = _db.exec("CREATE table t1 (col1 int, col2 varchar(10))"); 
result = _db.exec("CREATE table t2 (col1 int, col2 varchar(10))");

_db.begintransaction(); 
result = _db.exec("INSERT into t1 values (22, 'mmmmmm1')");
result = _db.exec("INSERT into t1 values (11, 'mmmmmm2')");
result = _db.exec("INSERT into t2 (col1, col2) values (55, NULL)");
result = _db.exec("INSERT into t2 values (33, 'pppppp1')");
result = _db.exec("INSERT into t2 values (44, 'pppppp2')");
result = _db.exec("INSERT into t2 values (44, 'wwwww1')");
result = _db.exec("INSERT into t2 values (66, 'wwwww2')");
result = _db.exec("INSERT into t1 values (66, 'mmmmmm3')");
_db.commit(); 
result = _db.exec("SELECT col2, col1 FROM t1 ORDER BY col2");
_rs = _db.getresultset(); 
while (_rs.getnext() == ZodunaDBOO_Database.ZODUNADB_ROW) 
{ 
	int	   int1 = _rs.getint(2); 
	string    text1 = _rs.gettext(1); 
	Console.WriteLine("zodunadb test col1 = " + int1 + ", col2 = " + 
		text1);
}
_rs.release();
result = _db.exec("SELECT col2, col1 FROM t1 ORDER BY col2, col1");
_rs = _db.getresultset(); 
while (_rs.getnext() == ZodunaDBOO_Database.ZODUNADB_ROW) 
{ 
	int	   int1 = _rs.getint(2); 
	string    text1 = _rs.gettext(1); 
	Console.WriteLine("zodunadb test col1 = " + int1 + ", col2 = " + 
		text1);
}
_rs.release();
_db.close();
