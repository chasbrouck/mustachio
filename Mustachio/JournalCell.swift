//
//  JournalCell.swift
//  Mustachio
//
//  Created by Noah Kellem on 5/8/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import UIKit

class JournalCell: UITableViewCell {
    //set up references to storyboard elements
    @IBOutlet weak var thumbnail:UIImageView!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
