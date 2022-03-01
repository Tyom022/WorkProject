//
//  RegisterVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 20.12.21.
//

import UIKit

class RegisterVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

  
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    let networkServise = NetworkingService()
    
    var valid = Validation()
    var pickerView = UIPickerView()
    var toolBar = UIToolbar()
    
    let valuesInPickerView = ["Armenia", "German", "USA"]
    let keys = ["+374 " , "+987 ", "+123 "]
    
    var verificationUrlCode = URL(string: "https://api.malls.team/api/User/SendConfirmEmail")
    var createUser = URL(string: "https://api.malls.team/api/User/CreateUser")
    var urlCountry = URL(string: "https://api.malls.team/api/Location/Country")

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func chooseCountry(_ sender: Any) {
        
        chooseCountry(url: urlCountry!)
        
        pickerView = UIPickerView.init()
        pickerView.delegate = self
        pickerView.backgroundColor = UIColor.white
        pickerView.setValue(UIColor.black, forKey: "textColor")
        pickerView.autoresizingMask = .flexibleWidth
        pickerView.contentMode = .center
        pickerView.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(pickerView)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .default
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }

    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        pickerView.removeFromSuperview()
    }
 
                            //Dzel
    @IBAction func chekBox(_ sender: AnyObject) {
        if UIImage(named:"Unchecked") != nil {
            sender.setImage(UIImage(named:"Checked"), for: .normal)
          }
        if UIImage(named:"Checked") != nil {
              sender.setImage( UIImage(named:"Unchecked"), for: .normal)
          }
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        let email = valid.isValidEmail(testStr: emailTxt.text!)
        let password = valid.isValidPassword(testStr: passwordTxt.text!)
        if email == false || password == false || nameTxt.text == "" || phoneTxt.text == ""{
            showAlert(title: "ERROR", message: "Somthing wrong!.")
            emailTxt.text = ""
            passwordTxt.text = ""
        }else{
            createUser(url: createUser!)
            sendVerificationCode(url: verificationUrlCode!)
           
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "verifyVC") as! VerifyVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return valuesInPickerView.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return valuesInPickerView[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        phoneTxt.text = keys[row]
    }

    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
            self.present(alert, animated: true, completion: nil)
        }
    
    
    func createUser(url: URL){
        networkServise.sendPost(url: url, body: ["phoneNumber": phoneTxt.text as Any, "firstName": nameTxt.text as Any,"email": emailTxt.text as Any,"password": passwordTxt.text as Any, "country": 1]) { response in

            if let parseJson = response as? NSDictionary {
                let mail = parseJson["email"] as? String
                let password = parseJson["password"] as? String
                let firstName = parseJson["firstName"] as? String
                let phoneText = parseJson["phoneNumber"] as? String
                let country = parseJson["country"] as? String

            }
        }
    }
    
    func sendVerificationCode(url: URL){
        networkServise.sendPost(url: url, body: ["email": emailTxt.text, "confirmationCode" : 1234]) {response in
            if let parseJson = response as? NSDictionary {
                let mail = parseJson["email"] as? String
                let password = parseJson["confirmationCode"] as? String
            }
            
//            DispatchQueue.main.async {
//                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyBoard.instantiateViewController(withIdentifier: "vc") as! ViewController
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
        }
    }
    
    func chooseCountry(url: URL){
        networkServise.sendPost(url: url, body: ["id": 0, "country": "string"]) {response in
            if let parseJson = response as? NSDictionary {
                let id = parseJson["id"] as? String
                let country = parseJson["country"] as? String
            }
        }
    }
}
