//
//  CJDBManager.swift
//  Closet
//
//  Created by chenjun on 09/08/2017.
//  Copyright © 2017 chenjun. All rights reserved.
//

import UIKit

class CJDBManager: NSObject {
    static let sharedInstance = CJDBManager()
    var dbFilePath: URL!
    var db: FMDatabase!
    
    private override init() {
        dbFilePath = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Closet.sqlite")

        db = FMDatabase(url: dbFilePath)
        guard db.open() else {
            print("Unable to open database")
            return
        }
        
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
        
        db.close()
    }
}
