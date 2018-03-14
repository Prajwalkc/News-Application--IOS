////
////  SQL.swift
////  RealmPractice
////
////  Created by Prajwal kc on 3/8/18.
////  Copyright © 2018 Prajwal kc. All rights reserved.
////
//
//import SQLite3
//import Foundation
//class SQL: NSObject {
//
////Creating a File to connect to SQLite DATABASE
//var db: OpaquePointer?
//    var alert = Alert()
//
//
//    func openDatabase(){
//        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//            .appendingPathComponent("new").appendingPathExtension("sqlite3")
//        //creating an pointer to point in database
//
//        //Opening the database
//
//        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
//            let errMsg = String(describing: sqlite3_errmsg(db!))
//         print(errMsg)
//        }else{
//            createUserAuthTable()
//            print("sucess")
//        }
//
//    }
//    //creating a table in the data base
//
//    func createUserAuthTable(){
//        let sqlStmt = "CREATE TABLE IF NOT EXIXTS UserAuth (userName TEXT PRIMARY KEY , password TEXT)"
//        if sqlite3_exec(db, sqlStmt, nil, nil, nil) != SQLITE_OK {
//            let errorMsq = String(describing: sqlite3_errmsg(db!))
//          print(errorMsq)
//        }else{
//            print("successfully table created")
//        }
//    }
//    //registering the user record
//    func userAuthRegister(name : String , password : String){
//          let queryStmt = "INSERT INTO UserAuth(userName,password) VALUES(?,?)"
//        var stmt : OpaquePointer?
//        //Preparing Query
//        if sqlite3_prepare(db, queryStmt, -1, &stmt, nil) != SQLITE_OK{
//            let erroMsg = String(describing: sqlite3_errmsg(db!))
//          //alert.alertNotify(title: "Error", message: erroMsg)
//        }
//        //Binding values (UserName)
//        if sqlite3_bind_text(stmt, 0, name, -1, nil) != SQLITE_OK {
//            let errMsg = String(describing: sqlite3_errmsg(db!))
//        //alert.alertNotify(title: "Error", message: errMsg)
//        }
//        //Binding values (Password)
//        if sqlite3_bind_text(stmt, 1, password, -1, nil) != SQLITE_OK {
//            let errMsg = String(describing: sqlite3_errmsg(db!))
//          //alert.alertNotify(title: "Error", message: errMsg)
//        }
//
//        //Inserting values
//        if sqlite3_step(stmt) != SQLITE_OK{
//            let errMsg = String(describing: sqlite3_errmsg(db!))
//            alert.alertNotify(title: "Error", message: errMsg)
//        }else{
//            //alert.alertNotify(title: "success", message: "Successfully data Inserted")
//        }
//    }
//    //Reading Data From Database
//    func readValues() -> [UserAuth]{
//       openDatabase()
//        let queryStmt = "SELECT * FROM UserAuth"
//        var stmt : OpaquePointer?
//
//
//        if sqlite3_prepare(db, queryStmt, -1, &stmt, nil) != SQLITE_OK{
//          //  let errMsg = String(describing: sqlite3_errmsg(db!))
//           // Alert.init().alertNotify(title: "Error", message: errMsg)
//        }
//        while(sqlite3_step(stmt) == SQLITE_ROW){
//            let userName = String(describing: sqlite3_column_text(stmt, 0))
//            let password = String(describing: sqlite3_column_text(stmt, 1))
//            user.userName = userName
//            user.password = password
//        users.append(user)
//
//        }
//    return users
//    }
//
//
//}

