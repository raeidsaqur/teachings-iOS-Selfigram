//
//  TestSubclass.swift
//  MySelfiegram
//
//  Created by Raeid Saqur on 2016-06-07.
//  Copyright © 2016 Daniel Mathews. All rights reserved.
//

import Foundation
import Parse



class TestSubclass:PFObject, PFSubclassing {
    
    private static var __once: () = {
            //self.registerSubclass()
            //TestSubclass.registerSubclass()
        }()
    
    @NSManaged var firstName:String
    @NSManaged var lastName:String
    
    override class func initialize() {
        struct Static {
            static var onceToken : Int = 0;
        }
        _ = TestSubclass.__once
    }
    
    static func parseClassName() -> String {
        
        return "TestSubclass"
    }
    
    convenience init(fname:String , lname:String) {
        
        self.init()
        firstName = fname
        lastName = lname
    }
    
}
