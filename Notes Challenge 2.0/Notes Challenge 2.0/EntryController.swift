//
//  EntryController.swift
//  Notes Challenge 2.0
//
//  Created by Eva Marie Bresciano on 5/20/16.
//  Copyright © 2016 Notes Challenge. All rights reserved.
//

import Foundation

class EntryController {
    
    private let kEntries = "savedEntriesKey"
    
    static let sharedInstance = EntryController()
    
    init(){
        loadFromPersistentStorage()
        }

var entries = [Entry]()

func addEntry(entry: Entry){
    entries.append(entry)
    saveToPersistentStorage()
    
    }

func removeEntry(entry:Entry){
    if let indexOfEntry = entries.indexOf(entry) {
        entries.removeAtIndex(indexOfEntry)
        saveToPersistentStorage()
    }
    
    }
    
    func saveToPersistentStorage(){
        NSUserDefaults.standardUserDefaults().setObject(entries.map{$0.dictionaryCopy}, forKey: kEntries)
        }
    
    func loadFromPersistentStorage(){
        guard let entriesDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kEntries) as?
            [[String:AnyObject]] else {return}
        self.entries = entriesDictionaryArray.flatMap{Entry(dictionary:$0)}
        
        
    }

}