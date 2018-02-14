//
//  ActivityCell.swift
//  Kindred
//
//  Created by Administrator on 2/13/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {

    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var activityPic: UIImageView!
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var hostName: UILabel!
    @IBOutlet weak var timeCreated: UILabel!
    @IBOutlet weak var spotsLeft: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        makePicCircle()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func makePicCircle() {
        profilePic.layer.borderWidth = 1
        profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.black.cgColor
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        profilePic.clipsToBounds = true
    }
    
}
