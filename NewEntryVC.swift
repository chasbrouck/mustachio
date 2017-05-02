//
//  NewEntryVC.swift
//  Mustachio
//
//  Created by Noah Kellem on 5/1/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class NewEntryVC: UIViewController {
    // MARK - Storyboard Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var lengthTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel!.text = UserData.shared.getDate()[3]

        // Do any additional setup after loading the view.
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
    
    // MARK - Storyboard Actions
    @IBAction func saveEntry(_ sender: Any) {
        
        let newEntry = JournalEntry(description: descriptionTextView!.text, hairLength: Double(lengthTextView!.text)!)//, image: hjgfjhgf)
        
        UserData.shared.totalJournalEntries.append(newEntry)
        print(UserData.shared.totalJournalEntries.count)
        print(UserData.shared.totalJournalEntries[0].journalDescription ?? "No Description")
        
        reset()
        
        UserData.shared.saveEntries()
    }
    
    
    // MARK - Helper Methods
    func reset(){
        lengthTextView!.text = ""
        descriptionTextView!.text = ""
    }

}
