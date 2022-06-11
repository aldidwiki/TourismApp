//
//  DetailViewController.swift
//  TourismApp
//
//  Created by Aldi Dwiki Prahasta on 11/06/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var tourismImage: UIImageView!
    
    var placeData: Places? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let result = placeData {
            tourismImage.kf.setImage(with: URL(string: result.image))
            nameLabel.text = result.name
            descLabel.text = result.description
        }
    }
}
