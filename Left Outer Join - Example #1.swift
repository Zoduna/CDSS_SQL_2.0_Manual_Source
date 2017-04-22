
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
result = _db.exec("CREATE table table1 (col1 int)") 
result = _db.exec("CREATE table table2 (col2 int)")
_db.begintransaction()
result = _db.exec("INSERT into table1 values (5)")
result = _db.exec("INSERT into table1 values (7)")
result = _db.exec("INSERT into table1 values (9)")
result = _db.exec("INSERT into table1 values (11)")
result = _db.exec("INSERT into table1 values (15)")
result = _db.exec("INSERT into table2 values (3)")
result = _db.exec("INSERT into table2 values (5)")
result = _db.exec("INSERT into table2 values (11)")
result = _db.exec("INSERT into table2 values (17)")
result = _db.exec("INSERT into table2 values (19)")
_db.commit()
result = _db.exec("SELECT a.col1, b.col2 FROM table1 a LEFT OUTER JOIN table2 b on a.col1 = b.col2")
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
	let int1 = _rs.getint(1)
	let int2 = _rs.getint(2)
	println("zodunadb test col1 = \(int1), col2 = \(int2)")
		
}
_rs.resultsetrelease()
_db.close()
