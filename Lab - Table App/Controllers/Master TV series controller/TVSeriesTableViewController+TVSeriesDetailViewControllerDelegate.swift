//
//  TVSeriesTableViewController+TVSeriesDetailViewControllerDelegate.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import Foundation

// MARK: - TVSeriesDetailViewControllerDelegate
extension TVSeriesTableViewController: TVSeriesDetailViewControllerDelegate {
    
    func didChangeTVSeries(_ series: TVSeries) {
        
        //guard let selectedIndexPath = selectedIndexPath else { return }
        serials[selectedIndexPath.row] = series
        //tableView.reloadData()
        tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        
    }
    
}
