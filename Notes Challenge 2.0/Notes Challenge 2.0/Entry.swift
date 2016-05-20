//
//  Entry.swift
//  Notes Challenge 2.0
//
//  Created by Eva Marie Bresciano on 5/20/16.
//  Copyright © 2016 Notes Challenge. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let kTitle = "titleKey"
    private let kBodyText = "bodyTextKey"
    private let kTimeStamp = "timeStampKey"
    
    var dictionaryCopy: [String:AnyObject] {
        return [kTitle: title, kBodyText: bodyText, kTimeStamp: timeStamp]
    }
    
    var title: String
    var bodyText: String
    var timeStamp: NSDate
    
    init(title: String, bodyText: String, timeStamp: NSDate){
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = NSDate()
    }


    init?(dictionary:[String:AnyObject]){
        guard let title = dictionary[kTitle] as? String,
        bodyText = dictionary[kBodyText] as? String,
        timeStamp = dictionary[kTimeStamp] as? NSDate
        else { return nil }
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = NSDate()
    
    }
}

func == (lhs: Entry, rhs: Entry) -> Bool {
    return lhs.title == rhs.title && lhs.bodyText == rhs.bodyText && lhs.timeStamp == rhs.timeStamp
}
