//
//  TourismTableViewCell.swift
//  TourismApp
//
//  Created by Aldi Dwiki Prahasta on 11/06/22.
//

import UIKit

class TourismTableViewCell: UITableViewCell {
    @IBOutlet weak var tourismImageView: UIImageView!
    @IBOutlet weak var tourismLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
