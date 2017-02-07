//
//  AppDelegate.swift
//  MySelfiegram
//
//  Created by Daniel Mathews on 2015-09-17.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Post.registerSubclass()
        Activity.registerSubclass()
        TestSubclass.registerSubclass()
        
        //https://dashboard.parse.com/apps/w5d1/settings/keys
//        Parse.setApplicationId("TGT74MvbhaXV8xa8AJX9BDYA3auljov6hILvMAx3",
//                               clientKey: "EzIXyy8MRkfrYnevOEZVSduol8WoGsvh8fP2Blvl")
        
        
        
        ///Source: https://docs.google.com/spreadsheets/d/1hBRyle189P6GNA8llTylm0mRz0IFAB6G4sDRL5RuXlk/edit#gid=874184789
        /// app Name: ios-tor-pt-parse-server-ta
        /// MasterKey: 6fe82051-4dea-4490-ba9f-d9a18803fb1c
        /// app ID: 17ff1a2f-11c0-43e1-8bdd-1f4960bef808
        /// server url: https://ios-tor-pt-parse-server-ta.herokuapp.com/parse
        /// dashboard url: https://ios-tor-pt-parse-server-ta.herokuapp.com/dashboard
        
        let configuration = ParseClientConfiguration { clientConfiguration in
            clientConfiguration.applicationId = "17ff1a2f-11c0-43e1-8bdd-1f4960bef808"
            clientConfiguration.server = "https://ios-tor-pt-parse-server-ta.herokuapp.com/parse"
            
        }
        Parse.initialize(with: configuration)
        
        
        // MARK: - Toggle Creation
        //createPFTestObject()
        //createPFTestObject2()

        //let user: PFUser = self.getUser()
        if let _: PFUser = PFUser.current() {
            //createPostWithNoSubclassing()
            //createPFTestObject()
            //createPFTestObject2()
            
            
        } else {
            let user:PFUser = self.getUser()
            user.signUpInBackground { (success, error) -> Void in
                if success {
                    print("successfully signuped a user")
                }else {
                    PFUser.logInWithUsername(inBackground: user.username!, password: user.password!, block: { (user, error) -> Void in
                        if let user = user {
                            print("successfully logined in \(user)")
                        }
                    })
                }
            }
        }
        
        //createPostWithNoSubclassing()
        
        return true
    }
    
    
    //MARK: - Default user is 'raeid'
    func getUser() -> PFUser {
        //Return default user
        return self.getUser("raeid", password: "saqur", email: "raeidsaqur@gmail.com")
    }
    
    func getUser(_ username:String, password:String, email:String?) -> PFUser {
        
        print("\(#function)")
        var user = PFUser.current()
        
        if user == nil {
            user = PFUser()
            user?.username = username
            user?.password = password
            user?.email = email
        }
    
        return user!
    }
    
    func createPostWithNoSubclassing() {
        print("createPostWithNoSubclassing");
        
    
        let postWithNoSC = PFObject(className: "PostWithNoSC")
        //postWithNoSC["user"] = PFUser()
        postWithNoSC["usre"] = PFUser.current()
//        postWithNoSC["image"] = "image"
        
        postWithNoSC["image"] = 2
        
        postWithNoSC["coment"] = "This is a test comment"

        postWithNoSC.saveInBackground { (success: Bool, error: Error?) -> Void in
            if success {
                print("PostWithNoSC has been saved.")
            } else if (error != nil) {
                print(error?.localizedDescription as Any)
            }
        }
    }

    func createPFTestObject2() {
        print("createPFTestObject");
        
        let testObject = PFObject(className: "TestObject2")
        testObject["foo"] = "bar"
        
        testObject.saveInBackground { (success, error) in
            if success {
                print("TestObject2 has been saved")
            }
        }
    }

    func createPFTestObject() {
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        
        testObject.saveInBackground { (success, error) in
            if success {
                print("Object has been saved")
            }
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

