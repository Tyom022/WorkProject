//
//  DetailVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 27.12.21.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    @IBOutlet weak var imagePagenationColView: UICollectionView!
    
//    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var saveButton: UIButton!
    
    var tableIndex : Int!
    var collectionIndex : Int!
    var indexCategoris: Int!
    var indexSub: Int!
    var realEstateIndex: Int!
    var networkService = NetworkingService()
    
    var adsId: Int!
    var generalAdsId: [Int] = [Int]()
    var subIdArr: [Int] = [Int]()
    
    var urls = AllUrlsGet()
    var reqMod = RequstModel()
    
    var tableViewNamesArray = ["Mark","Price", "vichak", "guyn","ogtagorcac","Mark","Price", "vichak", "guyn","ogtagorcac","Mark","Price", "vichak", "guyn","ogtagorcac","Mark","Price", "vichak"]
    
    var imageArr: [String] = []
    var items: [Any] = []
    var detailArr: [Any] = []
    var idArray: [Int] = []
    var parseIdArray:[Int] = []
    var thisWidth:CGFloat = 0
    var favToDetail = LoginWebService()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        informationRequest()
        subGoToDetail()
        favouriteToDetail()
        thisWidth = CGFloat(self.view.frame.width)
        imagePagenationColView.delegate = self
        imagePagenationColView.dataSource = self
