
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
boolean result = _db.exec("CREATE TABLE table1 (col1 int, col2 varchar(100))");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')");
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')");
_db.commit();
result = _db.exec("SELECT TIME('23:23:23') from dumtab");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	System.out.println("zodunadb test col1 = " +
		text1);
}
_rs.release();
result = _db.exec("SELECT TIME('23:23:23', 'start of day') from dumtab");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	System.out.println("zodunadb test col1 = " +
		text1);
}
_rs.release();
result = _db.exec("SELECT TIME('23:23:23', '1 seconds', '2 minutes', '1 hours') from dumtab");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	System.out.println("zodunadb test col1 = " +
		text1);
}
_rs.release();
result = _db.exec("SELECT TIME('23:23:23', '-1 seconds', '-2 minutes', '-1 hours') from dumtab");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	System.out.println("zodunadb test col1 = " +
		text1);
}
_rs.release();
_db.close();
