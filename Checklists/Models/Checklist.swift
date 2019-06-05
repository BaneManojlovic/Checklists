//
//  Checklist.swift
//  Checklists
//
//  Created by Branislav Manojlovic on 3/9/1398 AP.
//  Copyright © 1398 Bane Manojlovic. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    var name = ""
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
