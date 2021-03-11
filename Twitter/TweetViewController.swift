//
//  TweetViewController.swift
//  Twitter
//
//  Created by Shy Shy on 3/6/21.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var tweetTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    //take tweetTextView - let user know I can take text in, display keyboard & cursor
        tweetTextView.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetButton(_ sender: Any) {
        if(!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        
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
