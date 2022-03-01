//
//  AddVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 28.12.21.
//

import UIKit

class AddVC: UIViewController {
   
    @IBOutlet weak var addTableView: UITableView!
    var network = NetworkingService()
    var mainCategory: MainCategories!
        
    var url = api + "/api/Categories/MainCategories"
    var namesArr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        network.requestGetMainCategori(urlString: url){[self] (result) in
            switch result{
            case .success(let response):
                mainCategory = response.self
                mainCategory.categori.removeLast()
                mainCategory.categori.removeFirst()
                categoriNames()
                DispatchQueue.main.async {
                    self.addTableView.reloadData()
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }
    func categoriNames(){
        for name in mainCategory.categori{
            namesArr.append(name.category)
        }
    }
}

extension AddVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addTableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath) as! AddTableViewCell
        cell.nameLbl.text = namesArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "addSub") as! AddSubCategoriesVC
        vc.index = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
