//
//  ActivityViewController.swift
//  MySelfiegram
//
//  Created by Daniel Mathews on 2015-12-12.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import UIKit

class ActivityViewController: UITableViewController {
    
    var activites = [Activity]()
    
    override func viewDidLoad() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "Selfigram-logo"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        if let query = Activity.query() {
            query.order(byDescending: "createdAt")
            // we need to get the details inside user (like username). so we include it in this query
            query.includeKey("user")
            // ditto for post.user to get the username of the user that submitted the post.
            query.includeKey("post.user")
            query.findObjectsInBackground(block: { (activites, error) -> Void in
                
                if let activites = activites as? [Activity]{
                    self.activites = activites
                    self.tableView.reloadData()
                }
                
            })
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)
        
        // get the specific activity we should layout based on where we are (indexPath.row)
        let activity = activites[indexPath.row]
        
        // get info on the liker and the userBeingLiked
        if let liker = activity.user.username,
            let userBeingliked = activity.post.user.username {
                cell.textLabel?.text = "❤️" + " \(liker) liked \(userBeingliked)'s photo"
        }
        
        return cell
    }
    
    

}
