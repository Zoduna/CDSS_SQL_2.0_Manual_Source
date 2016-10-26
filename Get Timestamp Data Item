
//following classes should be imported
import com.zcds_sql_osxjava.*;



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
boolean result = _db.exec("CREATE TABLE table1 (col1 int, col2 timestamp)");
_db.begintransaction();
result = _db.exec("INSERT INTO table1 VALUES(1234, '2011-01-02 11:12:13')");
result = _db.exec("INSERT INTO table1 VALUES(2345, '2012-04-05 13:14:15')");
_db.commit();
result = _db.exec("SELECT * FROM table1");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	int        column_type = _rs.getcolumntype(1);
	String    column_name = _rs.getcolumnname(1);
	int        column_type_2 = _rs.getcolumntype(2);
	String    column_name_2 = _rs.getcolumnname(2);

	int        int1 = _rs.getint(1);
	String    text1 = _rs.gettimestamp(2);
	System.out.println("zodunadb test column 1.... type = " + column_type + ", name = " + column_name + ",  intvalue = " + int1);
	System.out.println("zodunadb test column 2.... type = " + column_type_2 + ", name = " + column_name_2 + ",  timestampvalue = " + text1);
}
_rs.resultsetrelease();
_db.close();
