//
//  AddNewExchangeVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 14.02.22.
//

import UIKit

class AddNewExchangeVC: UIViewController {

    @IBOutlet weak var addTableView: UITableView!
    var networking = NetworkingService()
    var resultName: [String] = ["Վաճառքի ամփոփում","Գնումների ամփոփում","Մանրածախ վաճառքի գումար","Մանրածախ գնումների գումար"]
    var addNewExchange: [String] = []
    var urlAdd = URL(string: api + "/api/Ad/Exchange")
    var addExchange: AddNewExchange!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createNewExchange(_ sender: Any) {
        networking.addExchange(url: urlAdd!, body:["pageNumber": 1, "adCount": 1]) {[self] (result)
            in switch result{
            case .success(let response):
                addExchange = response.self
                DispatchQueue.main.async {
                    self.addTableView.reloadData()
                }
                break
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
}

extension AddNewExchangeVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addExchangeCell") as? AddNewExchangeTableViewCell
        cell?.whatAddedLabel.text = resultName[indexPath.row]
        addNewExchange.append((cell?.addPriceTextField.text)!)
      
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
