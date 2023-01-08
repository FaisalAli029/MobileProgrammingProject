//
//  MyCarTableViewCell.swift
//  My Mechanic App
//
//  Created by TeryakiiSauce on 06/01/2023.
//

import UIKit

class MyCarTableViewCell: UITableViewCell {

    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var modelTitleLabel: UILabel!
    @IBOutlet weak var licensePlateLabel: UILabel!
    @IBOutlet weak var licensePlateTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
