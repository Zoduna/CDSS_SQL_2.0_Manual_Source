
//following classes should be imported
import com.zcds_sql_andrdjava.*;



//following should be used in the method where DataStore is to be accessed
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
result = _db.exec("CREATE VIEW view1 AS SELECT col1 FROM table1");
result = _db.exec("CREATE VIEW view2 AS SELECT col1 + 1000 AS 'newcol1' FROM table1");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')");
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')");
_db.commit();
_rs = _db.execquery("SELECT * FROM view1");
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	System.out.println("zodunadb test column 2.... textvalue = " +  text1);
}
_rs.resultsetrelease();
_rs = _db.exec("SELECT * FROM view2");
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	String    text1 = _rs.gettext(1);
	System.out.println("zodunadb test column 2.... textvalue = " +  text1);
}
_rs.resultsetrelease();
_db.close();
