
//following should be used as import
import Cocoa
import ZodunaCDBOSXSwiftWrapper


class selectcallback : ZodunaDBSwiftSQL_CallbackIterface
{
    internal override func callbackroutine(NotUsed: NSObject!, argc: Int32, 
	argv: AutoreleasingUnsafeMutablePointer<NSString?>, 
	azColName: AutoreleasingUnsafeMutablePointer<NSString?>) -> Bool {
        
        for var index = 0; index < Int(argc); index++
        {
            println("\(azColName[index]!)  =  \(argv[index]!)");
        }
        return false;
    }
} 

//following should be used in the method where DataStore is to be accessed
var _db:ZodunaDBSwiftSQL_Database
var _rs:ZodunaDBSwiftSQL_ResultSet
var _stmt:ZodunaDBSwiftSQL_Statement; var result:Bool = false
_db = ZodunaDBSwiftSQL_Database(pathname:"testfolder/")
let  isOpen = _db.open(nil, password:nil)//returns "true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
	println("zodunadb error while opening DataStore\n") 
	return 
}
result = _db.exec("CREATE TABLE table1 (col1 int, col2 VARCHAR(100))") 
result = _db.exec("CREATE UNIQUE INDEX idx1 ON table1(col1))") 
result = _db.exec("CREATE TABLE table2 (col3 int REFERENCES table2 (col1), col4 VARCHAR(100))") 

result = _db.exec("INSERT INTO table1 VALUES (1234, 'abcd')") 
result = _db.exec("INSERT INTO table1 VALUES (5678, 'efgh')") 
result = _db.exec("INSERT INTO table2 VALUES (1234, 'mnop')") 

_db.execwithcallback("SELECT col1, col2 FROM table1 WHERE col1 = 1234" callback:selectcallback())
_db.close()
