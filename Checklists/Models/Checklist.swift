//
//  Checklist.swift
//  Checklists
//
//  Created by Bane Manojlovic on 6/2/19.
//  Copyright © 2019 Bane Manojlovic. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {

    var name = ""
    var items = [ChecklistItem]()
    var iconName = "No Icon"
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    // MARK: - For counting objects
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
}
