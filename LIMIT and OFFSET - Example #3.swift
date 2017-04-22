
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
result = _db.exec("CREATE TABLE table1 (col1 int, col2 varchar(100))") 
_db.begintransaction()
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')") 
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')") 
result = _db.exec("INSERT INTO table1 VALUES(12341, 'abcd1')") 
result = _db.exec("INSERT INTO table1 VALUES(23451, 'efgh1')") 
result = _db.exec("INSERT INTO table1 VALUES(12342, 'abcd2')") 
result = _db.exec("INSERT INTO table1 VALUES(23452, 'efgh2')") 
result = _db.exec("INSERT INTO table1 VALUES(12343, 'abcd3')") 
result = _db.exec("INSERT INTO table1 VALUES(23453, 'efgh3')") 
result = _db.exec("INSERT INTO table1 VALUES(12344, 'abcd4')") 
result = _db.exec("INSERT INTO table1 VALUES(23454, 'efgh4')") 
result = _db.exec("INSERT INTO table1 VALUES(12345, 'abcd5')") 
result = _db.exec("INSERT INTO table1 VALUES(23455, 'efgh5')") 
result = _db.exec("INSERT INTO table1 VALUES(12346, 'abcd6')") 
result = _db.exec("INSERT INTO table1 VALUES(23456, 'efgh6')") 
_db.commit()
result = _db.exec("SELECT col1, col2 FROM table1 OFFSET 10 LIMIT 20") 
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
	let int1 = _rs.getint(1)
	let text1 = _rs.gettext(2)
	println("zodunadb test col1 = \(int1), col2 = \(text1)")
		
}
_rs.resultsetrelease()
_db.close()
