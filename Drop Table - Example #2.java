
//following classes should be imported
import com.zcds_sql_winjava.*;;



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
boolean result = _db.exec("CREATE TABLE table1 (col1 int, col2 VARCHAR(100))");
result = _db.exec("CREATE UNIQUE INDEX idx1 ON table1 (col1)");
result = _db.exec("CREATE  INDEX idx2 ON table1 (col2)");
result = _db.exec("CREATE TABLE table2 AS SELECT col1, col2 FROM table1");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')");
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')");
_db.commit();
result = _db.exec("SELECT col1, col2 FROM table1 WHERE col1 = 1234");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	int	   int1 = _rs.getint(1);
	String    text1 = _rs.gettext(2);
	System.out.println("zodunadb test col1 = " + int1 + ", col2 = " +
		text1);
}
_rs.release();
result = _db.exec("DROP TABLE IF EXISTS table1");
_db.close();
