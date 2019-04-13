//
//  TVSeriesDetailViewController+Navigation.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

// MARK: - Navigation
extension TVSeriesDetailViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
            
        case "embedTableViewController":
            
            let tvSeriesDetailTableViewController = segue.destination as! TVSeriesDetailTableViewController
            tvSeriesDetailTableViewController.tvSeries = tvSeries
            
            dataSource = tvSeriesDetailTableViewController
            
        case "editSeries":
            
            let editTVSeriesViewController = segue.destination as! EditTVSeriesViewController
            editTVSeriesViewController.tvSeries = tvSeries
            
        default:
            fatalError("Not found segue.identifier")
        }
        
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
        switch unwindSegue.identifier {
        case "saveAndCancelUnwind":
            
            let sourceViewController = unwindSegue.source as! EditTVSeriesViewController
            tvSeries = sourceViewController.tvSeries
            
            
            
        case "cancelUnwind":
            break
        default:
            break
        }
        
        print("Unwind tu TV series")
    }
    
}
