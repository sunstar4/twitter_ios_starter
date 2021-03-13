//
//  TweetViewController.swift
//  Twitter
//
//  Created by Shy Shy on 3/6/21.
//

import UIKit
import RSKPlaceholderTextView

class TweetViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tweetTextView: RSKPlaceholderTextView!
    
    @IBOutlet weak var cLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextView.delegate = self
        tweetTextView.text = ""
        tweetTextView.textColor = UIColor.black
        cLabel.text = "280"
        
    //take tweetTextView - let user know I can take text in, display keyboard & cursor
        tweetTextView.becomeFirstResponder()
        
        //tweetTextView.selectedTextRange(from: tweetTextView.beginningOfDocument, to: tweetTextView.beginningOfDocument)
    }
    // TODO: Check the proposed new text character count
    // Allow or disallow the new text
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // Set the max character limit
        let characterLimit = 280

        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: self.tweetTextView.text!).replacingCharacters(in: range, with: text)

        // TODO: Update Character Count Label
        if newText.count <= characterLimit {
            cLabel.text = String(characterLimit - newText.count)
        }

        // The new text should be allowed? True/False
        return newText.count <= characterLimit
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
    
    
    
}
