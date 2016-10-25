
import com.zcds_sql_andrdjava.*;



ZodunaDBSQL_Database		_db;
ZodunaDBSQL_ResultSet		_rs;
ZodunaDBSQL_Statement		_stmt;

_db = new ZodunaDBSQL_Database(this.getFilesDir().getPath() + this.getPackageName() + "/");
boolean isOpen = _db.open(null, null); //returns "true" if successful and "false" if the command fails.

boolean  result = _db.exec("CREATE TABLE table1 (col1 int, col2 varchar(100))"]
_db.begintransaction();
_stmt = _db.prepare("INSERT INTO table1 VALUES (?, ?)");
String	paramname = _stmt.bind_parameter_name(1);
_stmt.bind_int(1, 25);
_stmt.bind_text(2, "abcd", 4);
_stmt.step();
_db.commit();
