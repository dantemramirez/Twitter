//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Dante Ramirez on 9/25/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var reTweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    
    @IBAction func favoriteTweet(_ sender: Any)
    {
        let toBeFavorited = !favorited
        if(toBeFavorited)
        {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { error in
                print("Favorite did not succeed: \(error)")
            })
        }
        
        else
        {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { error in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    
    @IBAction func reTweet(_ sender: Any)
    {
        let toBeRetweeted = !retweeted
        if(toBeRetweeted)
        {
            TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
                self.setRetweet(true)
            }, failure: { error in
                print("Retweet did not succeed: \(error)")
            })
        }
        else
        {
            TwitterAPICaller.client?.unReTweet(tweetId: tweetId, success: {
                self.setRetweet(false)
            }, failure: { error in
                print("Unretweet did not succeed: \(error)")
            })
        }
    }
    
    var favorited:Bool = false
    var retweeted:Bool = false
    var tweetId:Int = -1
    
    func setFavorite(_ isFavorited:Bool)
    {
        favorited = isFavorited
        if(favorited)
        {
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else
        {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweet(_ isRetweeted:Bool)
    {
        retweeted = isRetweeted
        if(retweeted)
        {
            reTweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            reTweetButton.isEnabled = false
        }
        else
        {
            reTweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            reTweetButton.isEnabled = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
