
#include "zodunadboo/ZodunaDBOO_Database.h"
#include "zodunadboo/ZodunaDBBlob.h"


ZodunaDBOO_Database*		_db;
ZodunaDBOO_ResultSet*		_rs;
ZodunaDBOO_Statement*		_stmt;

_db = new ZodunaDBOO_Database("testfolder/");
bool isOpen = _db->open(); //returns "true" if successful and "false" if the command fails.
bool  result = _db->exec("CREATE TABLE table1 (col1 double, col2 varchar(100))");
ZodunaDBBlob		data;
string			str;

str = "\U0001F30D";
data = new ZodunaDBBlob();
data->blob = (unsignedchar*)malloc(str.length());
copy(str.begin(), str.end(), data->blob);
data->size = str.length();
_db->begintransaction();
_stmt = _db->prepare("INSERT INTO table1 VALUES (?, ?)");
_stmt->bind_double(1, 25.123);
_stmt->bind_blob(2,data);
_stmt->step();
_db->commit();
