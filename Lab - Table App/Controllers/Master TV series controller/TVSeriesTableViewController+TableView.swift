//
//  TVSeriesTableViewController+TableView.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

// MARK: - Table view data source
extension TVSeriesTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serials.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVSeriesCell", for: indexPath)
        let tvSeries = serials[indexPath.row]
        
        configureCell(cell, with: tvSeries)
        
        return cell
    }
    
}

// MARK: - Table view delegate
extension TVSeriesTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
}

// MARK: - Configure cell
extension TVSeriesTableViewController {
    
    private func configureCell(_ cell: UITableViewCell, with tvSeries: TVSeries) {
        
        cell.textLabel?.text = tvSeries.name
        cell.detailTextLabel?.text = tvSeries.ratingStars
        if let dataPoster = tvSeries.poster {
            cell.imageView?.image = UIImage(data: dataPoster)
        }
        
    }
    
}
