//
//  Activity.swift
//  MySelfiegram
//
//  Created by Daniel Mathews on 2015-12-12.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import Parse

class Activity:PFObject, PFSubclassing {
    
    private static var __once: () = {
            //self.registerSubclass()
            //Activity.registerSubclass()
        }()
    
    @NSManaged var type:String
    @NSManaged var post:Post
    @NSManaged var user:PFUser
    
    override class func initialize() {
        struct Static {
            static var onceToken : Int = 0;
        }
        _ = Activity.__once
    }
    //MARK: - PFSubclassing protocol
    static func parseClassName() -> String {
        return "Activity"
    }
    
    convenience init(type:String, post:Post, user:PFUser){
        self.init()
        self.type = type
        self.post = post
        self.user = user
    }
    
}
