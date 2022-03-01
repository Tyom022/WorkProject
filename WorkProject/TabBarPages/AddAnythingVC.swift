//
//  AddAnythingVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 08.02.22.
//

import UIKit
import PhotosUI

class AddAnythingVC: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{//PHPickerViewControllerDelegate {
    
    @IBOutlet weak var firstTableView: UITableView!
    @IBOutlet weak var secondTableView: UITableView!
    @IBOutlet weak var thirdTableView: UITableView!
    @IBOutlet weak var fourTableView: UITableView!
    @IBOutlet weak var pageName: UILabel!
    @IBOutlet weak var addImage: UIButton!
    let imageView = UIImageView()
    let viewForImages = UIView()
    
    var networkService = NetworkingService()
    var pickerView = UIPickerView()
    var toolBar = UIToolbar()
    

    var firstArr = ["Country", "Region", "City"]
    var secArr = ["Owner", "State", "Aim"]
    var thirdArr = ["Name", "Contact", "#Tag","Price", "Description"]
    var fourArr = ["Construction type", "Floor", "Room", "Space"]
    
    var names = ["Vineeta", "Shubham" ,"Anand", "Vivek", "Akshay", "Harshit", "Vikas", "Prasoon", "Sunil"]
    var department = ["iOS","Angular", ".Net", "iOS","iOS", ".Net", "Android","Android", "Angular"]
    var indexOfFirstTableViewCell: Int!
    
    var addSub: AddSubCategoriesVC!
    let scrollView = UIScrollView()
    var urls = allAdUrls()
    
    var indexForCategoris: Int!
    var indexSub: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .white
     
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotif(_:)), name: Notification.Name("text"), object: nil)
    }
    @objc func didGetNotif(_ notification: Notification){

        let name = notification.object as! String
        pageName.text = name
    }
   
    @IBAction func addImageFromGallery(_ sender: Any) {
        imageView.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        viewForImages.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        
        view.addSubview(viewForImages)
        askPermisoin()
    }
    
    func askPermisoin(){
        PHPhotoLibrary.requestAuthorization( {(status) in
            if status == PHAuthorizationStatus.authorized{
                DispatchQueue.main.async {
                    self.showPhotoLibrary()
                }
            }else{
                print("No Acess")
            }
        })
    }
    
    func showPhotoLibrary(){
//        var config = PHPickerConfiguration()
//        config.selectionLimit = 6
//        config.filter = .images
        
//        let picker = PHPickerViewController(configuration: config)
//        picker.delegate = self
//        present(picker, animated: true, completion: nil)
    }
