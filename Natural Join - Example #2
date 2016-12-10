
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
bool result = _db.exec("CREATE table table1 (col1 int)"); 
result = _db.exec("CREATE DATABASE db2"); 
result = _db.exec("CREATE SCHEMA db2.test"); 
result = _db.exec("CREATE table test.table2 (col1 int)");
result = _db.exec("CREATE INDEX idx1 ON table1(col1)");
result = _db.exec("CREATE INDEX idx2 ON test.table2(col2)");
_db.begintransaction(); 
result = _db.exec("INSERT into table1 values (5)");
result = _db.exec("INSERT into table1 values (7)");
result = _db.exec("INSERT into table1 values (9)");
result = _db.exec("INSERT into table1 values (11)");
result = _db.exec("INSERT into table1 values (15)");
result = _db.exec("INSERT into test.table2 values (3)");
result = _db.exec("INSERT into test.table2 values (5)");
result = _db.exec("INSERT into test.table2 values (11)");
result = _db.exec("INSERT into test.table2 values (17)");
result = _db.exec("INSERT into test.table2 values (19)");
_db.commit(); 
result = _db.exec("SELECT a.col1, b.col1 FROM table1 AS a NATURAL JOIN test.table2 b");
_rs = _db.getresultset(); 
while (_rs.getnext() == ZodunaDBOO_Database.ZODUNADB_ROW) 
{ 
	int	   int1 = _rs.getint(1); 
	int	   int2 = _rs.getint(2); 
	Console.WriteLine("zodunadb test col1 = " + int1 + ", col2 = " +
		int2);
}
_rs.release();
_db.close();
