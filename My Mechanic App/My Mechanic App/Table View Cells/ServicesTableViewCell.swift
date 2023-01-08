//
//  ServicesTableViewCell.swift
//  My Mechanic App
//
//  Created by M.A on 07/01/2022.
//

import UIKit

class ServicesTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
