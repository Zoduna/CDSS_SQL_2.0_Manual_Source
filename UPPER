
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
result = _db.exec("SELECT UPPER('ABC') AS 'col1', upper('abc') AS 'col2', upper('123') AS 'col3' from dumtab ");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	String    text2 = _rs.gettext(2);
	String    text3 = _rs.gettext(3);
	System.out.println("zodunadb test col1 = " + text1 + " , col2 = " + text2 + ", col3 = " +
		text3);
}
_rs.release();
_db.close();
