#include "ZodunaDBOO_Database.h"
#include "ZodunaDBOO_ResultSet.h"
#include "ZodunaDBOO_Statement.h"

ZodunaDBOO_Database*		_db;
ZodunaDBOO_ResultSet*		_rs;
ZodunaDBOO_Statement*		_stmt;

_db = [ZodunaDBOO_Database databaseWithPath:@"testfolder/"];
BOOL isOpen = [_db open]; //returns "true" if successful and "false" if the command fails.

BOOL  result = [_db exec:"CREATE TABLE table1 (col1 long, col2 varchar(100))"]
[_db begintransaction];
_stmt = [_db prepare:sql "INSERT INTO table1 VALUES (?, ?)"];
[_stmt bind_long:1 value:25];
[_stmt bind_text:2 value:"abcd" n:4];
[_stmt step];
[_db commit];
[_stmt finalize];
_stmt = [_db prepare:sql["SELECT col1, col2 from table1 WHERE col1=?"];
[_stmt bind_int:1 value:25];

while ([_stmt step] == ZODUNADB_ROW)
{
long long  ret1 = [_stmt column_int64:0];
}
