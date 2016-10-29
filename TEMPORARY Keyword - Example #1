
//following should be used as import
import Cocoa
import ZodunaCDBOSXSwiftWrapper


//following should be used in the method where a DataStore is to be accessed
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
result = _db.exec("CREATE DATABASE db1") 
result = _db.exec("CREATE SCHEMA db1.test1") 
result = _db.exec("ATTACH db1.test1 AS test") 
result = _db.exec("CREATE TABLE table1 (col1 int, col2 varchar(100))") 
result = _db.exec("CREATE UNIQUE INDEX idx1 ON table1 (col1)")
result = _db.exec("CREATE  INDEX idx2 ON table1 (col2)")
result = _db.exec("CREATE temp.TABLE table2 (col1 int, col2 varchar(100))")
result = _db.exec("CREATE temp.TABLE table3 (col1 int, col2 varchar(100))")
result = _db.exec("CREATE temp.TABLE IF NOT EXISTS table3 (col1 int, col2 varchar(100))")
_db.begintransaction()
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')") 
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')") 
_db.commit()
result = _db.exec("CREATE TEMP TABLE table4 AS SELECT col1, col2 FROM table1") 
_db.close()
