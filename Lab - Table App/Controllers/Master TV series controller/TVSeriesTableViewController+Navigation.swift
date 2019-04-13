//
//  TVSeriesTableViewController+Navigation.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

// MARK: - Navigation
extension TVSeriesTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
            
        case "showDetail":
            
            let tvSeriesDetailViewController = (segue.destination as! UINavigationController).topViewController as! TVSeriesDetailViewController
            
            let row = tableView.indexPathForSelectedRow?.row ?? 0
            
            tvSeriesDetailViewController.tvSeries = serials[row]
            tvSeriesDetailViewController.delegate = self
            
        case "editSeries":
            
            print("editSeries")
            
        default:
            fatalError("Not found segue.identifier")
        }
        
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        print("Unwind to table")
    }
    
}
