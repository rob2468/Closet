//
//  CJDBCategoryManager.swift
//  Closet
//
//  Created by chenjun on 09/09/2017.
//  Copyright © 2017 chenjun. All rights reserved.
//

import UIKit

class CJDBCategoryManager: NSObject {
    
    // 获取所有“分类”
    class func fetchAllCategories(_: Void) -> [CJCategoryDataModel] {
        var dataList = [CJCategoryDataModel]()
        let databaseQueue = CJDBManager.sharedInstance.databaseQueue
        databaseQueue?.inDatabase({ (db) in
            let tableCategory = CJDBManager.kTABLECATEGORY
            let stat = "SELECT * FROM \(tableCategory);"
            let resultSet = try? db.executeQuery(stat, values: nil)
            if let rs = resultSet {
                let categoryFieldName = CJDBManager.kCATEGORYFIELDNAME
                while (rs.next()) {
                    let name = rs.string(forColumn: categoryFieldName)
                    let category = CJCategoryDataModel()
                    if let n = name {
                        category.name = n
                    }
                    dataList.append(category)
                }
            }
        })
        return dataList
    }

}
