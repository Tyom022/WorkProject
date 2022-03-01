//
//  RealEstateColViewCell.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 10.01.22.
//

import UIKit

class RealEstateColViewCell: UICollectionViewCell {

    @IBOutlet weak var realImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var ads: Ads?
    var forChild: SubGetForChildren!
    func configureUI(){
        if let url = URL(string:  ads?.image ?? "" ) {
            realImage.af.setImage(withURL: url)
        }
        price.text = ads?.name ?? "ads Name"
//        priceLbl.text = "\(ads?.userID ?? 0)"
//        placeLbl.text = "\(ads?.state ?? 0)"
//        destinationLbl.text = "\(ads?.id ?? 0)"
//        contactLbl.text = "\(ads?.owner)"
//        conditionLbl.text = "\(ads?.categoryID ?? 0)"
        descriptionLabel.text = ads?.adDescription ?? "description for ads"
//        configureFavouriteButton()
    }
    
    func config(get: Any?){
        print("asds")
    }
}
