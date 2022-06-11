//
//  Data.swift
//  TourismApp
//
//  Created by Aldi Dwiki Prahasta on 11/06/22.
//

import Foundation
import UIKit

struct TourismResponse : Codable {
    var error: Bool
    var message: String
    var count: Int
    var places: [Places]
}

struct Places : Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var image: String
}

class Api {
    func getPlaces(completion: @escaping (TourismResponse) -> ()) {
        guard let url = URL(string: "https://tourism-api.dicoding.dev/list") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let tourism = try! JSONDecoder().decode(TourismResponse.self, from: data!)
            
            DispatchQueue.main.async {
                completion(tourism)
            }
        }.resume()
    }
}
