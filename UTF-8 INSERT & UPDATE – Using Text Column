
#include "ZodunaDBSQL_Database.h"
#include "ZodunaDBSQL_ResultSet.h"
#include "ZodunaDBSQL_Statement.h"

ZodunaDBSQL_Database*		_db;
ZodunaDBSQL_ResultSet*		_rs;
ZodunaDBSQL_Statement*		_stmt;

_db = [ZodunaDBSQL_Database databaseWithPath:@"testfolder/"];
BOOL isOpen = [_db open:NULL password:NULL]; //returns "true" if successful and "false" if the command fails.
NSString* s = @"\u00E9";
BOOL  result = [_db exec:@"CREATE TABLE table1 (col1 int, col2 TEXT)"]
[_db begintransaction];
_stmt = [_db prepare:@"INSERT INTO table1 VALUES (?, ?)"];
[_stmt bind_int:1 value:25];
[_stmt bind_text16:2 value:s n:[s length] enc:ZODUNADB_UTF8];
[_stmt step];
[_db commit];

[_db begintransaction];
_stmt = [_db prepare:@"UPDATE table1 SET col2 = ? WHERE col1 = 25"];
s = @"\u00E9\u00E9";
[_stmt bind_text16:1 value:s n:[s length] enc:ZODUNADB_UTF8];
[_stmt step];
[_db commit];

[_db close];
