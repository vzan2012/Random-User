//
//  UserDetailedViewController.swift
//  RandomUser
//
//  Created by Sitharaman Deepak Guptha on 1/26/19.
//  Copyright © 2019 Sitharaman Deepak Guptha. All rights reserved.
//

import UIKit

class UserDetailedViewController: UIViewController {
    
    var userData: UserData?
    
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var userFirstName: UILabel!
    @IBOutlet weak var userLastName: UILabel!
    @IBOutlet weak var userStreetAddress: UILabel!
    @IBOutlet weak var userCity: UILabel!
    @IBOutlet weak var userEmailAddress: UILabel!
    @IBOutlet weak var userPhoneNumber: UILabel!
    @IBOutlet weak var userMobileNumber: UILabel!
    
    @IBOutlet weak var userPhoto: UIImageView!
    
    @IBOutlet var userDetailedView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        	
        if let userData = userData {
            userTitle.text = userData.title.capitalized
            userFirstName.text = userData.firstName.capitalized
            userLastName.text = userData.lastName.capitalized
            userStreetAddress.text = userData.streetName.capitalized
            userCity.text = userData.city.capitalized
            userEmailAddress.text = userData.emailAddress
            userPhoneNumber.text = userData.phoneNumber
            userMobileNumber.text = userData.mobileNumber
            
            userPhoto.image = userData.userPhotoThumbnail
           
        }
        // Do any additional setup after loading the view.

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
extension UIImage {
    func getCropRatio() -> CGFloat {
        var widthRatio = self.size.width / self.size.height
        return widthRatio
    }
}
