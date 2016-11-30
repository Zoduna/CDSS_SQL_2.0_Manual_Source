
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
boolean result = _db.exec("CREATE TABLE table1 (col1 VARCHAR(100), col2 VARCHAR(100))");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES('abcd', '1234')");
result = _db.exec("INSERT INTO table1 VALUES('bcde', '2345')");
result = _db.exec("INSERT INTO table1 VALUES('cdef', '3456')");
_db.commit();
result = _db.exec("SELECT json_group_object(col1, col2) FROM table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	System.out.println("zodunadb test json = " + 
		text1);
}
_rs.release();
_db.close();
