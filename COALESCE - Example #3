
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
boolean result = _db.exec("CREATE TABLE table1 (col1 int, col2 varchar(100))");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES(12, 'abcd')");
result = _db.exec("INSERT INTO table1 (col2) VALUES('abcd')");
result = _db.exec("INSERT INTO table1 VALUES(12, 'abcd')");
result = _db.exec("INSERT INTO table1 VALUES(54, 'efgh')");
_db.commit();
result = _db.exec("SELECT COALESCE(NULL, 23, col1) AS 'col5' FROM table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	int	int1 = _rs.getint(1);
	System.out.println("zodunadb test col5 = " + 
		int1);
}
_rs.resultsetrelease();
_db.close();
