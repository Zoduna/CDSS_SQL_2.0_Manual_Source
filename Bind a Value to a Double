
import Cocoa
import ZodunaCDBOSXSwiftWrapper


var            _db:ZodunaDBSwiftSQL_Database
var            _rs:ZodunaDBSwiftSQL_ResultSet
var            _stmt:ZodunaDBSwiftSQL_Statement; var result:Bool = false

_db = ZodunaDBSwiftSQL_Database(pathname:"testfolder/")
let  isOpen = _db.open(nil, password:nil)//returns "true" if successful and "false" if the command fails.

result = _db.exec("CREATE TABLE table1 (col1 double, col2 varchar(100))"]
_db.begintransaction()
_stmt = _db.prepare("INSERT INTO table1 VALUES (?, ?)")
_stmt.bind_double(1, value:25.123)
_stmt.bind_text(2, value:"abcd", n(4)
_stmt.step()
_db.commit()
