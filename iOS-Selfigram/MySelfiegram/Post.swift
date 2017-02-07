//
//  Post.swift
//  MySelfiegram
//
//  Created by Daniel Mathews on 2015-11-05.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import Parse

class Post:PFObject, PFSubclassing {
    
    private static var __once: () = {
            //self.registerSubclass()
            //Post.registerSubclass()
        
        }()
    
    @NSManaged var image:PFFile
    @NSManaged var user:PFUser
    @NSManaged var comment:String
    
    
    var likes: PFRelation<PFObject>! {
        return relation(forKey: "likes")
    }
    
    static func parseClassName() -> String {
        return "Post"
    }
    
    override class func initialize() {
        struct Static {
            static var onceToken : Int = 0;
        }
        _ = Post.__once
    }
    
    
    
    convenience init(image:PFFile, user:PFUser, comment:String){
        // You can name the property you are passing into the function the
        // same name as the class' property. To distinguish the two
        // add "self." to the beginning of the class' property.
        // So for example we are passing in an NSURL called imageURL and setting it as our
        // imageURL property for Post.
        self.init()
        self.image = image
        self.user = user
        self.comment = comment
    }

}





