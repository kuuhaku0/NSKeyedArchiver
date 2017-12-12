//
//  EditListViewController.swift
//  DSA
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class EditListViewController: UIViewController {

    @IBOutlet weak var dsaTextField: UITextField!
    @IBOutlet weak var dsaTextView: UITextView!
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        guard let dsaTitle = dsaTextField.text,
            let dsaDescription = dsaTextView.text else {
                return }
        if dsaTitle.isEmpty || dsaDescription.isEmpty {
            showAlert()
        }
        else { //save
            let dsaItem = DSA.init(title: dsaTitle, description: dsaDescription)
            DataModel.shared.addDSAItemToList(dsaItem: dsaItem)
        }
        navigationController?.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func showAlert() {
        let alert =  UIAlertController(title: "Missing Fields", message: "Title and Description are required", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
}
