//
//  CarViewCell.swift
//  Carros
//
//  Created by Wladmir  on 23/09/20.
//

import UIKit

class CarViewCell: UITableViewCell {

    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carBrand: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
