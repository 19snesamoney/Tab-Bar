//
//  Time.swift
//  Tab Bar
//
//  Created by Sreya Guha on 4/3/18.
//  Copyright © 2018 Sophia Nesamoney. All rights reserved.
//

import Foundation

class timeCalc {
    
    func calculateMonth(StringMonth: String) ->  Int{
        let myNSString = StringMonth as NSString
        
        let Month = Int( myNSString.substring(with: NSRange(location: 3, length: 4)))!
        print (Month)
        return (Month)
        
}
    func calculateDay(StringDay: String) ->  Int{
        let myNSString = StringDay as NSString
        let Day = Int( myNSString.substring(with: NSRange(location: 0, length: 3)))!
        print (Day)
        return (Day)
    
}
    
    func calculateYear(StringYear: String) ->  Int{
        let myNSString = StringYear as NSString
        var Year = Int( myNSString.substring(with: NSRange(location: 6, length: 10)))!
        print (Year)
        return (Year)
        
        
    }
    func calculateTime(StringTime: String) ->  Int{
        let myNSString = StringTime as NSString
        var Time = Int( myNSString.substring(with: NSRange(location: 10, length: 14)))!
        print (Time)
        return (Time)
        
        
}
}
