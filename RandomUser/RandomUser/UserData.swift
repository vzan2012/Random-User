//
//  UserData.swift
//  RandomUser
//
//  Created by Sitharaman Deepak Guptha on 1/23/19.
//  Copyright © 2019 Sitharaman Deepak Guptha. All rights reserved.
//
            
import Foundation
import UIKit
            
class UserData {
                
                var title: String
                var firstName: String
                var lastName: String
                var streetName: String
                var city: String
                var emailAddress: String
                var phoneNumber: String
                var mobileNumber: String
                var userPhotoThumbnail: UIImage?
                
                init(title: String,
                     firstName: String,
                     lastName: String,
                     streetName: String,
                     city: String,
                     emailAddress: String,
                     phoneNumber: String,
                     mobileNumber: String,
                     userPhotoThumbnail: UIImage?) {
                    self.title = title
                    self.firstName = firstName
                    self.lastName = lastName
                    self.streetName = streetName
                    self.city = city
                    self.emailAddress = emailAddress
                    self.phoneNumber = phoneNumber
                    self.mobileNumber = mobileNumber
                    
                    if let userPhoto = userPhotoThumbnail {
                        self.userPhotoThumbnail = userPhoto
                    }
                }
}

