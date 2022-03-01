//
//  MainPageTableViewCell.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 13.01.22.
//

import UIKit

protocol TableViewCellDelegate: class {
    func selectCell(cell: MainPageTableViewCell, indexPath: IndexPath)
}

class MainPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var sectionText: UILabel!
    
    weak var delegate: TableViewCellDelegate?
    var network : NetworkingService?
    
    var search = false
    var result : [Ads] = [Ads]()
    var sectionModel : Category?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(section: Category, searching: Bool, res: [Ads]){
        self.sectionModel = section
        self.search = searching
        self.result = res
        mainCollectionView.reloadData()
    }
}

extension MainPageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if search{
            return result.count
        }else{
            return sectionModel?.ads.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "mainColCell", for: indexPath) as! MyColViewCell
        if search{
            let update = result[indexPath.row]
            cell.priceLbl.text = update.name
            cell.aboutLbl.text = update.adDescription
            if let url = URL(string: update.image){
                cell.imageView.af.setImage(withURL: url)
            }
        }else{
            let model = sectionModel?.ads[indexPath.row]
            cell.priceLbl.text = model?.name
            cell.aboutLbl.text = model?.adDescription
            if let url = URL(string: model?.image ?? "") {
                cell.imageView.af.setImage(withURL:url)
            }
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectCell(cell: self, indexPath: indexPath)
    }

}
