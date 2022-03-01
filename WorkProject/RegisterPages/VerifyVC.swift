//
//  VerifyVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 20.12.21.
//

import UIKit

class VerifyVC: UIViewController {
    
    @IBOutlet weak var acessCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendCode(_ sender: Any) {
        if acessCode.text == "1234"{
            DispatchQueue.main.async {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "vc") as! ViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }else {
            
        }
    }
}
