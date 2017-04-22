
#include "ZodunaDBSQL_Database.h"



ZodunaDBSQL_Database*		_db;
ZodunaDBSQL_ResultSet*		_rs;
ZodunaDBSQL_Statement*		_stmt;

_db = new ZodunaDBSQL_Database("testfolder/");
bool isOpen = _db->open("", ""); //returns "true" if successful and "false" if the command fails.
char* s = "\u00E9";
bool  result = _db->exec("CREATE TABLE table1 (col1 int, col2 NCHAR)"]
_db->begintransaction();
_stmt = _db->prepare("INSERT INTO table1 VALUES (?, ?)");
_stmt->bind_int(1, 25);
_stmt->bind_text16(2, s, s.length(), ZodunaDB_Constants::ZODUNADB_UTF8);
_stmt->step();
_db->commit();

_db->begintransaction();
_stmt = _db->prepare("UPDATE table1 SET col2 = ? WHERE col1 = 25");
s = "\u00E9\u00E9";
_stmt->bind_text16(1, s, s.length(), ZodunaDB_Constants::ZODUNADB_UTF8);
_stmt->step();
_db->commit();
_db->close();
