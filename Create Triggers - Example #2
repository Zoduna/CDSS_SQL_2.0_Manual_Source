
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

result = _db.exec("CREATE TABLE table1 (col1 int, col2 VARCHAR(100))") 
result = _db.exec("CREATE TABLE table2(col1 int, col2 VARCHAR(100))") 
result = _db.exec("CREATE UNIQUE INDEX idx1 ON table1 (col1)")
result = _db.exec("CREATE  INDEX idx2 ON table1 (col2)")
result = _db.exec("CREATE TRIGGER trigger1 BEFORE INSERT ON table1 BEGIN INSERT INTO table2 VALUES(:new.col1, :new.col2); END")
_db.begintransaction()
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')") 
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')") 
_db.commit()
result = _db.exec("SELECT col1, col2 FROM table1 WHERE col1 = 1234") 
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
	let int1 = _rs.getint(1)
	let text1 = _rs.gettext(2)
	println("zodunadb test col1 = \(int1), col2 = \(text1)")
		
}
_rs.resultsetrelease()
_db.close()
