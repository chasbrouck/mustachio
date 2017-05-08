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
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var lengthTextView: UITextView!
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dateLabel.text! = entry.journalDate
        descriptionTextView.text! = entry.journalDescription!
        lengthTextView.text! = "\(entry.journalHairLength) cm"
        entryImage.image = entry.journalImage
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

}
