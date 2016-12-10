#include "zodunadboo/ZodunaDBOO_Database.h"



ZodunaDBOO_Database*		_db;
ZodunaDBOO_ResultSet*		_rs;
ZodunaDBOO_Statement*		_stmt;

_db = new ZodunaDBOO_Database("testfolder/");
bool isOpen = _db->open(); //returns "true" if successful and "false" if the command fails.

bool  result = _db->exec("CREATE TABLE table1 (col1 int, col2 blob)"]
_db->begintransaction();
_stmt = _db->prepare("INSERT INTO table1 VALUES (?, ?)");
ZodunaDBBlob         blob = null;
string       str = null;
str = "abcd";
data = new ZodunaDBBlob();
data->blob = (unsignedchar*)malloc(str.length());
copy(str.begin(), str.end(), data->blob);
data->size = str.length();
_stmt->bind_int(1, 25);
_stmt->bind_blob(2, blob);
_stmt->step();
_db->commit();
_stmt->finalize();
_stmt = _db->prepare("SELECT col1, col2 from table1 WHERE col1=?");
_stmt->bind_int(1, 25);

while (_stmt->step() == ZodunaDB_Constants::ZODUNADB_ROW)
{
NSData* value = _stmt->column_blob(1); 
}

