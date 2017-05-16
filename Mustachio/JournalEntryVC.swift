//
//  JournalEntryVC.swift
//  Mustachio
//
//  Created by Noah Kellem on 5/8/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class JournalEntryVC: UIViewController {
    var entry:JournalEntry!
    
    var editingEntry = true
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var lengthTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dateLabel.text! = entry.journalDate
        descriptionTextView.text! = entry.journalDescription
        lengthTextView.text! = "\(entry.journalHairLength) cm"
        entryImage.image = entry.journalImage
        
        //sets up gesture recognizer to dismiss the keyboard when the user taps anywhere
        let screenTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(screenTap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func editEntry(_ sender: Any) {
        
        let button = sender as! UIButton
        
        if editingEntry{
            descriptionTextView.isEditable = true
            lengthTextView.isEditable = true
            
            lengthTextView.text! = "\(entry.journalHairLength)"
            
            descriptionTextView.backgroundColor = UIColor.lightGray
            lengthTextView.backgroundColor = UIColor.lightGray
            
            button.setBackgroundImage(UIImage(named: "saveEntry"), for: .normal)
            editingEntry = false
            
        }else{
            descriptionTextView.isEditable = false
            lengthTextView.isEditable = false
            
            descriptionTextView.backgroundColor = UIColor.white
            lengthTextView.backgroundColor = UIColor.white
            
            entry.journalHairLength = Double(lengthTextView.text)!
            entry.journalDescription = descriptionTextView.text!
            
            button.setBackgroundImage(UIImage(named: "editEntry"), for: .normal)
            UserData.shared.saveEntries()
            lengthTextView.text! = "\(entry.journalHairLength) cm"
            editingEntry = true
        }
    }
    
    //closes the keyboard
    func dismissKeyboard(){
        view.endEditing(true)
    }
}
