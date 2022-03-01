//
//  BuySailVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 10.01.22.
//

import UIKit

class BuySailVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var networking = NetworkingService()
    var url = URL(string: api + "/api/Ad/GetExchange")
    
    var name: Name!
    var resultArr: [Int] = []
    var resultName: [String] = ["Վաճառքի ամփոփում","Գնումների ամփոփում","Մանրածախ վաճառքի գումար","Մանրածախ գնումների գումար"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networking.postRequset(url: url!,body: ["pageNumber": 1,"adCount": 1]) { [self] (result) in
            switch result{
            case .success(let response):
                name = response.self
                namesForView()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    @IBAction func addNewExchange(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "addNewExchange") as! AddNewExchangeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func namesForView(){
        for result in name.res{
            resultArr.append(result.saleSummaRetail)
            resultArr.append(result.saleSumma)
            resultArr.append(result.buySumma)
            resultArr.append(result.buySummaRetail)
        }
    }
}

extension BuySailVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArr.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buyCell") as? BuySailCell
//        let model = name?.res[indexPath.row]
        cell?.priceLbl.text = String(resultArr[indexPath.row])
        cell?.informationLbl.text = resultName[indexPath.row]

        return cell!
    }
}
