//
//  MainPageVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 24.12.21.
//

import UIKit
import Foundation
import AlamofireImage
import Alamofire
import SwiftyJSON

class MainPageVC: UIViewController, TableViewCellDelegate {

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var serachBar: UISearchBar!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var buySailView: UIView!
    
    @IBOutlet weak var buyLbl: UILabel!
    @IBOutlet weak var buyPriceLbl: UILabel!
    @IBOutlet weak var sailLbl: UILabel!
    @IBOutlet weak var sailPriceLbl: UILabel!
        
    var networkService = NetworkingService()
    var sectionModel = [Section]()
    
    var searchPropm: SearchGeneralPrompElement!
    var resultArray: [String] = [String]()
    
    var searchItems : [Ads] = [Ads]()
    var collectionImage: MainPageTableViewCell?
    
    var categoris: [Category]?
    var bestExchange: BestExchange?
    var searching = false

    let searchUrl = URL(string: api + "/api/General/Prompt")
    let urlString = api + "/api/General/MainPage"

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        var mallImage: UIImage = UIImage(named: "mall")!
        logoImg.image = mallImage
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapCard(sender: )))
        tap.numberOfTapsRequired = 1
        buySailView.addGestureRecognizer(tap)

        networkService.requestGet(urlString: urlString) { [self] (result) in
            switch result{
            case .success(let response):
                categoris = response.0
                bestExchange = response.1
                categoris?.removeLast()
                
                buyPriceLbl.text = "\(bestExchange!.buy)$"
                sailPriceLbl.text = "\(bestExchange!.sale)$"
                
                mainTableView.reloadData()
            case .failure(let error):
                print("error", error)
            }

        }
    }
    
    @objc func tapCard (sender: UITapGestureRecognizer) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "buySail") as! BuySailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainPageVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoris?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "mainTableViewCell") as! MainPageTableViewCell
        
        if searching{
            cell.mainCollectionView.tag = indexPath.section
            cell.configure(section : categoris![indexPath.row], searching: true, res: searchItems)
        }else {
            cell.mainCollectionView.tag = indexPath.section
            cell.configure(section: categoris![indexPath.row], searching: false, res: [])
            cell.sectionText.text = cell.sectionModel?.name
            cell.delegate = self
            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: Amen cell-i selectic ira ejy gna (indexov)
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "mainTableViewCell") as! MainPageTableViewCell

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "realEstate") as! RealEstateVC
        var index = indexPath.row
        vc.indexForRequest = index
        vc.indexOfTableViewCell = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func selectCell(cell: MainPageTableViewCell, indexPath: IndexPath) {
        if let tableIndexPath = mainTableView.indexPath(for: cell){
            let item = categoris![tableIndexPath.row].ads[indexPath.row]
            _ = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
            vc.adsId = item.id
            vc.tableIndex = tableIndexPath.row
            vc.collectionIndex = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension MainPageVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
        
        if searchText == ""{
            searching = false
            self.mainTableView.reloadData()
            return
        }
        
        searching = true
        searchingPromp(url: searchUrl!)
        self.searchItems = searchItems.filter({search in
            return search.image.lowercased().contains(searchText.lowercased())
        }) ?? []
        collectionImage?.mainCollectionView.reloadData()
        self.mainTableView.reloadData()
    }
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("sasasaa")
    }
}


extension MainPageVC{

    func searchingPromp(url: URL){
        self.networkService.searchPropmt(url: url, body: ["countryID": 0,"symbol": ""]) { [self] (result) in
            switch result{
            case .success(let response):
//                resultNames()
                let filterResponse = response.name.filter( { (section) -> Bool in
                    return self.resultArray.contains(section.lowercased())
                })
              
//                response.name = filterResponse
//                self.mainTableView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }
        
    }

}


extension MainPageVC {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
