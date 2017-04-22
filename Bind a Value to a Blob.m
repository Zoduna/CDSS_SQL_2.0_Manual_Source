
#include "ZodunaDBSQL_Database.h"
#include "ZodunaDBSQL_ResultSet.h"
#include "ZodunaDBSQL_Statement.h"

ZodunaDBSQL_Database*		_db;
ZodunaDBSQL_ResultSet*		_rs;
ZodunaDBSQL_Statement*		_stmt;

_db = [ZodunaDBSQL_Database databaseWithPath:@"testfolder/"];
BOOL isOpen = [_db open:NULL password:NULL]; //returns "true" if successful and "false" if the command fails.
BOOL  result = [_db exec:@"CREATE TABLE table1 (col1 double, col2 varchar(100))"];
NSData*		data;
NSString*		str;

str = @"\U0001F30D";
data = [str dataUsingEncoding:NSUTF8StringEncoding];
[_db begintransaction];
_stmt = [_db prepare:@"INSERT INTO table1 VALUES (?, ?)"];
[_stmt bind_double:1 value:25.123];
[_stmt bind_blob:1 value:data n:[blob size]];
[_stmt step];
[_db commit];
