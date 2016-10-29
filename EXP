
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
_db.commit()
result = _db.exec("SELECT EXP(1) AS 'col1' , exp(-2) AS 'col2', exp(3.2) AS 'col3', exp(-3.2) AS 'col4' from dumtab")
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
	double d1= _rs.getdouble(1) 
	double d2= _rs.getdouble(2)
	double d3= _rs.getdouble(3)
	double d4= _rs.getdouble(4)
	println("zodunadb test col1 = \(d1), col2 = \(d2), col3 = \(d3), col4 = \(d4)") 
}
_rs.resultsetrelease()
_db.close() 
