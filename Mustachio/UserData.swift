//
//  UserData.swift
//  Mustachio
//
//  Created by Noah Kellem on 4/30/17.
//  Copyright © 2017 Conner Hasbrouck. All rights reserved.
//

import Foundation

//singleton class
//stores all relevant information relating to the app
class UserData{
    //holds all the user's journal entries
    private var journalEntries = [JournalEntry]()
    
    //singleton access point
    static let shared = UserData()
    
    private init(){
        //add file loading code here
        
    }
    
    // MARK - Getters and Setters
    
    //returns the private journalEntries variable and allows it to be reset
    var totalJournalEntries:[JournalEntry]{
        get{
            return journalEntries
        }
        set(newArray){
            journalEntries = newArray
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
    
    //method that gets the date and parses it so that it can be used appropriately by the other classes and view controllers
    func getDate()->[String]{
        //get and parse the date from the calendar
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        
        let year = String(components.year!)
        let month = determineMonth(month: components.month!)
        let day = String(components.day!)
        
        let fullDate = "\(month) \(day) - \(year)"
        
        return [year, month, day, fullDate]
    }
    
    //serializes and saves the favorites array to disk
    func saveEntries(){
        let pathToFile = FileManager.filePathInDocumentsDirectory(fileName: "allEntries.archive")
        let success = NSKeyedArchiver.archiveRootObject(journalEntries, toFile: pathToFile.path)
        print("Saved = \(success) to \(pathToFile)")
    }
    
}
