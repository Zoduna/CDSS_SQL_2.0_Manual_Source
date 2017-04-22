
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
boolean result = _db.exec("CREATE TABLE table1 (col1 DATE)");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES('2012-05-31')");

_db.commit();
result = _db.exec("SELECT ADDDAYS(col1, 5) AS 'col1' from table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	System.out.println("zodunadb test col1 = " +
		text1);
}
_rs.resultsetrelease();
result = _db.exec("SELECT ADDDAYS(col1, -5) AS 'col1' from table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	System.out.println("zodunadb test col1 = " +
		text1);
}
_rs.resultsetrelease();
result = _db.exec("DELETE FROM table1");
result = _db.exec("INSERT INTO table1 VALUES('2012-02-27')");
result = _db.exec("SELECT ADDDAYS(col1, 5) AS 'col1' from table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	System.out.println("zodunadb test col1 = " +
		text1);
}
_rs.resultsetrelease();
result = _db.exec("DELETE FROM table1");
result = _db.exec("INSERT INTO table1 VALUES('2011-02-27')");
result = _db.exec("SELECT ADDDAYS(col1, 5) AS 'col1' from table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	System.out.println("zodunadb test col1 = " +
		text1);
}
_rs.resultsetrelease();
_db.close();
