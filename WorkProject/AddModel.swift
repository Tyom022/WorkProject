////
////  AddModel.swift
////  WorkProject
////
////  Created by Artyom Arzumanyan on 10.02.22.
////
//
//import Foundation
//
//class AddRealEstate{
//    var real : [AdRealEstate]
//    init(real: [AdRealEstate]){
//        self.real = real
//    }
//}
//
//struct AdRealEstate: Codable {
//    let id, userID, subCategoryID, mainCategoryID: Int
//    let currency, price, salePercent, salePrice: Int
//    let countryName, regionName, cityName: String
//    let country, region, city, state: Int
//    let description, name: String
//    let locationLatitude, locationLongitude: Int
//    let contact: String
//    let aim, owner, view: Int
//    let tags: String
//    let isRegional, isFavorite, isBestPrice: Bool
//    let imagesList: [String]
//    let space, constructionType, paymentTime, rooms: Int
//    let floor: Int
//    
//    init(realEstate: [String:Any]) {
//        id = realEstate["id"] as! Int
//        userID = realEstate["userID"] as! Int
//        subCategoryID = realEstate["subCategoryID"] as! Int
//        mainCategoryID = realEstate["mainCategoryID"] as! Int
//        currency = realEstate["currency"] as! Int
//        price = realEstate["price"] as! Int
//        salePercent = realEstate["salePercent"] as! Int
//        salePrice = realEstate["salePrice"] as! Int
//        countryName = realEstate["countryName"] as! String
//        regionName = realEstate["regionName"] as! String
//        cityName = realEstate["cityName"] as! String
//        country = realEstate["country"] as! Int
//        region = realEstate["region"] as! Int
//        city = realEstate["city"] as! Int
//        state = realEstate["state"] as! Int
//        description = realEstate["description"] as! String
//        name = realEstate["name"] as! String
//        locationLatitude = realEstate["locationLatitude"] as? Int ?? 0
//        locationLongitude = realEstate["locationLongitude"] as? Int ?? 0
//        contact = realEstate["contact"] as! String
//        aim = realEstate["aim"] as! Int
//        owner = realEstate["owner"] as? Int ?? 0
//        view = realEstate["view"] as! Int
//        tags = realEstate["tags"] as! String
//        isRegional = realEstate["isRegional"] as! Bool
//        isFavorite = realEstate["isFavorite"] as! Bool
//        isBestPrice = realEstate["isBestPrice"] as! Bool
//        imagesList = realEstate["imagesList"] as! [String]
//        space = realEstate["space"] as! Int
//        constructionType = realEstate["constructionType"] as? Int ?? 0
//        paymentTime = realEstate["paymentTime"] as? Int ?? 0
//        rooms = realEstate["rooms"] as? Int ?? 0
//        floor = realEstate["floor"] as? Int ?? 0
//    }
//}
//
//class AddForVehicle{
//    var vehicle : [AddVehicle]
//    init(vheicle: [AddVehicle]){
//        self.vehicle = vheicle
//    }
//}
//
//struct AddVehicle : Codable {
//    let id, userID, subCategoryID, mainCategoryID: Int
//    let currency, price, salePercent, salePrice: Int
//    let countryName, regionName, cityName: String
//    let country, region, city, state: Int
//    let vehicleDescription, name: String
//    let locationLatitude, locationLongitude: Int
//    let contact: String
//    let aim, owner, view: Int
//    let tags: String
//    let isRegional, isFavorite, isBestPrice: Bool
//    let imagesList: [String]
//    let mark: Int
//    let sMark: String
//    let model: Int
//    let sModel, productionYear: String
//    let customsCleared: Bool
//    let mileage, engineSize, dEngineSize, bodyType: Int
//    let sBodyType: String
//    let engineType: Int
//    let sEngineType: String
//    let driveType: Int
//    let sDriveType: String
//    let transmissionType: Int
//    let sTransmissionType: String
//    let color: Int
//    let sColor: String
//    let wheel: Int
//    let sWheel: String
//    
//    init(vehicleRes: [String:Any]){
//        id = vehicleRes["id"] as! Int
//        userID = vehicleRes["iuserID"] as? Int ?? 0
//        subCategoryID = vehicleRes["subCategoryID"] as! Int
//        mainCategoryID = vehicleRes["mainCategoryID"] as! Int
//        currency = vehicleRes["currency"] as! Int
//        price = vehicleRes["price"] as! Int
//        salePercent = vehicleRes["salePercent"] as! Int
//        salePrice = vehicleRes["salePrice"] as! Int
//        countryName = vehicleRes["countryName"] as! String
//        regionName = vehicleRes["regionName"] as! String
//        cityName = vehicleRes["cityName"] as! String
//        country = vehicleRes["country"] as! Int
//        region = vehicleRes["region"] as! Int
//        city = vehicleRes["city"] as! Int
//        state = vehicleRes["state"] as! Int
//        vehicleDescription = vehicleRes["vehicleDescription"] as? String ?? ""
//        name = vehicleRes["name"] as! String
//        locationLatitude = vehicleRes["locationLatitude"] as! Int
//        locationLongitude = vehicleRes["locationLongitude"] as! Int
//        contact = vehicleRes["contact"] as! String
//        aim = vehicleRes["aim"] as! Int
//        owner = vehicleRes["owner"] as! Int
//        view = vehicleRes["view"] as! Int
//        tags = vehicleRes["tags"] as! String
//        isRegional = vehicleRes["isRegional"] as! Bool
//        isFavorite = vehicleRes["isFavorite"] as! Bool
//        isBestPrice = vehicleRes["isBestPrice"] as! Bool
//        imagesList = vehicleRes["imagesList"] as! [String]
//        mark = vehicleRes["mark"] as! Int
//        sMark = vehicleRes["sMark"] as! String
//        model = vehicleRes["model"] as! Int
//        sModel = vehicleRes["sModel"] as! String
//        productionYear = vehicleRes["productionYear"] as! String
//        customsCleared = vehicleRes["customsCleared"] as! Bool
//        mileage = vehicleRes["imileaged"] as! Int
//        engineSize = vehicleRes["engineSize"] as! Int
//        dEngineSize = vehicleRes["dEngineSize"] as! Int
//        bodyType = vehicleRes["bodyType"] as! Int
//        sBodyType = vehicleRes["sBodyType"] as! String
//        engineType = vehicleRes["engineType"] as! Int
//        sEngineType = vehicleRes["sEngineType"] as! String
//        driveType = vehicleRes["driveType"] as! Int
//        sDriveType = vehicleRes["sDriveType"] as! String
//        transmissionType = vehicleRes["transmissionType"] as! Int
//        sTransmissionType = vehicleRes["isTransmissionTyped"] as! String
//        color = vehicleRes["color"] as! Int
//        sColor = vehicleRes["sColor"] as! String
//        wheel = vehicleRes["wheel"] as! Int
//        sWheel = vehicleRes["isWheeld"] as! String
//    }
//}
//
//class AddForElectronics{
//    var electronics : [AddElectronics]
//    init(electronics: [AddElectronics]){
//        self.electronics = electronics
//    }
//}
//
//
//struct AddElectronics{
//    let id, userID, subCategoryID, mainCategoryID: Int
//    let currency, price, salePercent, salePrice: Int
//    let countryName, regionName, cityName: String
//    let country, region, city, state: Int
//    let vehicleDescription, name: String
//    let locationLatitude, locationLongitude: Int
//    let contact: String
//    let aim, owner, view: Int
//    let tags: String
//    let isRegional, isFavorite, isBestPrice: Bool
//    let imagesList: [String]
//    let productState: Int
//    
//    init(elect: [String:Any]){
//        id = elect["id"] as! Int
//        userID = elect["userID"] as! Int
//        subCategoryID = elect["subCategoryID"] as! Int
//        mainCategoryID = elect["mainCategoryID"] as! Int
//        currency = elect["currency"] as! Int
//        price = elect["price"] as! Int
//        salePercent = elect["salePercent"] as! Int
//        salePrice = elect["salePrice"] as! Int
//        countryName = elect["countryName"] as! String
//        regionName = elect["regionName"] as! String
//        cityName = elect["cityName"] as! String
//        country = elect["country"] as! Int
//        region = elect["region"] as! Int
//        city = elect["city"] as! Int
//        state = elect["state"] as! Int
//        vehicleDescription = elect["vehicleDescription"] as! String
//        name = elect["name"] as! String
//        locationLatitude = elect["locationLatitude"] as! Int
//        locationLongitude = elect["locationLongitude"] as! Int
//        contact = elect["contact"] as! String
//        aim = elect["aim"] as! Int
//        owner = elect["owner"] as! Int
//        view = elect["view"] as! Int
//        tags = elect["tags"] as! String
//        isRegional = elect["isRegional"] as! Bool
//        isFavorite = elect["isFavorite"] as! Bool
//        isBestPrice = elect["isBestPrice"] as! Bool
//        imagesList = elect["imagesList"] as! [String]
//        productState = elect["productState"] as! Int
//    }
//}
//
//class AddHouse{
//    var house: [AddHouseOldGoods]
//    init(house: [AddHouseOldGoods]){
//        self.house = house
//    }
//}
//
//struct AddHouseOldGoods{
//    let id, userID, subCategoryID, mainCategoryID: Int
//    let currency, price, salePercent, salePrice: Int
//    let countryName, regionName, cityName: String
//    let country, region, city, state: Int
//    let purpleDescription, name: String
//    let locationLatitude, locationLongitude: Int
//    let contact: String
//    let aim, owner, view: Int
//    let tags: String
//    let isRegional, isFavorite, isBestPrice: Bool
//    let imagesList: [String]
//    let productState: Int
//    
//    init(houseOld : [String:Any]) {
//        id = houseOld["id"] as! Int
//        userID = houseOld["userID"] as! Int
//        subCategoryID = houseOld["subCategoryID"] as! Int
//        mainCategoryID = houseOld["mainCategoryID"] as! Int
//        currency = houseOld["currency"] as! Int
//        price = houseOld["price"] as! Int
//        salePercent = houseOld["salePercent"] as! Int
//        salePrice = houseOld["salePrice"] as! Int
//        countryName = houseOld["countryName"] as! String
//        regionName = houseOld["regionName"] as! String
//        cityName = houseOld["cityName"] as! String
//        country = houseOld["country"] as! Int
//        region = houseOld["region"] as! Int
//        city = houseOld["city"] as! Int
//        state = houseOld["state"] as! Int
//        purpleDescription = houseOld["purpleDescription"] as! String
//        name = houseOld["name"] as! String
//        locationLatitude = houseOld["locationLatitude"] as! Int
//        locationLongitude = houseOld["locationLongitude"] as! Int
//        contact = houseOld["contact"] as! String
//        aim = houseOld["aim"] as! Int
//        owner = houseOld["owner"] as! Int
//        view = houseOld["view"] as! Int
//        tags = houseOld["tags"] as! String
//        isRegional = houseOld["isRegional"] as! Bool
//        isFavorite = houseOld["isFavorite"] as! Bool
//        isBestPrice = houseOld["isBestPrice"] as! Bool
//        imagesList = houseOld["imagesList"] as! [String]
//        productState = houseOld["productState"] as! Int
//    }
//}
//
//class AddConstruction{
//    var const: [AddForConstruction]
//    init(const: [AddForConstruction]){
//        self.const = const
//    }
//}
//
//struct AddForConstruction{
//    let id, userID, subCategoryID, mainCategoryID: Int
//    let currency, price, salePercent, salePrice: Int
//    let countryName, regionName, cityName: String
//    let country, region, city, state: Int
//    let purpleDescription, name: String
//    let locationLatitude, locationLongitude: Int
//    let contact: String
//    let aim, owner, view: Int
//    let tags: String
//    let isRegional, isFavorite, isBestPrice: Bool
//    let imagesList: [String]
//    let productState: Int
//    
//    init(construction : [String:Any]) {
//        id = construction["id"] as! Int
//        userID = construction["userID"] as! Int
//        subCategoryID = construction["subCategoryID"] as! Int
//        mainCategoryID = construction["mainCategoryID"] as! Int
//        currency = construction["currency"] as! Int
//        price = construction["price"] as! Int
//        salePercent = construction["salePercent"] as! Int
//        salePrice = construction["salePrice"] as! Int
//        countryName = construction["countryName"] as! String
//        regionName = construction["regionName"] as! String
//        cityName = construction["cityName"] as! String
//        country = construction["country"] as! Int
//        region = construction["region"] as! Int
//        city = construction["city"] as! Int
//        state = construction["state"] as! Int
//        purpleDescription = construction["purpleDescription"] as! String
//        name = construction["name"] as! String
//        locationLatitude = construction["locationLatitude"] as! Int
//        locationLongitude = construction["locationLongitude"] as! Int
//        contact = construction["contact"] as! String
//        aim = construction["aim"] as! Int
//        owner = construction["owner"] as! Int
//        view = construction["view"] as! Int
//        tags = construction["tags"] as! String
//        isRegional = construction["isRegional"] as! Bool
//        isFavorite = construction["isFavorite"] as! Bool
//        isBestPrice = construction["isBestPrice"] as! Bool
//        imagesList = construction["imagesList"] as! [String]
//        productState = construction["productState"] as! Int
//    }
//}
//
//class AddForEverythingElse{
//    var every: [AddEverythingElse]
//    init(every: [AddEverythingElse]){
//        self.every = every
//    }
//}
//
//struct AddEverythingElse{
//    let id, userID, subCategoryID, mainCategoryID: Int
//    let currency, price, salePercent, salePrice: Int
//    let countryName, regionName, cityName: String
//    let country, region, city, state: Int
//    let purpleDescription, name: String
//    let locationLatitude, locationLongitude: Int
//    let contact: String
//    let aim, owner, view: Int
//    let tags: String
//    let isRegional, isFavorite, isBestPrice: Bool
//    let imagesList: [String]
//    
//    init(everything : [String:Any]) {
//        id = everything["id"] as! Int
//        userID = everything["userID"] as! Int
//        subCategoryID = everything["subCategoryID"] as! Int
//        mainCategoryID = everything["mainCategoryID"] as! Int
//        currency = everything["currency"] as! Int
//        price = everything["price"] as! Int
//        salePercent = everything["salePercent"] as! Int
//        salePrice = everything["salePrice"] as! Int
//        countryName = everything["countryName"] as! String
//        regionName = everything["regionName"] as! String
//        cityName = everything["cityName"] as! String
//        country = everything["country"] as! Int
//        region = everything["region"] as! Int
//        city = everything["city"] as! Int
//        state = everything["state"] as! Int
//        purpleDescription = everything["purpleDescription"] as! String
//        name = everything["name"] as! String
//        locationLatitude = everything["locationLatitude"] as! Int
//        locationLongitude = everything["locationLongitude"] as! Int
//        contact = everything["contact"] as! String
//        aim = everything["aim"] as! Int
//        owner = everything["owner"] as! Int
//        view = everything["view"] as! Int
//        tags = everything["tags"] as! String
//        isRegional = everything["isRegional"] as! Bool
//        isFavorite = everything["isFavorite"] as! Bool
//        isBestPrice = everything["isBestPrice"] as! Bool
//        imagesList = everything["imagesList"] as! [String]
//    }
//}
