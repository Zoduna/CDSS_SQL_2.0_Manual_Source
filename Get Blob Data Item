

//following should be used as import

import Cocoa

import ZodunaCDBOSXSwiftWrapper

 

 

//following should be used in the method where a DataStore is to be
accessed

var _db:ZodunaDBSwiftSQL_Database
var _rs:ZodunaDBSwiftSQL_ResultSet
var _stmt:ZodunaDBSwiftSQL_Statement; var result:Bool = false
_db = ZodunaDBSwiftSQL_Database(pathname:"testfolder/")
let  isOpen = _db.open(nil, password:nil)//returns
"true" if successful and "false" if the command fails. 
if (!isOpen) 
{ 
                println("zodunadb
error while opening DataStore\n") 
                return 
} 
result = _db.exec("CREATE TABLE table1 (col1 int, col2 blob)") 
_db.begintransaction()
result = _db.exec("INSERT INTO table1 VALUES(1234, 'abcd')") 
result = _db.exec("INSERT INTO table1 VALUES(2345, 'efgh')") 
_db.commit()
result = _db.exec("SELECT * FROM table1") 
_rs = _db.getresultset()
while (_rs.getnext() == ZODUNADB_ROW) 
{ 
                let column_type =
_rs.getcolumntype(1)
                let column_name =
_rs.getcolumnname(1)
                let column_type_2 =
_rs.getcolumntype(2)
                let column_name_2 =
_rs.getcolumnname(2)

                let int1 = _rs.getint(1)
                NSDate*    text1 = _rs.getblob(2) 
                println("zodunadb
test column 1.... type = \(column_type) name = \(column_name) column value =
\(int1)")
                                
                println("zodunadb
test column 2.... type = \(column_type_2) name = \(column_name_2) column value
= \(text1)")
                column_type_2,
[column_name_2 UTF8String], (char *)[text1 bytes]); 
}
_rs.resultsetrelease()
_db.close()
