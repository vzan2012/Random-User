//
//  ViewController.swift
//  RandomUser
//
//  Created by Sitharaman Deepak Guptha on 1/13/19.
//  Copyright © 2019 Sitharaman Deepak Guptha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userData: [UserData] = []
    var currentUser: UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getContent()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as?
            UserTableViewCell {
            cell.load(userData[indexPath.row])
            
            if(indexPath.row % 2 == 0){
                cell.backgroundColor = UIColor(red: 255, green: 149, blue: 0, alpha: 0.4)
            } else {
                cell.backgroundColor = UIColor(red: 255, green: 149, blue: 0, alpha: 0.1)
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentUser = userData[indexPath.row]
        performSegue(withIdentifier: "userDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "userDetailSegue" {
            
            let detailViewController = segue.destination as? UserDetailedViewController
            
            detailViewController?.userData = currentUser;
            
        }
        
    }
    
    
    func getContent() {
        
        var personTitle: String?
        var personFirstName: String?
        var personLastName: String?
        
        var personStreetAddress: String?
        var personCity: String?
        var userPhotoThumb = UIImage()
        
        let url = URL(string: "https://randomuser.me/api/?results=30&seed=sitharaman")
        
        let task = URLSession.shared.dataTask(with: url!)
        { (data,response,error) in
            guard let json = (try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else {
                print("Not containing JSON")
                return
            }
            //print(json)
            
            guard let userContacts = json["results"] as? [[String:Any]] else {
                return
            }
            
            for userContact in userContacts {
                

                if let personNames = userContact["name"] as? [String: Any] {
                    personTitle = personNames["title"] as? String ?? ""
                    personFirstName = personNames["first"] as? String ?? ""
                    personLastName = personNames["last"] as? String ?? ""
                }
                
                if let personLocation = userContact["location"] as? [String: Any] {
                    personStreetAddress = personLocation["street"] as? String ?? ""
                    personCity = personLocation["city"] as? String ?? ""
                }
                
                guard let personEmailAddress = userContact["email"] as? String else {
                    return
                }
                
                guard let personPhoneNumber = userContact["phone"] as? String else {
                    return
                }
                
                guard let personCellNumber = userContact["cell"] as? String else {
                    return
                }
                
                if let userPhoto = userContact["picture"] as? [String: Any] {
                    let photo_large_url: URL = URL(string: userPhoto["large"] as! String)!
                    
                    let imageData:NSData = NSData(contentsOf: photo_large_url)!
                    
                    userPhotoThumb = UIImage(data: imageData as Data)!
                }
                
                let newUser = UserData(title: personTitle!, firstName: personFirstName!, lastName: personLastName!, streetName: personStreetAddress!, city: personCity!, emailAddress: personEmailAddress, phoneNumber: personPhoneNumber, mobileNumber: personCellNumber, userPhotoThumbnail: userPhotoThumb)
                
                
                self.userData.append(newUser)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
                
            }
            
            
        }
        
        task.resume()
    }
    
    
}

