//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Bane Manojlovic on 5/26/19.
//  Copyright © 2019 Bane Manojlovic. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - Action methods
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        debugPrint("Contents of text field is: \(textField.text!)")
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - TableView delegates
extension AddItemViewController {
 
    // MARK: - For preventing gray background wile selecting text input field
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

// MARK: - TextField delegates
extension AddItemViewController: UITextFieldDelegate {
    
    // MARK: - For desabling done button no navigation bar in case of empty text field
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        doneBarButton.isEnabled = !newText.isEmpty
        return true
    }
    
    // MARK: - For handling problem with clear button in text field
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
