//
//  ViewController.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 20.12.21.
//

import UIKit
import Alamofire



class ViewController: UIViewController {
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    var valid = Validation()
    var networkService = NetworkingService()
    var loginUSer: LoginModel!
    
    var urlString = URL(string: api + "/api/Identity/Login")

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    fileprivate var indicatorView: UIView?
    func showSpinner(){
        indicatorView = UIView(frame: self.view.bounds)
        indicatorView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        spinner.center = indicatorView!.center
        spinner.startAnimating()
        indicatorView?.addSubview(spinner)
        self.view.addSubview(indicatorView!)
    }
    func removeSpinner()
    {
        indicatorView?.removeFromSuperview()
    }
    @IBAction func loginBtn(_ sender: Any) {
        showSpinner()
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false){ (t) in
            self.removeSpinner()
        }
        let email = valid.isValidEmail(testStr: emailTxt.text!)
        let password = valid.isValidPassword(testStr: passwordTxt.text!)
        if email == false || password == false{
            showAlert(title: "ERROR", message: "This is not a valid email. Please try again.")
            emailTxt.text = ""
            passwordTxt.text = ""
        }else{
            networkService.loginPostRequest(url: urlString!, body: ["userName": emailTxt.text, //"georgi20111@gmail.com",//
                                                                    "password": passwordTxt.text,//"123123123"
                                                                    "token": ""])  { [self] (result)in
                switch result{
                case .success(let response):
                    loginUSer = response.self
                    DispatchQueue.main.async {
                        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyBoard.instantiateViewController(withIdentifier: "myTabBar") as! MyTabBar
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                case .failure(let error):
                    print("error", error)
                }
            }
//            showAlert(title: "ERROR", message: "Email or password isnt valid")
        }
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "registerVC") as! RegisterVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func forgotBtn(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "forgot") as! ForgotVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController{
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
