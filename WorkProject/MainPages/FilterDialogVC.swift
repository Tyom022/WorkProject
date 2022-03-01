//
//  FilterDialogVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 27.12.21.
//

import UIKit

class FilterDialogVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
  
    @IBOutlet weak var filterTableView: UITableView!
    @IBOutlet weak var secondFilterTableView: UITableView!
    
    var pickerView = UIPickerView()
    var toolBar = UIToolbar()
    
    var names = ["Vineeta", "Shubham" ,"Anand", "Vivek", "Akshay", "Harshit", "Vikas", "Prasoon", "Sunil"]
    var department = ["iOS","Angular", ".Net", "iOS","iOS", ".Net", "Android","Android", "Angular"]
    var nameArray = ["Owner", "Aim"]
    var aboutArray = ["Individual","For Sale"]
    var indexOfFirstTableViewCell: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func openPickerView(){
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

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if secondFilterTableView.isEditing{
            return 1
        }else{
            return 1
        }
       
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if secondFilterTableView.isEditing{
            return department.count
        }else{
            return names.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let cell = secondFilterTableView.dequeueReusableCell(withIdentifier: "secondFilterCell") as! SecondFilterTableViewCell
        if secondFilterTableView.isEditing {
            cell.mutableNames.text = department[row]
            return department[row]
        }else{
            return names[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let cellName = filterTableView.dequeueReusableCell(withIdentifier: "filterCell") as! FilterTableViewCell
        
        if pickerView.tag == 0{
//            NotificationCenter.default.post(name: Notification.Name("te"), object: (names[row]))
            cellName.aboutLbl.text = names[row]
            print("0")
        }else if indexOfFirstTableViewCell == 1{
            NotificationCenter.default.post(name: Notification.Name("text"), object: (department[row]))
            cellName.aboutLbl.text = names[row]

            print("1")
        }

    }
}

extension FilterDialogVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == secondFilterTableView{
            return department.count
        }else if tableView == filterTableView{
            return nameArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == secondFilterTableView{
            let secondCell = secondFilterTableView.dequeueReusableCell(withIdentifier: "secondFilterCell") as! SecondFilterTableViewCell
            secondCell.staticNames.text = names[indexPath.row]
            return secondCell
        }else if tableView == filterTableView{
            let cell = filterTableView.dequeueReusableCell(withIdentifier: "filterCell") as! FilterTableViewCell
            cell.nameLbl.text = nameArray[indexPath.row]
    //        cell.aboutLbl.text = aboutArray[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = filterTableView.dequeueReusableCell(withIdentifier: "filterCell") as! FilterTableViewCell
        onDoneButtonTapped()
        openPickerView()
        
    }
    
}