//
//    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self){
//            itemProvider.loadObject(ofClass: UIImage.self) {[weak self] image,Error in
//                DispatchQueue.main.async {
//                    guard let self = self else{return}
//
//                    if let image = image as? UIImage{
//                        self.imageView.image = image
//                        picker.dismiss(animated: false, completion: nil)
//                        self.viewForImages.addSubview(self.imageView)
//                    }
//                }
//            }
//        }
//    }
    @IBAction func publishItem(_ sender: Any) {
        addItems()
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
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return names[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let cellName = firstTableView.dequeueReusableCell(withIdentifier: "firstCell") as! FirstTableViewCell
        if indexOfFirstTableViewCell == 0{
            NotificationCenter.default.post(name: Notification.Name("te"), object: (names[row]))

        }else if indexOfFirstTableViewCell == 1{
            NotificationCenter.default.post(name: Notification.Name("text"), object: (department[row]))

        }

    }
    
    
    func addItems(){
        if let cateIndex = indexSub{
            indexForCategoris += 2
            switch (cateIndex,indexForCategoris) {
            case (0, indexSub):
                networkService.postRealEstate(url: urls.urlForRealEstate!, body: ["id": indexSub]) {[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forRealEstate = response.self
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (1, indexSub):
                networkService.postVehicle(url: urls.urlVehicle!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forVehicle = response.self
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (2, indexSub):
                networkService.postElectronics(url: urls.urlElectronics!, body: ["id": indexSub]) {[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forElectronics = response.self
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (3, indexSub):
                networkService.postSubAppliances(url: urls.urlForAppliances!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forAppliance = response.self

                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (4, indexSub):
                networkService.postHouseOldGoods(url: urls.urlHouseOldGoods!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forHouseOld = response.self

                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (5, indexSub):
                networkService.postSubGetClothsAnd(url: urls.urlForCloths!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forCloths = response.self

                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (6, indexSub):
                networkService.postGetForChildren(url: urls.urlForChild!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forChild = response.self

                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (7, indexSub):
                networkService.postJewelryAndAcces(url: urls.urlJewerly!, body:  ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forJewerly = response.self

                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (8, indexSub):
                networkService.postConstruction(url: urls.urlConstruction!, body:  [ "id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forConstruction = response.self

                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (9, indexSub):
                networkService.postRequsetForHomeAndGarden(url: urls.urlForHomeAndGaren!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forHomeAndGarden = response.self

                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (10, indexSub):
                networkService.postRequsetFoodAndDrink(url: urls.urlFoodAndDrink!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forFoodAndDrink = response.self
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (11, indexSub):
                networkService.postRequsetCigareteAndDrink(url: urls.urlForCigarete!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forCigareteAndAlcohol = response.self
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (12, indexSub):
                networkService.postRequsetFurniture(url: urls.urlForFurniture!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forFurniture = response.self
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (13, indexSub):
                networkService.postRequsetTourismAndRest(url: urls.urlForTourism!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forTourismAndRest = response.self
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (14, indexSub):
                networkService.postGetSport(url: urls.urlForSport!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forSport = response.self
                        //                            imagesForConstruction()
                       
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (15, indexSub):
                networkService.postPetsAndPlants(url: urls.urlForPetsAndPlants!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forPetsAndPlants = response.self
                        //                            imagesForConstruction()
                       
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (16, indexSub):
                networkService.postCulture(url: urls.urlForCulture!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forCulture = response.self
                        //                            imagesForConstruction()
                        
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (17, indexSub):
                networkService.postWork(url: urls.urlForWork!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forWork = response.self
                        //                            imagesForConstruction()
                        
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (18, indexSub):
                networkService.postServices(url: urls.urlForServices!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forServices = response.self
                        //                            imagesForConstruction()
                       
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (19, indexSub):
                networkService.postGetHelathCare(url: urls.urlForHelathCare!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forHelathCare = response.self
                        //                            imagesForConstruction()
                        
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (20, indexSub):
                networkService.postGetAcquaintance(url: urls.urlForAcquantance!, body: ["id": indexSub]){[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forAcquatence = response.self
                        //                            imagesForConstruction()
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (21, indexSub):
                networkService.postEverything(url: urls.urlEverythingElse!, body: ["id": indexSub]) {[self] (result)
                    in switch result{
                    case .success(let response):
                        urls.forEverythingElse = response.self
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            default:
                print("asddsad")
            }
        }
    }
}

extension AddAnythingVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == firstTableView{
            return firstArr.count
        }else if tableView == secondTableView{
            return secArr.count
        }else if tableView == thirdTableView{
            return thirdArr.count
        }else if tableView == fourTableView{
            return fourArr.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == firstTableView{
            let cell = firstTableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstTableViewCell
            cell.firstLabel.text = firstArr[indexPath.row]
            return cell
        }else if tableView == secondTableView{
            let secCell = secondTableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! SecondTableViewCell
            secCell.secondLabel.text = secArr[indexPath.row]
            return secCell
        }else if tableView == thirdTableView{
            let thirdCell = thirdTableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as! ThirdTableViewCell
            thirdCell.textField.placeholder = thirdArr[indexPath.row]
            return thirdCell
        }else if tableView == fourTableView{
            let fourCell = fourTableView.dequeueReusableCell(withIdentifier: "fourCell", for: indexPath) as! FourTableViewCell
            fourCell.fourLabel.text = fourArr[indexPath.row]
            return fourCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == firstTableView{
            indexOfFirstTableViewCell = indexPath.row
            onDoneButtonTapped()
            openPickerView()
        }else if tableView == secondTableView{
            onDoneButtonTapped()
            openPickerView()
        }else if tableView == fourTableView{
            onDoneButtonTapped()
            openPickerView()
        }
    }
}
