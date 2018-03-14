//
//  SqlNew.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/8/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import Foundation
import SQLite

class SqlNew: NSObject {
    var userInformation = UserInfo()
    var userinfolist :[UserInfo] = []
    var userNewslist : [userNews] = []
    var database : Connection!
    var news_id = Expression<String>("news_id")
    let userNewsTable = Table.init("userNews")
    let news_title = Expression<String>("news_title")
    let news_body = Expression<String>("news_body")
    let news_place = Expression<String>("news_place")
    let news_date = Expression<String>("news_date")
    let userInfoTable = Table.init("userInfo")
    let password = Expression<String>("password")
    let userName = Expression<String>("userName")
    let Name = Expression<String>("Name")
    let contactNo = Expression<String>("contactNo")
    let Address = Expression<String>("Address")
    let Age = Expression<String>("age")
  
    func openDataBase()
    {
             let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("News").appendingPathExtension("sqlite3")
        do {
             database = try Connection(fileUrl.path)
                if  !(UserDefaults.standard.bool(forKey: "checkUserInfoTable")) {
                    createUserInfoTable()
            }
            if  !(UserDefaults.standard.bool(forKey: "checkUserNewsTable")) {
                        createUserNewsTable()
                    }
         }
        
        catch
        {
            print(error)
        }
    }
    
    func createUserInfoTable()
    {
        let createUserInfoTable = self.userInfoTable.create { (table) in
            table.column(self.userName, primaryKey : true)
            table.column(self.Name)
            table.column(self.contactNo)
            table.column(self.Address)
            table.column(self.Age)
            table.column(self.password)
        }
            do {
                
                try database.run(createUserInfoTable)
                print("UserInfo Table created")
                 UserDefaults.standard.set(true, forKey: "checkUserInfoTable")
            }
            catch{
                
            }
        }
    func createUserNewsTable() {
        let createUserNewsTable = self.userNewsTable.create { (table) in
            table.column(self.userName)
            table.column(self.news_date)
            table.column(self.news_body)
            table.column(self.news_place)
            table.column(self.news_title)
         
        }
        do {
            
            try database.run(createUserNewsTable)
            print("UserNews Table created")
            UserDefaults.standard.set(true, forKey: "checkUserNewsTable")
        }
        catch{
            
        }
    }
    
    func addDataUserInfo(userName : String , Name : String , ContactNo : String , address : String , age : String , password : String)
    {
        let insertUser =   self.userInfoTable.insert(self.userName <- userName , self.Name <- Name , self.contactNo <- ContactNo , self.Address <- address , self.Age <- age , self.password <- password)
        do {
            openDataBase()
            try database.run(insertUser)
           
           
            print("succesfully data inserted")
            
            
            
        }
        catch
        {
            print(error)
        }
     
    }
    
    func addNewsInfo(userName : String ,  news_title : String , news_date : String , news_body : String , news_place : String
     )
        
    {
        let insertNews =   self.userNewsTable.insert(self.userName <- userName , self.news_title <- news_title , self.news_date <- news_date , self.news_place <- news_place , self.news_body <- news_body )
        do {
            openDataBase()
            try database.run(insertNews)
            
            
            print("succesfully news data inserted")
            
            
            
        }
        catch
        {
            print(error)
        }
        
    }
    
    func updateNewsInfo(userName : String ,  news_title : String , news_date : String , news_body : String , news_place : String )
        
    {
        let upDateUser  = self.userNewsTable.filter(self.news_title == news_title)
        let updateNews =  upDateUser.update(self.userName <- userName , self.news_title <- news_title , self.news_date <- news_date , self.news_place <- news_place , self.news_body <- news_body)
        do {
            openDataBase()
            try database.run(updateNews)
            
            
            print("succesfully news data UPDATED")
            
            
            
        }
        catch
        {
            print(error)
        }
        
    }
    func deleteNews(  news_title : String  )
        
    {
        let deleteNews  = self.userNewsTable.filter(self.news_title == news_title)
        let delete =  deleteNews.delete()
        do {
            openDataBase()
            try database.run(delete)
            
            
            print("succesfully news data UPDATED")
            
            
            
        }
        catch
        {
            print(error)
        }
        
    }
    
        
    
//    func createTable(){
//        let createTable = self.userAuth.create { (table) in
//           table.column(self.userName, primaryKey : true)
//            table.column(self.password)
//
//        }
//
//        do {
//            try database.run(createTable)
//            print("successfully table created")
//            UserDefaults.standard.set(true, forKey: "checkUserAuthTable")
//        }
//        catch
//        {
//            print(error)
//            print("error in creating table")
//        }
   // }
//    func addData(userName : String , password : String) -> UserAuth {
//        let userRef = UserAuth()
//     let insertUser =   self.userAuth.insert(self.userName <- userName , self.password <- password)
//        do {
//            openDataBase()
//                        try database.run(insertUser)
//
//            userRef.userName = userName
//            userRef.password = password
//            print("succesfully data inserted")
//
//
//
//        }
//        catch
//        {
//            print(error)
//        }
//    return userRef
//    }
//    func listUser() -> [UserAuth]
//    {
//
//        var count = 0
//        do {
//            openDataBase()
//             let userAuth = try database.prepare(self.userAuth)
//            let userObj = UserAuth()
//
//            print(users.count)
//            for user in userAuth {
//                print(user[userName])
//                userObj.userName = user[userName]
//                userObj.password = user[password]
//                users.append(userObj)
//
//
//                count = count + 1
//            }
//
//            print(count)
//        } catch
//        {
//            print(error)
//        }
//
//     return users
//    }
//
    func listUserInforamtion() -> [UserInfo] {
        do {
            openDataBase()
            let usersInfo = try database.prepare(self.userInfoTable)
            userinfolist.removeAll()
            for user in usersInfo {
                let userObj1 = UserInfo()
                userObj1.userName = user[userName]
                userObj1.name = user[Name]
                userObj1.contactNo = user[contactNo]
                userObj1.address = user[Address]
                userObj1.age = user[Age]
                userObj1.password = user[password]
                self.userinfolist.append(userObj1)
            }
            
            
        } catch {
            print(error)
        }
        
        return userinfolist
    }
    func listNewsInformation() -> [userNews] {
        do {
            openDataBase()
            let usersNewsInfo = try database.prepare(self.userNewsTable)
            userNewslist.removeAll()
            for news in usersNewsInfo {
                let userNewsObj = userNews()
                userNewsObj.userName = news[userName]
                userNewsObj.news_date = news[news_date]
                userNewsObj.news_title = news[news_title]
                userNewsObj.news_place = news[news_place]
                userNewsObj.news_body = news[news_body]
                self.userNewslist.append(userNewsObj)
            }
            
            
        } catch {
            print(error)
        }
        
        return userNewslist
    }
    
    
    
}
