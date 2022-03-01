////
////  LoginWebService.swift
////  WorkProject
////
////  Created by Artyom Arzumanyan on 21.02.22.
////
//
import UIKit

class LoginWebService: BaseNetworkService {

    func sendlogin(userName: String, password: String, completion: @escaping (Result<LoginModel?, Error>) -> ()) {
        let parameter = ["id": 1]
        sendPostRequest(url: URL(string: "https://api.malls.team + login")!, body: parameter) { result in
            switch result {
            case .success(let resonse):
                var loginNames: LoginModel?

                if let items = resonse as? [String: Any] {
                    let name = LoginModel(login: items)
                    loginNames = name
                }
                completion(.success(loginNames))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postExchange(complation: @escaping (Result<Name,Error>) -> ()){
        let parameter = ["pageNumber": 1,"adCount": 1]

        sendPostRequest(url: URL(string: api + "/api/Ad/GetExchange")!, body: parameter) { result in
            switch result{
            case .success(let response):
                var names = [GetExchange]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = GetExchange(res: product)
                        names.append(prop)
                    }
                }
                let price = Name(res: names)
                complation(.success(price))
            case .failure(let error):
                complation(.failure(error))
            }
        }
    }

    func postForHomeNadGarden(completion: @escaping (Result<HomeAndGarden, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
            var forHome = [GetFromHomeAndGardenElement]()
            if let products = response as? [[String: Any]] {
                for product in products {
                    let prop = GetFromHomeAndGardenElement(homeAndGarden: product)
                    forHome.append(prop)
                }
            }
            let forHomeAndGarden = HomeAndGarden(homeAndGarden: forHome)
            completion(.success(forHomeAndGarden))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postRealEstate(completion: @escaping (Result<ForRealEstate, Error>) -> ()){
        let params = ["id": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var realEstate = [RealEstate]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = RealEstate(realEstate: product)
                        realEstate.append(prop)
                    }
                }
               let real = ForRealEstate(real: realEstate)
                completion(.success(real))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postVehicle(completion: @escaping (Result<ForVehicle, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var vehicle = [Vehicle]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = Vehicle(vehicleRes: product)
                        vehicle.append(prop)
                    }
                }
                let veh = ForVehicle(vheicle: vehicle)
                completion(.success(veh))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postElectronics(completion: @escaping (Result<ForElectronics, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var elect = [Electronics]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = Electronics(elect: product)
                        elect.append(prop)
                    }
                }
                let electronic = ForElectronics(electronics: elect)
                completion(.success(electronic))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postHouseOldGoods(completion: @escaping (Result<House, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var houseOldGoods = [HouseOldGoods]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = HouseOldGoods(houseOld: product)
                        houseOldGoods.append(prop)
                    }
                }
                let houseOld = House(house: houseOldGoods)
                completion(.success(houseOld))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postConstruction(completion: @escaping (Result<Construction, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var const = [ForConstruction]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = ForConstruction(construction: product)
                        const.append(prop)
                    }
                }

                let construct = Construction(const: const)
                completion(.success(construct))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postEverything(completion: @escaping (Result<ForEverythingElse, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var every = [EverythingElse]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = EverythingElse(everything: product)
                        every.append(prop)
                    }
                }
                let everyElse = ForEverythingElse(every: every)
                completion(.success(everyElse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postSubCategories(completion: @escaping (Result<SubCategory, Error>) -> ()){
        let index = 0
        let params = ["value": index + 2]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var sub = [SubCateg]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = SubCateg(sub: product)
                        sub.append(prop)
                    }
                }
                let subCate = SubCategory(subCategory: sub)
                completion(.success(subCate))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postSubAppliances(completion: @escaping (Result<SubAppliances, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var applicent = [Appliances]()
                var clothsAndShows = [GetClothsAndShows]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = Appliances(appliance: product)
                        applicent.append(prop)
                    }
                }
                let subAppliances = SubAppliances(appliances: applicent)
                completion(.success(subAppliances))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postSubGetClothsAnd(completion: @escaping (Result<SubGetClothsAndShows, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var clothsAndShows = [GetClothsAndShows]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = GetClothsAndShows(cloths: product)
                        clothsAndShows.append(prop)
                    }
                }
                let subCloths = SubGetClothsAndShows(clotshAndShows: clothsAndShows)
                completion(.success(subCloths))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func postGetForChildren(completion: @escaping (Result<SubGetForChildren, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var childrens = [GetForChildren]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = GetForChildren(child: product)
                        childrens.append(prop)
                    }
                }
                let child = SubGetForChildren(children: childrens)
                completion(.success(child))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postJewelryAndAcces(completion: @escaping (Result<SubGetJewerlyAndAccessories, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var jewerly = [JewerlyAndAccessories]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = JewerlyAndAccessories(jewAndAcces: product)
                        jewerly.append(prop)
                    }
                }
                let jew = SubGetJewerlyAndAccessories(jewerly: jewerly)
                completion(.success(jew))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postRequsetFoodAndDrink(completion: @escaping (Result<SubGetFoodAndDrink, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var food = [FoodAndDrink]()

                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = FoodAndDrink(foodAndDrink: product)
                        food.append(prop)
                    }
                }
               let foodAndDrink = SubGetFoodAndDrink(food: food)
                completion(.success(foodAndDrink))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postRequsetCigareteAndDrink(completion: @escaping (Result<SubSigareteAndAlcohole, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var cigarete = [CigareteAndAlcohole]()

                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = CigareteAndAlcohole(cigarete: product)
                        cigarete.append(prop)
                    }
                }
               let cigareteAndAlcohole = SubSigareteAndAlcohole(cigarete: cigarete)
                completion(.success(cigareteAndAlcohole))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postRequsetFurniture(completion: @escaping (Result<SubGetFurniture, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var furn = [Furniture]()

                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = Furniture(furnit: product)
                        furn.append(prop)
                    }
                }
               let getFurniture = SubGetFurniture(furn: furn)
                completion(.success(getFurniture))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postRequsetTourismAndRest(completion: @escaping (Result<SubTourismAndRest, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var tourism = [TourismAndRest]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = TourismAndRest(tourismAndRest: product)
                        tourism.append(prop)
                    }
                }
               let tourismAndRest = SubTourismAndRest(tourism: tourism)
                completion(.success(tourismAndRest))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func postGetSport(completion: @escaping (Result<SubSport, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var sport = [Sport]()

                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = Sport(getSport: product)
                        sport.append(prop)
                    }
                }
               let getSport = SubSport(sport: sport)
                completion(.success(getSport))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func postPetsAndPlants(completion: @escaping (Result<SubPetsAndPlants, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var pets = [PetsAndPlants]()

                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = PetsAndPlants(petsAndPlants: product)
                        pets.append(prop)
                    }
                }
               let petsAndPlants = SubPetsAndPlants(pets: pets)
                completion(.success(petsAndPlants))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func postCulture(completion: @escaping (Result<SubCulture, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var culture = [Cultre]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = Cultre(forCulture: product)
                        culture.append(prop)
                    }
                }
               let forCulture = SubCulture(culture: culture)
                completion(.success(forCulture))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func postWork(completion: @escaping (Result<SubWork, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var work = [Work]()
                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = Work(forWork: product)
                        work.append(prop)
                    }
                }
               let forWork = SubWork(work: work)
                completion(.success(forWork))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func postServices(completion: @escaping (Result<SubServices, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var service = [Services]()

                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = Services(forService: product)
                        service.append(prop)
                    }
                }
               let forService = SubServices(service: service)
                completion(.success(forService))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func postGetHelathCare(completion: @escaping (Result<SubGetHealtCare, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var health = [HelathCare]()

                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = HelathCare(healthCare: product)
                        health.append(prop)
                    }
                }
               let helathCare = SubGetHealtCare(helath: health)
                completion(.success(helathCare))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func postGetAcquaintance(completion: @escaping (Result<SubGetAcquaintance, Error>) -> ()){
        let params = ["id": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var acquaint = [Acquaintance]()

                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = Acquaintance(forAcquaint: product)
                        acquaint.append(prop)
                    }
                }
               let forAcquaint = SubGetAcquaintance(acquaint: acquaint)
                completion(.success(forAcquaint))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func requestPostFavourite(completion: @escaping (Result<PostFavourite, Error>) -> ()){
        let params = ["id": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var favModel = [FavoriteModel]()

                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = FavoriteModel(favModel: product)
                        favModel.append(prop)
                    }
                }
               let favorite = PostFavourite(favor: favModel)
                completion(.success(favorite))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func addExchange(completion: @escaping (Result<AddNewExchange, Error>) -> ()){
        let params = ["pageNumber": 1,"adCount": 1]
        sendPostRequest(url: URL(string: api + "")!, body: params) { result in
            switch result{
            case .success(let response):
                var adModel = [NewExchange]()

                if let products = response as? [[String: Any]] {
                    for product in products {
                        let prop = NewExchange(add: product)
                        adModel.append(prop)
                    }
                }
               let add = AddNewExchange(addModel: adModel)
                completion(.success(add))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
