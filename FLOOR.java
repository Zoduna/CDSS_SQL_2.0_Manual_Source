
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
boolean result = _db.exec("CREATE TABLE table1 (col1 int, col2 varchar(100))");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')");
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')");
_db.commit();
result = _db.exec("SELECT FLOOR(1.2) , FLOOR(1.5), FLOOR(3), FLOOR(-1.2), FLOOR(-1.5) from dumtab");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	int	int1 = _rs.getint(1);
	int	int2 = _rs.getint(2);
	int	int3 = _rs.getint(3);
	int	int4 = _rs.getint(4);
	int	int5 = _rs.getint(5);
	System.out.println("zodunadb test col1 = " + int1 + ", col2 = " + int2 + ", col3 = " + int3 + ", col4 = " + int4 + ", col5 = " + int5);
}
_rs.resultsetrelease();
_db.close();
