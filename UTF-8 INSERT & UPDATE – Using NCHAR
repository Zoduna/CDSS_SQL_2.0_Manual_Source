
import com.zcds_sql_winjava.*;;



ZodunaDBSQL_Database		_db;
ZodunaDBSQL_ResultSet		_rs;
ZodunaDBSQL_Statement		_stmt;

_db = new ZodunaDBSQL_Database("testfolder/");
boolean isOpen = _db.open(null, null); //returns "true" if successful and "false" if the command fails.
Strings = "\u00E9";
boolean  result = _db.exec("CREATE TABLE table1 (col1 int, col2 NCHAR)");
_db.begintransaction();
_stmt = _db.prepare("INSERT INTO table1 VALUES (?, ?)");
_stmt.bind_int(1, 25);
_stmt.bind_text16(2, s, s.GetLength(0), ZodunaDBSQL_Database.ZODUNADB_UTF8);
_stmt.step();
_db.commit();

_db.begintransaction();
_stmt = _db.prepare("UPDATE table1 SET col2 = ? WHERE col1 = 25");
s = "\u00E9\u00E9";
_stmt.bind_text16(1, s, s.GetLength(0), ZodunaDBSQL_Database.ZODUNADB_UTF8);
_stmt.step();
_db.commit();
_db.close();
