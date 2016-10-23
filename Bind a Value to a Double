using ZodunaCDBCSharpWrapper;



ZodunaDBOO_Database		_db;
ZodunaDBOO_ResultSet		_rs;
ZodunaDBOO_Statement		_stmt;

_db = new ZodunaDBOO_Database("testfolder/");
bool isOpen = db.open(); //returns "true" if successful and "false" if the command fails.

bool  result = _db.exec("CREATE TABLE table1 (col1 double, col2 varchar(100))"]
_db.begintransaction();
_stmt = _db.prepare("INSERT INTO table1 VALUES (?, ?)");
_stmt.bind_double(1, 25.123);
_stmt.bind_text(2, "abcd", 4);
_stmt.step();
_db.commit();
