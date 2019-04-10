//
//  TVSeriesDetailViewController.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 10/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

class TVSeriesDetailViewController: UIViewController {
    
    // MARK: ... IBOutlets
    @IBOutlet weak var headStackView: UIStackView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    // MARK: ... Properties
    var tvSeries: TVSeries? {
        didSet {
            guard let tvSeries = tvSeries else { return }
            self.dataPoster = tvSeries.poster
            title = tvSeries.name
        }
    }
    // MARK: ... Private properties
    private var dataPoster: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    private func setupUI() {
        guard let dataPoster = dataPoster else { return }
        
        posterImageView.image = UIImage(data: dataPoster)
        
    }

}

// MARK: - Navigation
extension TVSeriesDetailViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "embedTableViewController" else {
            fatalError(#"Not found segue.identifier == "embedTableViewController""#)
        }
        
        let tvSeriesDetailTableViewController = segue.destination as! TVSeriesDetailTableViewController
        tvSeriesDetailTableViewController.tvSeries = tvSeries
        tvSeries = nil
        
    }
    
}
