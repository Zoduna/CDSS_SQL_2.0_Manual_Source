
//following classes should be imported
import com.zcds_sql_winjava.*;;



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
boolean result = _db.exec("CREATE TABLE table1 (col1 int, col2 varchar(100))");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')");
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')");
_db.commit();

_stmt = _db.prepare("SELECT col1 FROM table1 WHERE col1 > ?");
_stmt.bind_int(1, 1000);
while (_stmt.step() ==ZodunaDBSQL_Database.ZODUNADB_ROW)
{
	int	col1value = _stmt.column_int(0);
	System.out.println("zodunadb test ...... col1 value = " + col1value);
}
_stmt.finalize();
_db.close();
