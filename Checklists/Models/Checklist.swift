//
//  Checklist.swift
//  Checklists
//
//  Created by Bane Manojlovic on 6/2/19.
//  Copyright © 2019 Bane Manojlovic. All rights reserved.
//

import UIKit

class Checklist: NSObject {

    var name = ""
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
