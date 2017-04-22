
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
boolean result = _db.exec("CREATE TABLE table1 (col1 int, col2 int)");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES(1234, 100)");
result = _db.exec("INSERT INTO table1 VALUES(2345, 200)");
_db.commit();
result = _db.exec("SELECT col1 + col1 AS 'aaa' FROM table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	int	   int1 = _rs.getint(1);
	System.out.println("zodunadb test aaa = " +  int1);
}
_rs.release();
_db.close();
