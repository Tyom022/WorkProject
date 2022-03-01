//
//  RealEstateVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 27.12.21.
//

import UIKit

class RealEstateVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var textForPage: UILabel!
    
    var networkService = NetworkingService()
    var url = AllUrlsGet()
    var req = RequstModel()

    var imageArr: [String] = []
    var indexForRequest: Int!
    
    //MARK: subCategoryRequestIndex
    var indexForCategoris: Int!
    var indexForSub: Int!
    var indexOfTableViewCell: Int!

    var generalId: [Int] = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        typeOfRequest()
        subCate()
    }
    
    var subCategoryIdArray: [Int] = [Int]()

    func typeOfRequest(){
        switch indexForRequest{
        case 0:
            networkService.postRealEstate(url: url.urlForRealEstate!, body:["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.realEstate = response.self
                    imagesForReal()
                    for i in req.realEstate.real{
                        generalId.append(i.id)
                    }
//                    setImages(imageList: )
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 1:
            networkService.postVehicle(url: url.urlVehicle!, body: ["pageNumber": 1, "adCount": 20]){[self] (result)
                in switch result{
                case .success(let response):
                    req.forVehicle = response.self
                    imagesForVehicle()
                    for i in req.forVehicle.vehicle{
                        generalId.append(i.id)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 2:
            networkService.postElectronics(url: url.urlElectronics!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forElectronics = response.self
                    imagesForElectronics()
                    for i in req.forElectronics.electronics{
                        generalId.append(i.id)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 3:
            networkService.postHouseOldGoods(url: url.urlHouseOldGoods!, body: ["pageNumber": 1, "adCount": 20]){[self] (result)
                in switch result{
                case .success(let response):
                    req.forHouseOld = response.self
                    imagesForHouse()
                    for i in req.forHouseOld.house{
                        generalId.append(i.id)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 4:
            networkService.postConstruction(url: url.urlConstruction!, body:  ["pageNumber": 1, "adCount": 20]){[self] (result)
                in switch result{
                case .success(let response):
                    req.forConstruction = response.self
                    imagesForConstruction()
                    for i in req.forConstruction.const{
                        generalId.append(i.id)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 5:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    for i in req.forEverythingElse.every{
                        generalId.append(i.id)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 6:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    for i in req.forEverythingElse.every{
                        generalId.append(i.id)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 7:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    for i in req.forEverythingElse.every{
                        generalId.append(i.id)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 8:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    for i in req.forEverythingElse.every{
                        generalId.append(i.id)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 9:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    for i in req.forEverythingElse.every{
                        generalId.append(i.id)
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 10:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 11:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 12:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 13:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 14:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 15:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 16:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 17:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 18:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 19:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 20:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        case 21:
            networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20]) {[self] (result)
                in switch result{
                case .success(let response):
                    req.forEverythingElse = response.self
                    imagesForEverything()
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        default:
            print("")
        }
    }
    var subId: [Int] = [Int]()
    func subCate(){
        if let cateIndex = indexForCategoris{
            switch (cateIndex,indexForSub) {
                case (0, indexForSub):
                    networkService.postRealEstate(url: url.urlForRealEstate!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]) {[self] (result)
                        in switch result{
                        case .success(let response):
                            req.realEstate = response.self
                            for i in response.real{
                                subId.append(i.id)
                            }
                            imagesForReal()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (1, indexForSub):
                    networkService.postVehicle(url: url.urlVehicle!, body: ["pageNumber": 1, "adCount": 20,"subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forVehicle = response.self
                            for i in response.vehicle{
                                subId.append(i.id)
                            }
                            imagesForVehicle()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (2, indexForSub):
                    networkService.postElectronics(url: url.urlElectronics!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]) {[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forElectronics = response.self
                            for i in response.electronics{
                                subId.append(i.id)
                            }
                            imagesForElectronics()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (3, indexForSub):
                    networkService.postSubAppliances(url: url.subAppliances!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forAppliance = response.self
                            for i in response.appliances{
                                subId.append(i.id)
                            }
//                            imagesForAppliance()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (4, indexForSub):
                    networkService.postHouseOldGoods(url: url.urlHouseOldGoods!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forHouseOld = response.self
                            for i in response.house{
                                subId.append(i.id)
                            }
                            imagesForHouse()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (5, indexForSub):
                    networkService.postSubGetClothsAnd(url: url.urlForCloths!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forCloths = response.self
//                            imagesForHouse()
                            for i in response.clotshAndShows{
                                subId.append(i.id)
                            }
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (6, indexForSub):
                    networkService.postGetForChildren(url: url.urlForChild!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forChild = response.self
                            for i in response.children{
                                subId.append(i.id)
                            }
//                            imagesForHouse()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (7, indexForSub):
                    networkService.postJewelryAndAcces(url: url.urlJewerly!, body:  [ "pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forJewerly = response.self
                            for i in response.jewerly{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (8, indexForSub):
                    networkService.postConstruction(url: url.urlConstruction!, body:  [ "pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forConstruction = response.self
                            for i in response.const{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (9, indexForSub):
                    networkService.postRequsetForHomeAndGarden(url: url.urlForHomeAndGaren!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forHomeAndGarden = response.self
                            for i in response.homeAndGarden{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (10, indexForSub):
                    networkService.postRequsetFoodAndDrink(url: url.urlFoodAndDrink!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forFoodAndDrink = response.self
                            for i in response.food{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (11, indexForSub):
                    networkService.postRequsetCigareteAndDrink(url: url.urlForCigarete!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forCigareteAndAlcohol = response.self
                            for i in response.cigarete{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (12, indexForSub):
                    networkService.postRequsetFurniture(url: url.urlForFurniture!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forFurniture = response.self
                            for i in response.furn{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (13, indexForSub):
                    networkService.postRequsetTourismAndRest(url: url.urlForTourismAndRest!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forTourismAndRest = response.self
                            for i in response.tourism{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (14, indexForSub):
                    networkService.postGetSport(url: url.urlForSport!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forSport = response.self
                            for i in response.sport{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (15, indexForSub):
                    networkService.postPetsAndPlants(url: url.urlForPetsAndPlants!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forPetsAndPlants = response.self
                            for i in response.pets{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (16, indexForSub):
                    networkService.postCulture(url: url.urlForCulture!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forCulture = response.self
                            for i in response.culture{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (17, indexForSub):
                    networkService.postWork(url: url.urlForWork!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forWork = response.self
                            for i in response.work{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (18, indexForSub):
                    networkService.postServices(url: url.urlForServices!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forServices = response.self
                            for i in response.service{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (19, indexForSub):
                    networkService.postGetHelathCare(url: url.urlForHelathCare!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forHelathCare = response.self
                            for i in response.helath{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (20, indexForSub):
                    networkService.postGetAcquaintance(url: url.urlForAcquantance!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]){[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forAcquatence = response.self
                            for i in response.acquaint{
                                subId.append(i.id)
                            }
//                            imagesForConstruction()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (21, indexForSub):
                    networkService.postEverything(url: url.urlEverythingElse!, body: ["pageNumber": 1, "adCount": 20, "subCategoryID": subCategoryIdArray[indexForSub]]) {[self] (result)
                        in switch result{
                        case .success(let response):
                            req.forEverythingElse = response.self
                            for i in response.every{
                                subId.append(i.id)
                            }
                            imagesForEverything()
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
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
    
    @IBAction func filter(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "filter") as! FilterDialogVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension RealEstateVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "realEstate", for: indexPath) as! RealEstateColViewCell
        cell.configureUI()
        if let url = URL(string: imageArr[indexPath.row]){
            cell.realImage.af.setImage(withURL: url)
        }
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        vc.indexSub = indexForSub
        vc.indexCategoris = indexForCategoris
        vc.realEstateIndex = indexPath.row
        vc.subIdArr = subId
        vc.collectionIndex = indexPath.row
        vc.tableIndex = indexOfTableViewCell
        vc.generalAdsId = generalId
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension RealEstateVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 250)
    }
}
    
extension RealEstateVC{
    func namesForView(){
        for images in req.forHomeAndGarden.homeAndGarden{
            for imageNames in images.imagesList{
                imageArr.append(imageNames)
            }
        }
    }
    func imagesForReal(){
        for image in req.realEstate.real{
            for imageName in image.imagesList{
                imageArr.append(imageName)
            }
        }
    }
    func imagesForVehicle(){
        for image in req.forVehicle.vehicle{
            for imageName in image.imagesList{
                imageArr.append(imageName)
            }
        }
    }
    func imagesForElectronics(){
        for image in req.forElectronics.electronics{
            for imageName in image.imagesList{
                imageArr.append(imageName)
            }
        }
    }
    func imagesForHouse(){
        for image in req.forHouseOld.house{
            for imageName in image.imagesList{
                imageArr.append(imageName)
            }
        }
    }
    func imagesForConstruction(){
        for image in req.forConstruction.const{
            for imageName in image.imagesList{
                imageArr.append(imageName)
            }
        }
    }
    func imagesForEverything(){
        for image in req.forEverythingElse.every{
            for imageName in image.imagesList{
                imageArr.append(imageName)
            }
        }
    }
}
