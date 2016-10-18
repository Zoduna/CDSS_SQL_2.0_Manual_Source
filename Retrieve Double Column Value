

import Cocoa

import ZodunaCDBOSXSwiftWrapper

 

 

var            _db:ZodunaDBSwiftSQL_Database

var            _rs:ZodunaDBSwiftSQL_ResultSet

var            _stmt:ZodunaDBSwiftSQL_Statement;
var result:Bool = false

 

_db =
ZodunaDBSwiftSQL_Database(pathname:"testfolder/")

let 
isOpen = _db.open(nil, password:nil)//returns "true" if
successful and "false" if the command fails.

 

result = _db.exec("CREATE TABLE
table1 (col1 double, col2 varchar(100))"]

_db.begintransaction()

_stmt = _db.prepare("INSERT INTO
table1 VALUES (?, ?)")

_stmt.bind_int(1,
value:25)

_stmt.bind_text(2,
value:"abcd", n(4)

_stmt.step()

_db.commit()

_stmt.finalize()

_stmt = _db.prepare("SELECT
col1, col2 from table1 WHERE col1=?")

_stmt.bind_int(1, value:25.123)

 

while (_stmt.step() == ZODUNADB_ROW)

{

let  ret1 = _stmt.column_double(0) 

}

