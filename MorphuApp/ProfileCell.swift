//
//  ProfileCell.swift
//  Canvi
//
//  Created by Dylan Wight on 6/1/16.
//  Copyright © 2016 Dylan Wight. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var drawingsCount: UILabel!
    @IBOutlet weak var followersCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    @IBAction func followAction(sender: UIButton) {
        
    }
    
}