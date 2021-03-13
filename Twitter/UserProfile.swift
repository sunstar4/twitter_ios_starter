//
//  UserProfile.swift
//  Twitter
//
//  Created by Shy Shy on 3/12/21.
//

import Foundation

class User {
    
    var topBackgroundImage: URL?
    var userPhotoImage: URL?
    var userName: String
    var handle: String?
    var followingCount: Int?
    var followerCount: Int?
    var userId: Int64?
    var favoriteCount: Int?
    var statusesCount: Int?
    
    var dictionary: [String: Any]?
    
    init(dict: [String: Any]) {
        self.dictionary = dict
        userName = dict["name"] as? String
        handle = dict["screen_name"] as? Int
        followingCount = dict["friends_count"] as? Int
        followerCount = dict["followers_count"] as? Int
        favoriteCount = dict["favourites_count"] as? Int
        statusesCount = dict["statuses_count"] as? Int
        
        guard let  twitterID : NSNumber = dict["id"] as? NSNumber else {
            print("No Such ID")
            return
        }
        userId = twitterID.int64Value
        
        if let profile: String = dictionary["profile_image_url_https" as? String {
            userPhotoImage = URL(string: profile)!
            
            private static var _current: User?
            static var current: User?
            get {
                if _current == nil {
                    let defaults = UserDefaults.standard
                    if let userData = defaults.data(forKey: "currentUserData") {
                        let dictionary = try! JSONSerialization.jsonObject(with: userData, options: [])
                        _current = User(dictioary: dictioary)
                        
                    }
                }
                return _current
                
            }
            set (user) {
                _current = user
                
                let defaults = UserDefaults.standard
                if let user = user {
                    let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                    defaults.set(data, forKey: "currentUserData")
                } else {
                    defaults.removeObject(forKey: "currentUserData")
                    
                }
            }
            
        }
    }




}
