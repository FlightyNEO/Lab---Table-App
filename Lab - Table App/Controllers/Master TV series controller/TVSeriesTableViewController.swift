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
    var serials: [TVSeries] = []
    
    var selectedIndexPath = IndexPath(row: 0, section: 0)
    
    // MARK: ... Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchSerials()
        
        // setup split view settings
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
        
        // setup split view settings
        if case .pad = UIDevice.current.userInterfaceIdiom {
            splitViewController?.delegate = self
            splitViewController?.preferredDisplayMode = .automatic
        }
    }
    
}

// MARK: - Private methods
extension TVSeriesTableViewController {
    
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
