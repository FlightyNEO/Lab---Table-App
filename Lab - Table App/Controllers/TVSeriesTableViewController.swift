//
//  TVSeriesTableViewController.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 10/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

class TVSeriesTableViewController: UITableViewController {
    
    // MARK: ... Private properties
    
    private var serverManager = { return ServerManager.manager }()
    
    private var serials: [TVSeries] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchSerials()
        
        if case .phone = UIDevice.current.userInterfaceIdiom {
            splitViewController?.delegate = self
            splitViewController?.preferredDisplayMode = .automatic
        }
        if case .pad = UIDevice.current.userInterfaceIdiom {
            performSegue(withIdentifier: "showDetail", sender: nil)
        }
        
        self.clearsSelectionOnViewWillAppear = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if case .pad = UIDevice.current.userInterfaceIdiom {
            splitViewController?.delegate = self
            splitViewController?.preferredDisplayMode = .automatic
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func fetchSerials() {
        serverManager.fetchTVSerials { result in
            switch result {
            case .success(let tvSeries):
                self.serials = tvSeries
            case .failure(let error):   // LOAD ERROR
                print(error.localizedDescription)
            }
        }
    }
    
}

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

// MARK: - Configure cell
extension TVSeriesTableViewController {
    
    func configureCell(_ cell: UITableViewCell, with tvSeries: TVSeries) {
        
        cell.textLabel?.text = tvSeries.name
        cell.detailTextLabel?.text = tvSeries.ratingStars
        if let dataPoster = tvSeries.poster {
            cell.imageView?.image = UIImage(data: dataPoster)
        }
        
    }
    
}

// MARK: - Navigation
extension TVSeriesTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "showDetail" else {
            fatalError("Not found segue.identifier == showDetail")
        }
        
        let tvSeriesDetailViewController = (segue.destination as! UINavigationController).topViewController as! TVSeriesDetailViewController
        
        let row = tableView.indexPathForSelectedRow?.row ?? 0
        
        tvSeriesDetailViewController.tvSeries = serials[row]
        
    }
    
}

// MARK: - Split view controller delegate
extension TVSeriesTableViewController: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
}
