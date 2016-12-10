
#include "zodunadboo/ZodunaDBOO_Database.h"



ZodunaDBOO_Database*		_db;
ZodunaDBOO_ResultSet*		_rs;
ZodunaDBOO_Statement*		_stmt;

_db = new ZodunaDBOO_Database("testfolder/");
bool isOpen = _db->open(); //returns "true" if successful and "false" if the command fails.

bool  result = _db->exec("CREATE TABLE table1 (col1 int, col2 varchar(100))"]
_db->begintransaction();
_stmt = _db->prepare("INSERT INTO table1 VALUES (?, ?)");
_stmt->bind_int(1, 25);
_stmt->bind_text(2, "abcd", 4);
_stmt->step();
_db->commit();
_stmt->reset();
