//
//  LoginViewController.swift
//  Twitter
//
//  Created by Shy Shy on 2/27/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    @IBAction func onLoginButton(_ sender: Any) {
    // test it if it work using print statement - print("Hello World")
        
        //instead just paste the below long address. Create a variable that will store the address for me instead
        let myurl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myurl, success: {
            //this is when the segue getting to trigger....write some code below (segue)
            //note - the user already successfully not in the first time, don't ask them to login again unless they sign out
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not log in")
        })
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
