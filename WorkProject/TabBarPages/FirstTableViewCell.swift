//
//  FirstTableViewCell.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 08.02.22.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firrstNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("text"), object: nil)

    }
    @objc func didGetNotification(_ notification: Notification){
        let name = notification.object as! String
        firrstNameLbl.text = name
    }
}