//        pageController.currentPage = 0
//        pageController.numberOfPages = imageArr.count
    }
    
    func reloadView(){
        DispatchQueue.main.async {
            self.imagePagenationColView.reloadData()
            self.detailTableView.reloadData()
        }
    }
        
    func informationRequest(){
        if let firstIndex = tableIndex{
           
            switch (tableIndex,collectionIndex){
            case (0,collectionIndex):
                networkService.postRealEstate(url: urls.urlForRealEstate!, body:["id": adsId ?? generalAdsId[collectionIndex]]) {[self] (result)
                    in switch result{
                    case .success(let response):
                        var information = response.self
                        
                        for detail in information.real{
                            detailArr.append(detail)
                        }
                        reqMod.realEstate = detailArr[0] as? ForRealEstate
                        
                        for image in information.real{
                            for imageName in image.imagesList{
                                imageArr.append(imageName)
                            }
                        }
                        
                        reqMod.realEstate = response.self
                        realItemsInCell()
                        reloadView()
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (1,collectionIndex):
                networkService.postVehicle(url: urls.urlVehicle!, body: ["id": adsId ?? generalAdsId[collectionIndex]]){[self] (result)
                    in switch result{
                    case .success(let response):
                        var information = response.self
                        for detail in information.vehicle{
                            detailArr.append(detail)
                        }
                        reqMod.forVehicle = detailArr[0] as? ForVehicle
                        
                        for image in information.vehicle{
                            for imageName in image.imagesList{
                                imageArr.append(imageName)
                            }
                        }
                        reqMod.forVehicle = response.self
                        vehicleItemsInCell()
                        reloadView()
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (2,collectionIndex):
                networkService.postElectronics(url: urls.urlElectronics!, body: ["id": adsId ?? generalAdsId[collectionIndex]]) {[self] (result)
                    in switch result{
                    case .success(let response):
                        
                        var information = response.self
                        
                        for detail in information.electronics{
                            detailArr.append(detail)
                        }
                        reqMod.forElectronics = detailArr[0] as? ForElectronics
                        
                        for image in information.electronics{
                            for imageName in image.imagesList{
                                imageArr.append(imageName)
                            }
                        }
                        
                        reqMod.forElectronics = response.self
                        electronicItemsInCell()
                        reloadView()
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (3,collectionIndex):
                networkService.postHouseOldGoods(url: urls.urlHouseOldGoods!, body: ["id": adsId ?? generalAdsId[collectionIndex]]){[self] (result)
                    in switch result{
                    case .success(let response):
                        
                        var information = response.self
                        
                        for detail in information.house{
                            detailArr.append(detail)
                        }
                        reqMod.forHouseOld = detailArr[0] as? House
                        
                        for image in information.house{
                            for imageName in image.imagesList{
                                imageArr.append(imageName)
                            }
                        }
                        
                        reqMod.forHouseOld = response.self
                        appliancesItemsInCell()
                        reloadView()
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (4,collectionIndex):
                networkService.postConstruction(url: urls.urlConstruction!, body:  ["id": adsId ?? generalAdsId[collectionIndex]]){[self] (result)
                    in switch result{
                    case .success(let response):
                        var information = response.self
                        
                        for detail in information.const{
                            detailArr.append(detail)
                        }
                        reqMod.forConstruction = detailArr[0] as! Construction
                        
                        for image in information.const{
                            for imageName in image.imagesList{
                                imageArr.append(imageName)
                            }
                        }
                        
                        reqMod.forConstruction = response.self
                        constructionItemsInCell()
                        reloadView()
                        break
                    case .failure(let error):
                        print("error", error)
                    }
                }
            case (5,collectionIndex):
                networkService.postEverything(url: urls.urlEverythingElse!, body: ["id": adsId ?? generalAdsId[collectionIndex]]) {[self] (result)
                    in switch result{
                    case .success(let response):
                        var information = response.self
                        
                        for detail in information.every{
                            detailArr.append(detail)
                        }
                        reqMod.forEverythingElse = detailArr[0] as! ForEverythingElse
                        
                        for image in information.every{
                            for imageName in image.imagesList{
                                imageArr.append(imageName)
                            }
                        }
                        reqMod.forEverythingElse = response.self
                        everythingItemsInCell()
                        reloadView()
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
    
    var nameOfFavouriteBtn = "heart"
    @IBAction func favouriteBtn(_ sender: Any) {
        if nameOfFavouriteBtn == "heart" {
            nameOfFavouriteBtn = "selected_heart"
            saveButton.setImage(UIImage(named: "selected_heart")?.withRenderingMode(.alwaysOriginal), for: .normal)
            networkService.requestPostFavourite(url: urls.urlForFaovourite!, body: ["userID": 100009, "adID": adsId ?? subIdArr[collectionIndex]]) {[self] (result) in
                switch result{
                case .success(let response):
                    reqMod.forFavourite = response.self
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        } else {
            nameOfFavouriteBtn = "heart"
            saveButton.setImage(UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal), for: .normal)
            networkService.deleteFavorite(url: urls.urlDeleteFavorite!)
            {[self] (result) in
                switch result{
                case .success(let response):
                    reqMod.deleteFav = response.self
                    break
                case .failure(let error):
                    print("error", error)
                }
            }
        }
    }
    var fav = 0
    func favouriteToDetail(){
        if fav == 1{
            favToDetail.postRealEstate() { [self] (result) in
                switch result{
                case .success(let response):
                    print("A")
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func subGoToDetail(){
        if let cateIndex = indexCategoris{
            switch (cateIndex,indexSub,realEstateIndex) {
                case (0, indexSub, realEstateIndex):
                networkService.postRealEstate(url: urls.urlForRealEstate!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]) {[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.real{
                                detailArr.append(detail)
                            }
                            reqMod.realEstate = detailArr[0] as? ForRealEstate

                            for image in inform.real{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.realEstate = response.self
                            realItemsInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (1, indexSub,realEstateIndex):
                networkService.postVehicle(url: urls.urlVehicle!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.vehicle{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.vehicle{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forVehicle = response.self
                            vehicleItemsInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (2, indexSub,realEstateIndex):
                    networkService.postElectronics(url: urls.urlElectronics!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]) {[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.electronics{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.electronics{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forElectronics = response.self
                            electronicItemsInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (3, indexSub,realEstateIndex):
                    networkService.postSubAppliances(url: urls.subAppliances!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.appliances{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.appliances{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forAppliance = response.self
                            appliancesItemsInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (4, indexSub,realEstateIndex):
                    networkService.postHouseOldGoods(url: urls.urlHouseOldGoods!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.house{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.house{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forHouseOld = response.self
                            houseGoodsItemsInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (5, indexSub,realEstateIndex):
                    networkService.postSubGetClothsAnd(url: urls.urlForCloths!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.clotshAndShows{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.clotshAndShows{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forCloths = response.self
                            clothsItemsInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (6, indexSub,realEstateIndex):
                networkService.postGetForChildren(url: urls.urlForChild!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.children{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.children{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forChild = response.self
                            forChildrenInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (7, indexSub,realEstateIndex):
                networkService.postJewelryAndAcces(url: urls.urlJewerly!, body:  ["id": subIdArr[realEstateIndex], "pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.jewerly{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.jewerly{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forJewerly = response.self
                            jewelryInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (8, indexSub,realEstateIndex):
                    networkService.postConstruction(url: urls.urlConstruction!, body:  ["id": subIdArr[realEstateIndex], "pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.const{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.const{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forConstruction = response.self
                            constructionItemsInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (9, indexSub,realEstateIndex):
                    networkService.postRequsetForHomeAndGarden(url: urls.urlForHomeAndGaren!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.homeAndGarden{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.homeAndGarden{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forHomeAndGarden = response.self
                            homeAndGardenInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (10, indexSub,realEstateIndex):
                    networkService.postRequsetFoodAndDrink(url: urls.urlFoodAndDrink!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.food{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.food{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forFoodAndDrink = response.self
                            drinksInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (11, indexSub,realEstateIndex):
                    networkService.postRequsetCigareteAndDrink(url: urls.urlForCigarete!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.cigarete{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.cigarete{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forCigareteAndAlcohol = response.self
                            cigareteInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (12, indexSub,realEstateIndex):
                    networkService.postRequsetFurniture(url: urls.urlForFurniture!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.furn{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.furn{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forFurniture = response.self
                            furnitureInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (13, indexSub,realEstateIndex):
                    networkService.postRequsetTourismAndRest(url: urls.urlForTourismAndRest!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.tourism{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.tourism{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forTourismAndRest = response.self
                            tourismInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (14, indexSub,realEstateIndex):
                    networkService.postGetSport(url: urls.urlForSport!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.sport{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.sport{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forSport = response.self
                            sportInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (15, indexSub,realEstateIndex):
                    networkService.postPetsAndPlants(url: urls.urlForPetsAndPlants!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.pets{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.pets{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forPetsAndPlants = response.self
                            petsInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (16, indexSub,realEstateIndex):
                    networkService.postCulture(url: urls.urlForCulture!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.culture{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.culture{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forCulture = response.self
                            cultureInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (17, indexSub,realEstateIndex):
                    networkService.postWork(url: urls.urlForWork!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.work{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.work{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forWork = response.self
                            workInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (18, indexSub,realEstateIndex):
                    networkService.postServices(url: urls.urlForServices!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result) in
                        switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.service{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.service{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forServices = response.self
                            serviceInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (19, indexSub,realEstateIndex):
                    networkService.postGetHelathCare(url: urls.urlForHelathCare!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.helath{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.helath{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forHelathCare = response.self
                            healthInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (20, indexSub,realEstateIndex):
                    networkService.postGetAcquaintance(url: urls.urlForAcquantance!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]){[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.acquaint{
                                detailArr.append(detail)
                            }
                            
                            for image in inform.acquaint{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forAcquatence = response.self
                            acquantanceInCell()
                            reloadView()
                            break
                        case .failure(let error):
                            print("error", error)
                        }
                    }
                case (21, indexSub,realEstateIndex):
                    networkService.postEverything(url: urls.urlEverythingElse!, body: ["id": subIdArr[realEstateIndex],"pageNumber": 1, "adCount": 20, "subCategoryID": indexSub]) {[self] (result)
                        in switch result{
                        case .success(let response):
                            var inform = response.self
                            
                            for detail in inform.every{
                                detailArr.append(detail)                                
                            }
                            
                            for image in inform.every{
                                for imageName in image.imagesList{
                                    imageArr.append(imageName)
                                }
                            }
                            reqMod.forEverythingElse = response.self
                            everythingItemsInCell()
                            reloadView()
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

extension DetailVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imagePagenationColView.dequeueReusableCell(withReuseIdentifier: "pagination", for: indexPath) as! ImagePagenationCell
        
        if let url = URL(string: imageArr[indexPath.row]){
            cell.mainPicture.af.setImage(withURL: url)
        }
        
        return cell
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        cell.pageController.currentPage = indexPath.section
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        thisWidth = CGFloat(self.view.frame.width)
        return CGSize(width: thisWidth, height: self.view.frame.height)
    }
}

extension DetailVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTableView.dequeueReusableCell(withIdentifier: "detailCell") as! DetailTableViewCell
        cell.valueLbl.text = items[indexPath.row] as? String
        cell.nameLbl.text = tableViewNamesArray[indexPath.row]
        return cell
    }
}

//MARK: - ConfigureUI
extension DetailVC{
    
    func realItemsInCell(){
        for item in reqMod.realEstate.real{
            items.append(item.name)
            items.append(String(item.space))
            items.append(String(item.constructionType))
            items.append(String(item.rooms))
            items.append(String(item.floor))
            items.append(String(item.price))
            items.append(String(item.salePrice))
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(String(item.country))
            items.append(String(item.region))
            items.append(String(item.city))
            items.append(item.description)
            items.append(String(item.locationLatitude))
            items.append(String(item.locationLongitude))
            items.append(item.contact)
            items.append(item.tags)
        }
     }
    
    func imagesForVehicle(){
        for image in reqMod.forVehicle.vehicle{
            for imageName in image.imagesList{
                imageArr.append(imageName)
            }
        }
    }
    
    func vehicleItemsInCell(){
        for item in reqMod.forVehicle.vehicle{
            items.append(item.name)
//            items.append(String(item.space))
//            items.append(String(item.constructionType))
//            items.append(String(item.rooms))
//            items.append(String(item.floor))
            items.append(String(item.price))
            items.append(String(item.salePrice))
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(String(item.country))
            items.append(String(item.region))
            items.append(String(item.city))
//            items.append(item.description)
            items.append(String(item.locationLatitude))
            items.append(String(item.locationLongitude))
            items.append(item.contact)
            items.append(item.tags)
        }
     }
    
    func imagesForElectronic(){
        for image in reqMod.forElectronics.electronics{
            for imageName in image.imagesList{
                imageArr.append(imageName)
            }
        }
    }
    
    func electronicItemsInCell(){
        for item in reqMod.forElectronics.electronics{
            items.append(item.name)
//            items.append(String(item.space))
//            items.append(String(item.constructionType))
//            items.append(String(item.rooms))
//            items.append(String(item.floor))
            items.append(String(item.price))
            items.append(String(item.salePrice))
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(String(item.country))
            items.append(String(item.region))
            items.append(String(item.city))
//            items.append(item.description)
            items.append(String(item.locationLatitude))
            items.append(String(item.locationLongitude))
            items.append(item.contact)
            items.append(item.tags)
        }
     }
    
    func imagesForAppliances(){
        for image in reqMod.forHouseOld.house{
            for imageName in image.imagesList{
                imageArr.append(imageName)
            }
        }
    }
    
    func appliancesItemsInCell(){
        for item in reqMod.forHouseOld.house{
            items.append(item.name)
//            items.append(String(item.space))
//            items.append(String(item.constructionType))
//            items.append(String(item.rooms))
//            items.append(String(item.floor))
            items.append(String(item.price))
            items.append(String(item.salePrice))
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(String(item.country))
            items.append(String(item.region))
            items.append(String(item.city))
//            items.append(item.description)
            items.append(String(item.locationLatitude))
            items.append(String(item.locationLongitude))
            items.append(item.contact)
            items.append(item.tags)
        }
     }
    
    func houseGoodsItemsInCell(){
        for item in reqMod.forHouseOld.house{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func clothsItemsInCell(){
        for item in reqMod.forCloths.clotshAndShows{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func forChildrenInCell(){
        for item in reqMod.forChild.children{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func jewelryInCell(){
        for item in reqMod.forJewerly.jewerly{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func imagesForConstruction(){
        for image in reqMod.forConstruction.const{
            for imageName in image.imagesList{
                imageArr.append(imageName)
            }
        }
    }
    
    func constructionItemsInCell(){
        for item in reqMod.forConstruction.const{
            items.append(item.name)
//            items.append(String(item.space))
//            items.append(String(item.constructionType))
//            items.append(String(item.rooms))
//            items.append(String(item.floor))
            items.append(String(item.price))
            items.append(String(item.salePrice))
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(String(item.country))
            items.append(String(item.region))
            items.append(String(item.city))
//            items.append(item.description)
            items.append(String(item.locationLatitude))
            items.append(String(item.locationLongitude))
            items.append(item.contact)
            items.append(item.tags)
        }
     }
    
    func homeAndGardenInCell(){
        for item in reqMod.forHomeAndGarden.homeAndGarden{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func drinksInCell(){
        for item in reqMod.forFoodAndDrink.food{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func cigareteInCell(){
        for item in reqMod.forCigareteAndAlcohol.cigarete{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func furnitureInCell(){
        for item in reqMod.forFurniture.furn{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func tourismInCell(){
        for item in reqMod.forTourismAndRest.tourism{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func sportInCell(){
        for item in reqMod.forSport.sport{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func petsInCell(){
        for item in reqMod.forPetsAndPlants.pets{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func cultureInCell(){
        for item in reqMod.forCulture.culture{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func workInCell(){
        for item in reqMod.forWork.work{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func serviceInCell(){
        for item in reqMod.forServices.service{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func healthInCell(){
        for item in reqMod.forHelathCare.helath{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func acquantanceInCell(){
        for item in reqMod.forAcquatence.acquaint{
            items.append(item.name)
            items.append(item.price)
            items.append(item.salePrice)
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(item.locationLatitude)
            items.append(item.locationLongitude)
            items.append(item.contact)
            items.append(item.tags)
        }
    }
    
    func imagesForEvrything(){
        for image in reqMod.forEverythingElse.every{
            for imageName in image.imagesList{
                imageArr.append(imageName)
            }
        }
    }
    
    func everythingItemsInCell(){
        for item in reqMod.forEverythingElse.every{
            items.append(item.name)
//            items.append(String(item.space))
//            items.append(String(item.constructionType))
//            items.append(String(item.rooms))
//            items.append(String(item.floor))
            items.append(String(item.price))
            items.append(String(item.salePrice))
            items.append(item.countryName)
            items.append(item.regionName)
            items.append(item.cityName)
            items.append(String(item.country))
            items.append(String(item.region))
            items.append(String(item.city))
//            items.append(item.description)
            items.append(String(item.locationLatitude))
            items.append(String(item.locationLongitude))
            items.append(item.contact)
            items.append(item.tags)
        }
     }
}
