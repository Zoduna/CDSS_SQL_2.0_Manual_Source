
//following classes should be imported
import com.zcds_sql_andrdjava.*;



//following should be used in the method where a DataStore is to be accessed
ZodunaDBSQL_Database _db; 
ZodunaDBSQL_ResultSet _rs; 
ZodunaDBSQL_Statement _stmt; 
_db = new ZodunaDBSQL_Database(this.getFilesDir().getPath() + this.getPackageName() + "/"); 
boolean isOpen = _db.open(null, null); //returns "true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
	System.out.println("zodunadb error while opening DataStore"); 
	return; 
}
boolean result = _db.exec("CREATE TABLE oldcustomers(col1 int, col2 int, col3 int, col4 int, col5 int, col6 VARCHAR(100))");
result = _db.exec("CREATE TABLE Customers(col1 int, col2 int, col3 int, col4 int, col5 int, col6 VARCHAR(100))");
result = _db.exec("CREATE UNIQUE INDEX idx1 ON oldcustomers (col1)");
result = _db.exec("CREATE UNIQUE INDEX idx2 ON Customers(col1)");
result = _db.exec("CREATE TABLE table1 (col1 int, col2 VARCHAR(100))");
_db.begintransaction();
result = _db.exec("INSERT INTO oldcustomers (1, 2, 3, 4, 5, 'abcd')");
result = _db.exec("INSERT INTO oldcustomers (2, 3, 4, 5, 6, 'bcde')");
result = _db.exec("INSERT INTO Customers AS SELECT col1, col2, col3, col4, col5, col6 FROM oldcustomers");
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
_rs.resultsetrelease();
_db.close();
