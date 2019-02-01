//
//  UserTableViewCell.swift
//  RandomUser
//
//  Created by Sitharaman Deepak Guptha on 1/16/19.
//  Copyright © 2019 Sitharaman Deepak Guptha. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageThumb: UIImageView!
    
    @IBOutlet weak var userTitle: UILabel!
   // @IBOutlet weak var firstName: UILabel!
    
   // @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var emailAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userImageThumb.layer.cornerRadius = self.userImageThumb.frame.size.height/2
        self.userImageThumb.clipsToBounds = true
    }

    func load(_ userData: UserData) {
        userTitle.text = (userData.firstName + " " + userData.lastName).capitalized
        
        
        //firstName.text = userData.firstName
        //lastName.text = userData.lastName
        
        emailAddress.text = userData.emailAddress
        userImageThumb.image = userData.userPhotoThumbnail
        
//        userTitle.sizeToFit()
//        firstName.sizeToFit()
//        lastName.sizeToFit()
//        emailAddress.sizeToFit()
        
    }

}
