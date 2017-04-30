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
    
}
