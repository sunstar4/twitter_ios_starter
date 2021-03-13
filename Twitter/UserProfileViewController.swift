//
//  UserProfileViewController.swift
//  Twitter
//
//  Created by Shy Shy on 3/12/21.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var topBackgroundImageView: UIImageView!
    @IBOutlet weak var userPhotoImageView: UIImageView!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view.
        /*
        let myurl = "https://api.twitter.com/1.1/account/verify_credentials.json"
        let myParams = ["":""]
        TwitterAPICaller.client?.getDictionaryRequest(url: myurl, parameters: myParams as [String: Any],
                                                      success: {
                                                        (profile: NSDictionary) in
                                                      },
                                                      failure: {(Error) in
                                                        print("Could not retreive tweets! uh oh!")
                                                      })
 */
    }
    
    /*
    func loadProfile() {
        if let user = self.user {
            UserNameLabel.text = "@\(user.screenName)"
            if user.name != nil {
                UserNameLabel.text = user.name
            }
            
            followingLabel.text = "\(user.friendcount!)"
            followersLabel.text = "\(user.followercount)"
            statusCountLabel.text = "\(user.statusCount!)"
            if let profilePhotoURL = user.userPhotoImage {
                userPhotoImageView.af_setImage(withURL: profilePhotoURL
                }
                
            }
        }
    }
    
    */
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
