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
    @IBOutlet weak var countriesLabel: UILabel!
    @IBOutlet weak var sloganLabel: UILabel!
    @IBOutlet weak var directorsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var worldPremiereLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    // MARK: ... Properties
    var tvSeries: TVSeries?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        guard let tvSeries = tvSeries else { return }
        
        yearLabel.text = String(tvSeries.year)
        countriesLabel.text = tvSeries.country.joined(separator: ", ")
        sloganLabel.text = tvSeries.slogan
        directorsLabel.text = tvSeries.director.joined(separator: ", ")
        ratingLabel.text = tvSeries.ratingStars
        worldPremiereLabel.text = tvSeries.worldPremiereFormatter
        descriptionLabel.text = tvSeries.description
        
    }

}

// MARK: - Table view delegate
extension TVSeriesDetailTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
