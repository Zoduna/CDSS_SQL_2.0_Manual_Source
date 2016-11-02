
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
	System.out.println("zodunadb error while opening database"); 
	return; 
} 
boolean result = _db.exec("CREATE TABLE table1 (col1 int, col2 NVARCHAR(100))");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES(1234, '\u00E9')");
_db.commit();
result = _db.exec("UDPATE SET col2='\u00E9\u00E9" WHERE col1 = 1234();
_db.commit();
result = _db.exec("SELECT col2 FROM table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext16(1);
}
_rs.resultsetrelease();
_db.close();
