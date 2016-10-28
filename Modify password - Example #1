
//following should be used as import
import Cocoa
import ZodunaCDBOSXSwiftWrapper


//following should be used in the method where DataStore is to be accessed
var _db:ZodunaDBSwiftSQL_Database
var _rs:ZodunaDBSwiftSQL_ResultSet
var _stmt:ZodunaDBSwiftSQL_Statement; var result:Bool = false
_db = ZodunaDBSwiftSQL_Database(pathname:"testfolder/")
let  isOpen = _db.open("master", password:"master") //returns "true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
	println("zodunadb error while opening DataStore\n") 
	return 
}
bool isdone = _db.modifypassword("master" 
,password:"master" 
,newpassword:"newmaster"
,encryption_algorithm: 0 
,encryptpassword:NULL)
if (isdone)
{
	println("zodunadb password modfied successfully")
}
result = _db.exec("CREATE DATABASE db1") 
result = _db.exec("CREATE SCHEMA db1.test1") 
result = _db.exec("ATTACH db1.test1 AS test")
result = _db.exec("CREATE TABLE table1 (col1 int, col2 varchar(100))") 
result = _db.exec("CREATE UNIQUE INDEX idx1 ON table1 (col1)")
result = _db.exec("CREATE INDEX idx2 ON table1 (col2)")
_db.begintransaction()
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')") 
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')") 
_db.commit()
result = _db.exec("SELECT col1, col2 FROM table1 WHERE col1 = 1234") 
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
let int = _rs.getint(1)
let text1 = _rs.gettext(2) 
println("zodunadb test col1 = \(int1), col2 = \(text1)")

}
_rs.resultsetrelease()
_db.close()
