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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    private var placesData:[Places] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLoading()
        
        tourismTableView.dataSource = self
        tourismTableView.delegate = self
        tourismTableView.register(
            UINib(nibName: "TourismTableViewCell", bundle: nil),
            forCellReuseIdentifier: "TourismCell"
        )
        
        Api().getPlaces { tourism in
            self.placesData = tourism.places
            self.tourismTableView.reloadData()
            self.hideLoading()
        }
    }
    
    @IBAction func goToProfile(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "moveToProfile", sender: nil)
    }
    
    private func showLoading() {
        loadingIndicator.startAnimating()
        loadingIndicator.isHidden = false
    }
    
    private func hideLoading() {
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: placesData[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail" {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.placeData = sender as? Places
            }
        }
    }
}
