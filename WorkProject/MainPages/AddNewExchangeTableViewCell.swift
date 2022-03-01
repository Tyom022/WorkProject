//
//  AddNewExchangeTableViewCell.swift
//  WorkProject
//
//  Created by Artyom Arzumanyan on 14.02.22.
//

import UIKit

class AddNewExchangeTableViewCell: UITableViewCell {

    @IBOutlet weak var whatAddedLabel: UILabel!
    @IBOutlet weak var addPriceTextField: UITextField!
    var array: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addExchangeText(_ sender: Any) {
        array.append(addPriceTextField.text!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
