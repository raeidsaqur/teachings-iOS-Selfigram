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
    
    @NSManaged var columnOne:String
    @NSManaged var columneTwo:String
    
    override class func initialize() {
        struct Static {
            static var onceToken : Int = 0;
        }
        _ = TestSubclass.__once
    }
    
    static func parseClassName() -> String {
        
        return "TestSubclass"
    }
    
    convenience init(c1:String , c2:String) {
        
        self.init()
        columnOne = c1
        columneTwo = c2
    }
    
}
