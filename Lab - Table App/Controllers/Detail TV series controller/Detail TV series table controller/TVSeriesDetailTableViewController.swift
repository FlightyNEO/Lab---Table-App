//
//  TVSeriesDetailTableViewController.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 10/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

class TVSeriesDetailTableViewController: UITableViewController {
    
    // MARK: ... IBOutlets
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var countriesTextView: UITextView!
    @IBOutlet weak var sloganTextView: UITextView!
    @IBOutlet weak var directorsTextView: UITextView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var worldPremiereLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: ... Properties
    var tvSeries: TVSeries? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: ... Life cicles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
}

// MARK: - Private methods
extension TVSeriesDetailTableViewController {
    
    private func updateUI() {
        
        guard let tvSeries = tvSeries else { return }
        
        yearLabel?.text = String(tvSeries.year)
        countriesTextView?.text = tvSeries.country.joined(separator: ", ")
        sloganTextView?.text = tvSeries.slogan
        directorsTextView?.text = tvSeries.director.joined(separator: ", ")
        ratingLabel?.text = tvSeries.ratingStars
        worldPremiereLabel?.text = tvSeries.worldPremiereFormatter
        descriptionTextView?.text = tvSeries.description
    }
    
}
