//
//  MyAddsVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 18.02.22.
//

import UIKit

class MyAddsVC: UIViewController {
    var networking = NetworkingService()
    
    var urlString = api + "/api/Ad/Own?userID=123&culture=am"
    
    var adsCategory : [AdCategory]?
    var adResult: AddsResult?
    override func viewDidLoad() {
        super.viewDidLoad()
        networking.getMyAdds(urlString: urlString) { [self] (result) in
            switch result{
            case .success(let response):
                adsCategory = response.0
                adResult = response.1
               
                
//                mainTableView.reloadData()
            case .failure(let error):
                print("error", error)
            }

        }
    }
    
//MARK: - get my adds 
}
