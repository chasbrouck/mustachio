//
//  JournalEntry.swift
//  Mustachio
//
//  Created by Noah Kellem on 4/30/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import Foundation
import UIKit

//class that contains all the info present in a journal entry
class JournalEntry{
    private var description:String? //stores description
    private var hairLength:Double? //stores hairLength
    private var image:UIImage? //stores documentary photograph
    private var date:Date? //stores the date the entry was created
    
    private var day:String?
    private var month:String?
    private var year:String?
    
    private var concatenatedDate:String?
    
    //constructor
    init(description:String, hairLength:Double, image:UIImage){
        self.description = description
        self.hairLength = hairLength
        self.image = image
        self.date = Date()
        //get and parse the date from the calendar
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: self.date!)
        
        self.year = String(components.year!)
        self.month = determineMonth(month: components.month!)
        self.day = String(components.day!)
        
        self.concatenatedDate = "\(self.month!) \(self.day!) - \(self.year!)"
        
        UserData.shared.totalJournalEntries.append(self)
    }
    
    // MARK - Getters and Setters
    var journalDescription: String{
        get{
            return description ?? ""
        }
        set(newDescription){
            description = newDescription
        }
    }
    
    var journalHairLength: Double{
        get{
            return hairLength ?? 0.0
        }
        set(newLength){
            hairLength = newLength
        }
    }
    
    var journalImage: UIImage{
        get{
            return image!
        }
        set(newImage){
            image = newImage
        }
    }
    
    // MARK - Helper Methods
    
    //handling dates in swift is bad - only returns Ints
    //for our purposes we need the app to display the month name
    //this method determines what month it is and returns it
    func determineMonth(month:Int)->String{
        var mon = ""
        
        switch(month){
        case 1: mon = "January"
            break
        case 2: mon = "February"
            break
        case 3: mon = "March"
            break
        case 4: mon = "April"
            break
        case 5: mon = "May"
            break
        case 6: mon = "June"
            break
        case 7: mon = "July"
            break
        case 8: mon = "August"
            break
        case 9: mon = "September"
            break
        case 10: mon = "October"
            break
        case 11: mon = "November"
            break
        case 12: mon = "December"
            break
        default: mon = "no date"
            break
        }
        
        return mon
    }
}
