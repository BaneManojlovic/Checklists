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
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
