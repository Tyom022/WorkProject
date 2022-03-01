//
//  FavouriteVC.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 28.12.21.
//

import UIKit

class FavouriteVC: UIViewController {
    
    

    @IBOutlet weak var favouriteColView: UICollectionView!
    var network = NetworkingService()
    
    var urlFavorite =  "https://api.malls.team/api/Ad/Favorite?userID=100009&culture=am"
    var forFavorite: [FavCategory]?
    var favAds: [FavAd] = [FavAd]()
    var idArray: [Int] = [Int]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        network.requestGetFavourite(urlString: urlFavorite) {[self] (result) in
            switch result{
            case .success(let response):
                forFavorite = response.0
             
                for i in response.0{
                    for j in i.adsFav{
                        favAds.append(j)
                        idArray.append(j.id)
                    }
                }
                print(favAds, "asas")
                DispatchQueue.main.async {
                    favouriteColView.reloadData()
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        favAds.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favouriteColView.delegate = self
        favouriteColView.dataSource = self
    }
}

extension FavouriteVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favAds.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favouriteCell", for: indexPath) as! FavouriteColViewCell
//        cell.exampleLabel.text = forFavorite![indexPath.row]
        let update = favAds[indexPath.row]
        cell.infoLbl.text = update.name
        cell.priceLbl.text = update.adDescription
        if let url = URL(string: update.image){
            cell.favImage.af.setImage(withURL: url)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        vc.adsId = idArray[indexPath.row]
        vc.fav = 1
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 160, height: 180)
        }
}
