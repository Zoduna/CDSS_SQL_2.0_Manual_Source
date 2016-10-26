
//following classes should be imported
import com.zcds_sql_osxjava.*;



//following should be used in the method where a DataStore is to be accessed
ZodunaDBSQL_Database _db; 
ZodunaDBSQL_ResultSet _rs; 
ZodunaDBSQL_Statement _stmt; 
_db = new ZodunaDBSQL_Database("testfolder/"); 
boolean isOpen = _db.open(null, null); //returns "true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
	System.out.println("zodunadb error while opening DataStore"); 
	return; 
}
boolean result = _db.exec("CREATE TABLE table1 (col1 VARCHAR(100), col2 int)");
result = _db.exec("CREATE UNIQUE INDEX idx1 ON table1 (col2)");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES('abcd', 17)");
result = _db.exec("INSERT INTO table1 VALUES('efgh', 199)");
result = _db.exec("INSERT INTO table1 VALUES('mnop', 24)");
result = _db.exec("UPDATE table1 SET col1 = 'test', col2 = 55 WHERE col2 > 20");
result = _db.exec("UPDATE OR ABORT table1 SET col1 = 'test', col2 = 55 WHERE col2 > 20");
_db.commit();
result = _db.exec("SELECT col2, col1 FROM table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	int	   int1 = _rs.getint(1);
	String    text1 = _rs.gettext(2);
	System.out.println("zodunadb test col1 = " + int1 + ", col2 = " +
		text1);
}
_rs.resultsetrelease();
_db.close();
