//
//  TVSeriesDetailTableViewController+TVSeriesDetailViewControllerDataSource.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import Foundation

extension TVSeriesDetailTableViewController: TVSeriesDetailViewControllerDataSource {
    
    func changedTVSeries(_ series: TVSeries) {
        tvSeries = series
    }
    
}
