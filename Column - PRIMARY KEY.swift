

//following should be used as import

import Cocoa

import ZodunaCDBOSXSwiftWrapper

 

 

//following should be used in the
method where DataStore is to
be accessed

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

result = _db.exec("CREATE TABLE
table1 (col1 int NOT NULL PRIAMRY KEY, col2 VARCHAR(100))") 

result = _db.exec("CREATE TABLE
table2(col1 int NOT NULL, col2 int NOT NULL, col3 VARCHAR(100), PRIMARY KEY
(col1, col2))") 

result = _db.exec("CREATE TABLE
table3(col1 int NOT NULL, col2 int NOT NULL, col3 VARCHAR(100), PRIMARY KEY
(col1, col2) ON CONFLICT ROLLBACK)") 

_db.close()

