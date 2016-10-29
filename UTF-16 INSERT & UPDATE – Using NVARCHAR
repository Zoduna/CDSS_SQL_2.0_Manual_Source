
import Cocoa
import ZodunaCDBOSXSwiftWrapper


var            _db:ZodunaDBSwiftSQL_Database
var            _rs:ZodunaDBSwiftSQL_ResultSet
var            _stmt:ZodunaDBSwiftSQL_Statement; var result:Bool = false

_db = ZodunaDBSwiftSQL_Database(pathname:"testfolder/")
let  isOpen = _db.open(nil, password:nil)//returns "true" if successful and "false" if the command fails.
NSString* s = "\U0001F30D";
result = _db.exec("CREATE TABLE table1 (col1 int, col2 NVARCHAR)")
_db.begintransaction()
_stmt = _db.prepare("INSERT INTO table1 VALUES (?, ?)")
_stmt.bind_int(1, value:25)
_stmt.bind_text16:2 value:s, n:s.length(), enc:ZODUNADB_UTF16)
_stmt.step()
_db.commit()

_db.begintransaction()
_stmt = _db.prepare("UPDATE table1 SET col2 = ? WHERE col1 = 25")
s = "\U0001F30D\U0001F30D";
_stmt.bind_text16(1, value:s, n:s.length(), enc:ZODUNADB_UTF16)
_stmt.step()
_db.commit()

_db.close()
