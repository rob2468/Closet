//
//  CJDBManager.swift
//  Closet
//
//  Created by chenjun on 09/08/2017.
//  Copyright © 2017 chenjun. All rights reserved.
//

import UIKit

private let kCurrentVersion = 1
private let kTABLECATEGORY = "category"
private let kCATEGORYFIELDID = "id"
private let kCATEGORYFIELDNAME = "name"

class CJDBManager: NSObject {
    static let sharedInstance = CJDBManager()
    var dbFilePath: URL!
    var databaseQueue: FMDatabaseQueue!
    
    private override init() {
        super.init()
        self.dbFilePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Closet.sqlite")
        self.databaseQueue = FMDatabaseQueue.init(url: self.dbFilePath)
        // 读取数据库版本号
        var version = 0
        self.databaseQueue.inDatabase { (db: FMDatabase)->Void in
            let rs = try? db.executeQuery("PRAGMA user_version", values: nil)
            if let resultSet = rs {
                if resultSet.next() {
                    version = Int(resultSet.int(forColumnIndex: 0))
                }
                resultSet.close()
            }
        }
        guard version <= kCurrentVersion else {
            return
        }
        // 数据库升级
        self.upgradeDatabaseFromVersion(version)
        
//        db = FMDatabase(url: dbFilePath)
//        guard db.open() else {
//            print("Unable to open database")
//            return
//        }
        
//        do {
//            try db.executeUpdate("create table clothes_item (x text, y text, z text)", values: nil)
//            try db.executeUpdate("create table clothes_category ()", values: nil)
//            try database.executeUpdate("insert into test (x, y, z) values (?, ?, ?)", values: ["a", "b", "c"])
//            try database.executeUpdate("insert into test (x, y, z) values (?, ?, ?)", values: ["e", "f", "g"])
//
//            let rs = try database.executeQuery("select x, y, z from test", values: nil)
//            while rs.next() {
//                if let x = rs.string(forColumn: "x"), let y = rs.string(forColumn: "y"), let z = rs.string(forColumn: "z") {
//                    print("x = \(x); y = \(y); z = \(z)")
//                }
//            }
//        } catch {
//            print("failed: \(error.localizedDescription)")
//        }
        
//        db.close()
    }
    
    func upgradeDatabaseFromVersion(_ version: Int) -> Void {
        // 数据库逐版本升级
        for i in version..<kCurrentVersion {
            if i == 0 {
                self.databaseQueue.inDatabase({ (db) in
                    let stat = "CREATE TABLE \(kTABLECATEGORY) (\(kCATEGORYFIELDID) INTEGER PRIMARY KEY AUTOINCREMENT, \(kCATEGORYFIELDNAME) text);"
                    try? db.executeUpdate(stat, values: nil)
                })
            }
        }
        // 更新数据库版本号
        self.databaseQueue.inDatabase { (db) in
            try? db.executeUpdate("PRAGMA user_version = \(kCurrentVersion);", values: nil)
        }
    }
}
