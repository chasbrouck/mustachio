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
class JournalEntry: NSObject, NSCoding{
    private var entryDescription:String //stores description
    private var hairLength:Double //stores hairLength
    private var image:UIImage //stores documentary photograph
    
    var day:String
    var month:String
    var year:String
    
    
    
    private var concatenatedDate:String
    
    //constructor
    init(description:String, hairLength:Double, image:UIImage){
        self.entryDescription = description
        self.hairLength = hairLength
        self.image = image
        
        let date = UserData.shared.getDate()
        
        self.year = date[0]
        self.month = date[1]
        self.day = date[2]
        self.concatenatedDate = date[3]
    }
    
    required public init(coder aDecoder:NSCoder){
        self.entryDescription = aDecoder.decodeObject(forKey: "entryDescription") as! String
        self.hairLength = aDecoder.decodeDouble(forKey: "hairLength")
        self.image = aDecoder.decodeObject(forKey: "image") as! UIImage!
        self.day = aDecoder.decodeObject(forKey: "day") as! String
        self.month = aDecoder.decodeObject(forKey: "month") as! String
        self.year = aDecoder.decodeObject(forKey: "year") as! String
        self.concatenatedDate = aDecoder.decodeObject(forKey: "totalDate") as! String
        print("encode with coder called on \(concatenatedDate)")
    }
    
    //MARK: - Methods that are required by NSCoding protocol
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(entryDescription, forKey: "entryDescription")
        aCoder.encode(hairLength, forKey: "hairLength")
        aCoder.encode(image, forKey: "image")
        aCoder.encode(day, forKey: "day")
        aCoder.encode(month, forKey: "month")
        aCoder.encode(year, forKey: "year")
        aCoder.encode(concatenatedDate, forKey: "totalDate")
    }
    
    // MARK - Getters and Setters
    var journalDescription: String{
        get{
            return entryDescription
        }
        set(newDescription){
            entryDescription = newDescription
        }
    }
    
    var journalHairLength: Double{
        get{
            return hairLength
        }
        set(newLength){
            hairLength = newLength
        }
    }
    
    var journalImage: UIImage{
        get{
            return image
        }
        set(newImage){
            image = newImage
        }
    }
    
    var journalDate: String{
        return concatenatedDate
    }
    
    // MARK - Helper Methods
    
}
