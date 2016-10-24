
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
boolean result = _db.exec("CREATE TABLE table1 (col1 long, col2 varchar(100))");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES(542, '225.567')");
_db.commit();
result = _db.exec("SELECT CAST(col1, "byte") AS 'col1' from table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	int	int1 = _rs.getint(1);
	System.out.println("zodunadb test col1 = " + 
		int1);
}
_rs.release();
result = _db.exec("SELECT CAST(col2, "int") AS 'col1' from table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	int	int1 = _rs.getint(1);
	System.out.println("zodunadb test col1 = " + 
		int1);
}
_rs.release();
_db.close();
