//
//  EditTVSeriesViewController+EditTVSeriesTableViewControllerDelegate.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import Foundation

// MARK: - EditTVSeriesTableViewControllerDelegate
extension EditTVSeriesViewController: EditTVSeriesTableViewControllerDelegate {
    
    func didChangeTVSeries(_ series: TVSeries) {
        tvSeries = series
    }
    
}
