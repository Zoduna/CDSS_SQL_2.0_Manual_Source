
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
boolean result = _db.exec("create table table1 (col1 int)");
result = _db.exec("create table table2 (col1 int)");
_db.begintransaction();
result = _db.exec("insert into table1 values (5)");
result = _db.exec("insert into table1 values (7)");
result = _db.exec("insert into table1 values (9)");
result = _db.exec("insert into table1 values (11)");
result = _db.exec("insert into table1 values (15)");
result = _db.exec("insert into table2 values (3)");
result = _db.exec("insert into table2 values (5)");
result = _db.exec("insert into table2 values (11)");
result = _db.exec("insert into table2 values (17)");
result = _db.exec("insert into table2 values (19)");
_db.commit();
result = _db.exec("SELECT a.col1, b.col1 FROM table1 a NATURAL INNER JOIN table2 b");
_rs = _db.getresultset();
while (_rs.getnext() ==ZodunaDBSQL_Database.ZODUNADB_ROW) 
{ 
	int	   int1 = _rs.getint(1);
	int	   int2 = _rs.getint(2);
	System.out.println("zodunadb test col1 = " + int1 + ", col2 = " +
		int2);
}
_rs.release();
_db.close();
