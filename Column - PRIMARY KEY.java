
//following classes should be imported
import com.zcds_sql_osxjava.*;



//following should be used in the method where DataStore is to be accessed
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
boolean result = _db.exec("CREATE TABLE table1 (col1 int NOT NULL PRIAMRY KEY, col2 VARCHAR(100))");
result = _db.exec("CREATE TABLE table2(col1 int NOT NULL, col2 int NOT NULL, col3 VARCHAR(100), PRIMARY KEY (col1, col2))");
result = _db.exec("CREATE TABLE table3(col1 int NOT NULL, col2 int NOT NULL, col3 VARCHAR(100), PRIMARY KEY (col1, col2) ON CONFLICT ROLLBACK)");
_db.close();
