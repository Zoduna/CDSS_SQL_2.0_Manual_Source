
using ZodunaCDBCSharpWrapper;



ZodunaDBOO_Database		_db;
ZodunaDBOO_ResultSet		_rs;
ZodunaDBOO_Statement		_stmt;

_db = new ZodunaDBOO_Database("testfolder/");
bool isOpen = db.open(); //returns "true" if successful and "false" if the command fails.
bool  result = _db.exec("CREATE TABLE table1 (col1 double, col2 varchar(100))");
bool isOpen = _db.open(); //returns "true" if successful and "false" if the command fails.
bool  result = _db.exec("CREATE TABLE table1 (col1 double, col2 varchar(100))");
ZodunaDBBlob		data;
string			str;

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
