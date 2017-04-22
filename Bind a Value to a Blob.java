
import com.zcds_sql_osxjava.*;



ZodunaDBSQL_Database		_db;
ZodunaDBSQL_ResultSet		_rs;
ZodunaDBSQL_Statement		_stmt;

_db = new ZodunaDBSQL_Database("testfolder/");
boolean isOpen = _db.open(null, null); //returns "true" if successful and "false" if the command fails.
boolean  result = _db.exec("CREATE TABLE table1 (col1 double, col2 varchar(100))");
boolean isOpen = _db.open(null, null); //returns "true" if successful and "false" if the command fails.
boolean  result = _db.exec("CREATE TABLE table1 (col1 double, col2 varchar(100))");
ZodunaDBBlob		data;
String			str;

str = "\U0001F30D";
byte[] bytes = new byte[str.Length * sizeof(char)];
System.Buffer.BlockCopy(str.ToCharArray(), 0, bytes, 0, bytes.Length);
data.blob = bytes;
data.size = bytes.GetLength(0);
_db.begintransaction();
_stmt = _db.prepare("INSERT INTO table1 VALUES (?, ?)");
_stmt.bind_double(1, 25.123);
_stmt.bind_blob(2,data);
_stmt.step();
_db.commit();
