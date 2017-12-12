//
//  DataModel.swift
//  DSA
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

class DataModel {
    
    static let kPathName = "DSAListKeyedArchiver.plist"
    
    private init() {}
    static let shared = DataModel()
    
    private var lists = [DSA]() {
        didSet {
            saveDSAList()
        }
    }
    
    //returns document directory path for app
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath(pathName: String) -> URL {
        return DataModel.shared.documentsDirectory().appendingPathComponent(pathName)
    }
    
    //save
    func saveDSAList() {
        let path = DataModel.shared.dataFilePath(pathName: DataModel.kPathName).path
        NSKeyedArchiver.archiveRootObject(lists, toFile: path)
        print(documentsDirectory())
    }
    
    func load() {
        let path = DataModel.shared.dataFilePath(pathName: DataModel.kPathName).path
        if let results = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? [DSA] {
            lists = results
        }
    }
    
    //create
    func addDSAItemToList(dsaItem item: DSA) {
        lists.append(item)
    }
    
    //read
    func getLists() -> [DSA] {
        return lists
    }
    
    //update
    
    
    //delete
}
