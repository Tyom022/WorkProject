//
//  SubCategoriesVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 25.01.22.
//

import UIKit

class SubCategoriesVC: UIViewController {

    @IBOutlet weak var subTableView: UITableView!
    
    var networkService = NetworkingService()
    var subCategory: SubCategory!
    var subNamesArr = [String]()
    var url = URL(string: api + "/api/Categories/SubCategories")
    var index: Int!
    var subCategoryId: [Int] = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.postSubCategories(url: url!, body: ["value": index + 2]) {[self] (result) in
            switch result{
            case .success(let response):
                subCategory = response.self
                subCategory.subCategory.removeLast()
                
                for i in subCategory.subCategory{
                    subCategoryId.append(i.id)
                }
                subCategoriNames()
                DispatchQueue.main.async {
                    self.subTableView.reloadData()
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

extension SubCategoriesVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subNamesArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = subTableView.dequeueReusableCell(withIdentifier: "subCell", for: indexPath) as! SubCategoriesTableViewCell
        cell.subCategoriesLabel.text = subNamesArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "realEstate") as! RealEstateVC
        vc.indexForSub = indexPath.row
        vc.indexForCategoris = index
        vc.subCategoryIdArray = subCategoryId
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
