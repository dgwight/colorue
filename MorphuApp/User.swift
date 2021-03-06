//
//  User.swift
//  Colorue
//
//  Created by Dylan Wight on 4/21/16.
//  Copyright © 2016 Dylan Wight. All rights reserved.
//

class User {
    
    public dynamic var  userId: String = ""
    public dynamic var  username: String = ""
    public dynamic var  fullname: String = ""
    public dynamic var  email: String = ""
    public dynamic var  profileURL: String = ""
    
    fileprivate var following = Set<User>()
    fileprivate var followers = Set<User>()
    fileprivate var drawings = [Drawing]()
    
    fileprivate var newestDrawing: Double = 0
    fileprivate var fullUserLoaded = false
    
    
    func setfullUserLoaded() {
        self.fullUserLoaded = true
    }
    
    func getfullUserLoaded() -> Bool {
        return self.fullUserLoaded
    }
    
    convenience init(userId: String = "", email: String = "", username: String = "", fullname: String = "", profileURL: String = "") {
        self.init()
        self.userId = userId
        self.username = username
        self.fullname = fullname
        self.email = email
        self.profileURL = profileURL
    }
   
    func getFollowing() -> Set<User> {
        return self.following
    }
    
    func follow(_ user: User) {
        following.insert(user)
    }
    
    func unfollow(_ user: User) {
        following.remove(user)
    }
    
    func isFollowing(_ user: User?) -> Bool {
        guard let user = user else { return false }
        
        for followee in self.following {
            if followee.userId == user.userId {
                return true
            }
        }
        return false
    }
    
    func addFollower(_ user: User) {
        followers.insert(user)
    }
    
    func removeFollower(_ user: User) {
        followers.remove(user)
    }
    
    func getFollowers() -> Set<User> {
        return self.followers
    }
    
    func addDrawing(_ drawing: Drawing) {
        if drawing.timeStamp < newestDrawing {
            self.newestDrawing = drawing.timeStamp
            self.drawings.insert(drawing, at: 0)
        } else {
            self.drawings.append(drawing)
        }
    }
    
    func removeDrawing(_ drawing: Drawing) {
        var i = 0
        for drawing_ in self.drawings {
            if drawing_.id == drawing.id {
                self.drawings.remove(at: i)
                return
            }
            i += 1
        }
    }
    
    func getDrawings() -> [Drawing] {
        return self.drawings
    }
}

extension User: Hashable {
    var hashValue: Int {
        return userId.hashValue
    }
}

// MARK: Equatable
func == (lhs: User, rhs: User) -> Bool {
    return lhs.userId == rhs.userId
}
