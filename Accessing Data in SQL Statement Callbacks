
//following classes should be imported
import com.zcds_sql_winjava.*;;



class selectcallback  implements CallbackInterface
{
	@Override
	publicvoid public boolean callbackroutine(Object NotUsed, int numberofcolumns, 		String[] columnnames, String[] data) 
	{
		for (int i = 0; i < numberofcolumns; i++)
			System.out.println(columnnames[i] + “ = “ + data[i]);
	}	
}

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
boolean result = _db.exec("CREATE TABLE table1 (col1 int, col2 VARCHAR(100))");
result = _db.exec("CREATE UNIQUE INDEX idx1 ON table1(col1))");
result = _db.exec("CREATE TABLE table2 (col3 int REFERENCES table2 (col1), col4 VARCHAR(100))");

result = _db.exec("INSERT INTO table1 VALUES (1234, 'abcd')");
result = _db.exec("INSERT INTO table1 VALUES (5678, 'efgh')");
result = _db.exec("INSERT INTO table2 VALUES (1234, 'mnop')");

_db.execwithcallback("SELECT col1, col2 FROM table1 WHERE col1 = 1234" , new selectcallback());
_db.close();
