//
//  HomeTableViewController.swift
//  Colorue
//
//  Created by Dylan Wight on 4/8/16.
//  Copyright © 2016 Dylan Wight. All rights reserved.
//

import UIKit
import CCBottomRefreshControl
import AirshipKit

class WallViewController: DrawingListViewController {

    let prefs = UserDefaults.standard

    // MARK: Loading Methods
    override func viewDidLoad() {
        self.tintColor = redColor
        super.viewDidLoad()
        
        loadMoreDrawings = api.loadWall
        
        self.refreshControl?.beginRefreshing()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (!prefs.bool(forKey: "firstOpen")) {
            prefs.setValue(true, forKey: "firstOpen")
            if let newVC = self.tabBarController!.storyboard?.instantiateViewController(withIdentifier: "DrawingViewController") {
                self.tabBarController!.present(newVC, animated: true, completion: nil)
            }
        } else if !prefs.bool(forKey: "pushAsk1") {
            let pushAsk1 = UIAlertController(title: "Notifications", message: "Want to know if someone follows you or comments on your drawings?", preferredStyle: UIAlertControllerStyle.alert)
            pushAsk1.addAction(UIAlertAction(title: "Nope", style: UIAlertActionStyle.default, handler: nil))
            pushAsk1.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { alert in
                UAirship.push().userPushNotificationsEnabled = true
                UAirship.namedUser().identifier = self.api.getActiveUser().userId
            }))
            self.present(pushAsk1, animated: true, completion: nil)
            prefs.setValue(true, forKey: "pushAsk1")
        } else if !UAirship.push().userPushNotificationsEnabled
            && api.getActiveUser().getFollowers().count > 2 {
            UAirship.push().userPushNotificationsEnabled = true
            UAirship.namedUser().identifier = self.api.getActiveUser().userId
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return api.getDrawingOfTheDay().count
        } else {
            return drawingSource().count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "DrawingCell", for: indexPath) as! DrawingCell
        
        if (indexPath as NSIndexPath).section == 0  {
            cell.drawingOfTheDayLabel?.isHidden = false
        } else {
            cell.drawingOfTheDayLabel?.isHidden = true
        }
        return cell
    }
    
    @IBAction func backToHome(_ segue: UIStoryboardSegue) {}
}
