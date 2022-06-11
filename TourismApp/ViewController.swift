//
//  ViewController.swift
//  TourismApp
//
//  Created by Aldi Dwiki Prahasta on 11/06/22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tourismTableView: UITableView!
    
    private var placesData:[Places] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tourismTableView.dataSource = self
        self.tourismTableView.register(
            UINib(nibName: "TourismTableViewCell", bundle: nil),
            forCellReuseIdentifier: "TourismCell"
        )
        
        Api().getPlaces { tourism in
            self.placesData = tourism.places
            self.tourismTableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TourismCell", for: indexPath) as? TourismTableViewCell {
            
            let place = placesData[indexPath.row]
            cell.tourismLabel.text = place.name
            cell.tourismImageView.kf.setImage(with: URL(string: place.image))
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
