//
//  ChatViewController.swift
//  Checklists
//
//  Created by Branislav Manojlovic on 3/7/1398 AP.
//  Copyright © 1398 Bane Manojlovic. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    private var chatView: ChatView! {
        loadViewIfNeeded()
        return view as? ChatView
    }

    var viewModel: ChatViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    @IBAction func closeChat(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension ChatViewController {
    func setup() {
        chatView.setup()
    }
}
