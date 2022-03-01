//
//  AddSubCategoriesVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 08.02.22.
//

import UIKit

class AddSubCategoriesVC: UIViewController {

    @IBOutlet weak var addSubTableView: UITableView!
    var networkService = NetworkingService()
    var subCategory: SubCategory!
    var subNamesArr = [String]()
    var url = URL(string: api + "/api/Categories/SubCategories")
    var index: Int!
    var nameOfCell: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.postSubCategories(url: url!, body: ["value": index + 2]) {[self] (result) in
            switch result{
            case .success(let response):
                subCategory = response.self
                subCategory.subCategory.removeLast()
                subCategoriNames()
                DispatchQueue.main.async {
                    self.addSubTableView.reloadData()
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }
    func subCategoriNames(){
        for name in subCategory.subCategory{
            subNamesArr.append(name.type)
        }
    }
}

extension AddSubCategoriesVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subNamesArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addSubTableView.dequeueReusableCell(withIdentifier: "addSubCell", for: indexPath) as! AddSubTableViewCell
        cell.subNameLbl.text = subNamesArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = addSubTableView.dequeueReusableCell(withIdentifier: "addSubCell", for: indexPath) as! AddSubTableViewCell

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "addAnything") as! AddAnythingVC
        vc.indexForCategoris = indexPath.row
        vc.indexSub = index
        NotificationCenter.default.post(name: Notification.Name("text"), object: (cell.subNameLbl.text))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
