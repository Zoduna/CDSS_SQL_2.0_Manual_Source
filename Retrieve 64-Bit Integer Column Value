
#include "ZodunaDBSQL_Database.h"



ZodunaDBSQL_Database*		_db;
ZodunaDBSQL_ResultSet*		_rs;
ZodunaDBSQL_Statement*		_stmt;

_db = new ZodunaDBSQL_Database("testfolder/");
bool isOpen = _db->open("", ""); //returns "true" if successful and "false" if the command fails.

bool  result = _db->exec("CREATE TABLE table1 (col1 long, col2 varchar(100))"]
_db->begintransaction();
_stmt = _db->prepare("INSERT INTO table1 VALUES (?, ?)");
_stmt->bind_long(1, 25);
_stmt->bind_text(2, "abcd", 4);
_stmt->step();
_db->commit();
_stmt->finalize();
_stmt = _db->prepare("SELECT col1, col2 from table1 WHERE col1=?");
_stmt->bind_int(1, 25);

while (_stmt->step() == ZodunaDBSQL_Constants::ZODUNADB_ROW)
{
long long  ret1 = _stmt->column_int64(0);
}
