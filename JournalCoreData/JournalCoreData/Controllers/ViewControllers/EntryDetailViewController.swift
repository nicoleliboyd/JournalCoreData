//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by David Boyd on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    //MARK: - Properties
    var entry: Entry?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    //MARK: - Actions
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let bodytext = bodyTextView.text, !bodytext.isEmpty else {return}
        
        if let entry = entry {
            entry.title = title
            entry.bodytext = bodytext
            EntryController.sharedInstance.updateEntry(entry)
        } else {
            EntryController.sharedInstance.createEntry(title: title, bodytext: bodytext)
        }
        navigationController?.popViewController(animated: true)
    }
    

    //MARK: - Functions
    func updateView() {
        guard let entry = entry else {return}
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodytext
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}//End of class
