//
//  ChatView.swift
//  Checklists
//
//  Created by Branislav Manojlovic on 3/7/1398 AP.
//  Copyright © 1398 Bane Manojlovic. All rights reserved.
//

import UIKit
import Crisp

class ChatView: UIView {

    func setup() {
        let crispView = CrispView()
        crispView.bounds = bounds
        crispView.center = center
        
        addSubview(crispView)
    }

}
