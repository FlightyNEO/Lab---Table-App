//
//  TVSeriesDetailTableViewController+YearChoosingViewControllerDelegate.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import Foundation

// MARK: - Year choosing view controller delegate
extension EditTVSeriesTableViewController: RatingChoosingViewControllerDelegate {
    
    func ratingDidChanged(value: Float) {
        tvSeries?.rating = value
    }
    
}
