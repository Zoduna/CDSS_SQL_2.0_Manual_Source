#include "ZodunaDBOO_Database.h"
#include "ZodunaDBOO_ResultSet.h"
#include "ZodunaDBOO_Statement.h"

ZodunaDBOO_Database*		_db;
ZodunaDBOO_ResultSet*		_rs;
ZodunaDBOO_Statement*		_stmt;

_db = [ZodunaDBOO_Database databaseWithPath:@"testfolder/"];
BOOL isOpen = [_db open]; //returns "true" if successful and "false" if the command fails.
NSString* s = @"\U0001F30D";
BOOL  result = [_db exec:"CREATE TABLE table1 (col1 int, col2 TEXT)"]
[_db begintransaction];
_stmt = [_db prepare:sql "INSERT INTO table1 VALUES (?, ?)"];
[_stmt bind_int:1 value:25];
[_stmt bind_text16:2 value:s n:[s length] enc:ZODUNADB_UTF16BE];
[_stmt step];
[_db commit];

[_db begintransaction];
_stmt = [_db prepare:sql "UPDATE table1 SET col2 = ? WHERE col1 = 25"];
s = @"\U0001F30D\U0001F30D";
[_stmt bind_text16:1 value:s n:[s length] enc:ZODUNADB_UTF16BE];
[_stmt step];
[_db commit];

[_db close];
