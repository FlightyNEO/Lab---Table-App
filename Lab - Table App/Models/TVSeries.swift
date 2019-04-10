//
//  TVSeries.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 10/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import Foundation

struct TVSeries {
    var name: String
    var poster: Data?
    var year: Int
    var country: [String]
    var slogan: String
    var director: [String]
    var description: String
    
    private(set) var rating: Float
    private(set) var worldPremiere: TimeInterval

    init(name: String, poster: Data?, year: Int, country: [String], slogan: String, director: [String], description: String, rating: Float, worldPremiere: TimeInterval) {
        
        self.name = name
        self.poster = poster
        self.year = year
        self.country = country.sorted()
        self.slogan = slogan
        self.director = director.sorted()
        self.description = description
        self.rating = rating
        self.worldPremiere = worldPremiere
        
    }

}

// MARK: - Comparable
extension TVSeries: Comparable {
    static func < (lhs: TVSeries, rhs: TVSeries) -> Bool {
        return lhs.worldPremiere < rhs.worldPremiere
    }
}

// MARK: - Computed properties
extension TVSeries {
    
    var ratingStars: String {
        return Array(repeating: "⭐️", count: Int(rating)).joined()
    }
    
    var worldPremiereFormatter: String {
        let date = Date(timeIntervalSince1970: worldPremiere)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        //dateFormatter.dateFormat = "dd MMM, HH:mm"
        
        return dateFormatter.string(from: date)
    }
}
