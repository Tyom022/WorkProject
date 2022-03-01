//
//  ProfileVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 28.12.21.
//

import UIKit

class ProfileVC: UIViewController{

    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var stringLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var ballanceLbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    var tableArray = ["Update Profile", "Reset Password", "My adds", "Messenger","Tag*"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("text"), object: nil)
    }
    
    @objc func didGetNotification(_ notification: Notification){
        let name = notification.object as! String
        nameLbl.text = name
    }
    
    @IBAction func logOut(_ sender: Any) {
        print("")
    }
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileCell") as! ProfileTableViewCell
        cell.infoLabel.text = tableArray[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if index == 0{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "changeImg") as! ChnageProfileImg
            self.navigationController?.pushViewController(vc, animated: true)
        }else if index == 1{
            
        }else if index == 2{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "myAdds") as! MyAddsVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if index == 3{
            
        }else if index == 4{
            
        }
    }
    
    
}
