
import com.zcds_sql_winjava.*;;



ZodunaDBSQL_Database		_db;
ZodunaDBSQL_ResultSet		_rs;
ZodunaDBSQL_Statement		_stmt;

_db = new ZodunaDBSQL_Database("testfolder/");
boolean isOpen = _db.open(null, null); //returns "true" if successful and "false" if the command fails.

boolean  result = _db.exec("CREATE TABLE table1 (col1 int, col2 varchar(100))"]
_db.begintransaction();
_stmt = _db.prepare("INSERT INTO table1 VALUES (?, ?)");
_stmt.bind_int(1, 25);
_stmt.bind_text(2, "abcd", 4);
_stmt.step();
_db.commit();
_stmt.finalize();
_stmt = _db.prepare("SELECT col1, col2 from table1 WHERE col1=?");
_stmt.bind_int(0 , 25);

while (_stmt.step() ==ZodunaDBSQL_Database.ZODUNADB_ROW)
{
int ret1 = _stmt.column_bytes(0);
}
