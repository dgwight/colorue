//
//  User.swift
//  Morphu
//
//  Created by Dylan Wight on 4/21/16.
//  Copyright © 2016 Dylan Wight. All rights reserved.
//

import UIKit
class User {
    
    let userId: String
    let username: String
    let email: String
    var profileImage: UIImage  //make getter and setter
    private var following = [User]()
    private var followers = [User]()
    private var drawings = [Drawing]()
    
    private var newestDrawing: Double = 0
    
    init(userId: String = "", email: String = "", username: String = "", profileImage: UIImage = UIImage()) {
        self.userId = userId
        self.username = username
        self.email = email
        self.profileImage = profileImage
    }
    
    func getFollowing() -> [User] {
        return self.following
    }
    
    func follow(user: User) {
        if !self.isFollowing(user) {
            following.append(user)
        }
    }
    
    func unfollow(user: User) {
        var i = 0
        for followee in self.following {
            if followee.userId == user.userId {
                self.following.removeAtIndex(i)
                return
            }
            i += 1
        }
    }
    
    func isFollowing(user: User) -> Bool {
        for followee in self.following {
            if followee.userId == user.userId {
                return true
            }
        }
        return false
    }
    
    func addFollower(user: User) {
        followers.append(user)
    }
    
    func removeFollower(user: User) {
        var i = 0
        for follower in self.followers {
            if follower.userId == user.userId {
                self.followers.removeAtIndex(i)
                return
            }
            i += 1
        }
    }
    
    func getFollowers() -> [User] {
        return self.followers
    }
    
    func addDrawing(drawing: Drawing) {
        if drawing.timeStamp < newestDrawing {
            self.newestDrawing = drawing.timeStamp
            self.drawings.insert(drawing, atIndex: 0)
        } else {
            self.drawings.append(drawing)
        }
    }
    
    func getDrawings() -> [Drawing] {
        return self.drawings
    }
}