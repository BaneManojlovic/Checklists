//
//  DataModel.swift
//  Checklists
//
//  Created by Bane Manojlovic on 6/4/19.
//  Copyright © 2019 Bane Manojlovic. All rights reserved.
//

import Foundation

class DataModel {
    
    var lists = [Checklist]()
    
    var indexOfSelectedChecklist: Int {
        get {
            return UserDefaults.standard.integer(forKey: "ChecklistIndex")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "ChecklistIndex")
        }
    }
    
    init() {
        
        loadChecklists()
        registerDefaults()
        handleFirstTime()
    }
    
    // MARK: - Method for generating unique item ID
    class func nextChecklistItemId() -> Int {
        let userDefaults = UserDefaults.standard
        let itemID = userDefaults.integer(forKey: "ChecklistItemID")
        userDefaults.set(itemID + 1, forKey: "ChecklistItemID")
        userDefaults.synchronize()
        return itemID
    }
    
    // MARK: - For sorting of items
    func sortChecklists() {
        lists.sort(by: { list1, list2 in
                return list1.name.localizedStandardCompare(list2.name) == .orderedAscending
        })
    }
    
    // MARK: - For checking the first run
    func handleFirstTime() {
        let userDefaults = UserDefaults.standard
        let firstTime = userDefaults.bool(forKey: "FirstTime")
        if firstTime {
            let checklist = Checklist(name: "List")
            lists.append(checklist)
            indexOfSelectedChecklist = 0
            userDefaults.set(false, forKey: "FirstTime")
            userDefaults.synchronize()
        }
    }
    
    // MARK: - For UserDefaults
    func registerDefaults() {
        let dictionary = ["ChecklistIndex": -1, "FirstTime": true] as [String : Any]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    // MARK: - Data saving
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding list arra: \(error.localizedDescription)")
        }
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Checklist].self, from: data)
                sortChecklists()
            } catch {
                print("Error decoding list array: \(error.localizedDescription)")
            }
        }
    }
    
}
