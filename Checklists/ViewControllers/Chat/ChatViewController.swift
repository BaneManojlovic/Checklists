//
//  ChatViewController.swift
//  Checklists
//
//  Created by Branislav Manojlovic on 3/7/1398 AP.
//  Copyright © 1398 Bane Manojlovic. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func closeChat(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
