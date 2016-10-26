
import com.zcds_sql_osxjava.*;



ZodunaDBSQL_Database		_db;
ZodunaDBSQL_ResultSet		_rs;
ZodunaDBSQL_Statement		_stmt;

_db = new ZodunaDBSQL_Database("testfolder/");
boolean isOpen = _db.open(null, null); //returns "true" if successful and "false" if the command fails.

boolean  result = _db.exec("CREATE TABLE table1 (col1 int, col2 blob)"]
_db.begintransaction();
_stmt = _db.prepare("INSERT INTO table1 VALUES (?, ?)");
ZodunaDBBlob         blob = null;
String       str = null;
str = "abcd";
byte[] bytes = new byte[str.Length * sizeof(char)];
System.Buffer.BlockCopy(str.ToCharArray(), 0, bytes, 0, bytes.Length);
data.blob = bytes;
data.size = bytes.GetLength(0);
_stmt.bind_int(1, 25);
_stmt.bind_blob(2, blob);
_stmt.step();
_db.commit();
_stmt.finalize();
_stmt = _db.prepare("SELECT col1, col2 from table1 WHERE col1=?");
_stmt.bind_int(1, 25);

while (_stmt.step() == ZodunaDBSQL_Database.ZODUNADB_ROW)
{
ZodunaDBBlob value = _stmt.column_blob(1);
}
