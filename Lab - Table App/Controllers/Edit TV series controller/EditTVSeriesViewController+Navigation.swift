//
//  EditTVSeriesViewController+Navigation.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

// MARK: - Navigation
extension EditTVSeriesViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "embedTableViewController" else { return }
        
        let tvSeriesDetailTableViewController = segue.destination as! EditTVSeriesTableViewController
        tvSeriesDetailTableViewController.tvSeries = tvSeries
        tvSeriesDetailTableViewController.delegate = self
        
    }
    
//    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
//        print("Unwind tu TV series")
//    }
    
}
