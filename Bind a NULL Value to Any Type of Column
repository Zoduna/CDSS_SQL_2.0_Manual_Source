
#include "ZodunaDBSQL_Database.h"



ZodunaDBSQL_Database*		_db;
ZodunaDBSQL_ResultSet*		_rs;
ZodunaDBSQL_Statement*		_stmt;

_db = new ZodunaDBSQL_Database("testfolder/");
bool isOpen = _db->open("", ""); //returns "true" if successful and "false" if the command fails.

bool  result = _db->exec("CREATE TABLE table1 (col1 int, col2 varchar(100))"]
_db->begintransaction();
_stmt = _db->prepare("INSERT INTO table1 VALUES (?, ?)");
_stmt->bind_null(1);
_stmt->bind_text(2, "abcd", 4);
_stmt->step();
_db->commit();
