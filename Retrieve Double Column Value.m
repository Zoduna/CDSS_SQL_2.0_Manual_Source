
#include "ZodunaDBSQL_Database.h"
#include "ZodunaDBSQL_ResultSet.h"
#include "ZodunaDBSQL_Statement.h"

ZodunaDBSQL_Database*		_db;
ZodunaDBSQL_ResultSet*		_rs;
ZodunaDBSQL_Statement*		_stmt;

_db = [ZodunaDBSQL_Database databaseWithPath:@"testfolder/"];
BOOL isOpen = [_db open:NULL password:NULL]; //returns "true" if successful and "false" if the command fails.

BOOL  result = [_db exec:@"CREATE TABLE table1 (col1 double, col2 varchar(100))"]
[_db begintransaction];
_stmt = [_db prepare:@"INSERT INTO table1 VALUES (?, ?)"];
[_stmt bind_int:1 value:25];
[_stmt bind_text:2 value:@"abcd" n:4];
[_stmt step];
[_db commit];
[_stmt finalize];
_stmt = [_db prepare:@"SELECT col1, col2 from table1 WHERE col1=?"];
[_stmt bind_int:1 value:25.123];

while ([_stmt step] == ZODUNADB_ROW)
{
double ret1 = [_stmt column_double:0]; 
}
