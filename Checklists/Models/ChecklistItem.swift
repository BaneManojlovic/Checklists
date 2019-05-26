//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Bane Manojlovic on 5/26/19.
//  Copyright © 2019 Bane Manojlovic. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
