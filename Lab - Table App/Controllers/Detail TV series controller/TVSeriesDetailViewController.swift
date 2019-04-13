//
//  TVSeriesDetailViewController.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 10/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

protocol TVSeriesDetailViewControllerDataSource: class {
    func changedTVSeries(_ series: TVSeries)
}

protocol TVSeriesDetailViewControllerDelegate: class {
    func didChangeTVSeries(_ series: TVSeries)
}

class TVSeriesDetailViewController: UIViewController {
    
    // MARK: ... IBOutlets
    @IBOutlet weak var headStackView: UIStackView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    // MARK: ... Properties
    weak var dataSource: TVSeriesDetailViewControllerDataSource?
    weak var delegate: TVSeriesDetailViewControllerDelegate?
    var tvSeries: TVSeries? {
        didSet {
            guard let tvSeries = tvSeries else { return }
            //self.dataPoster = tvSeries.poster
            title = tvSeries.name
            updateUI()
            dataSource?.changedTVSeries(tvSeries)
            delegate?.didChangeTVSeries(tvSeries)
        }
    }
    // MARK: ... Private properties
    private var dataPoster: Data? {
        return tvSeries?.poster
    }
    
    // MARK: ... Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

}

// MARK: - Private metods
extension TVSeriesDetailViewController {
    
    private func updateUI() {
        guard let dataPoster = dataPoster else { return }
        
        posterImageView?.image = UIImage(data: dataPoster)
    }
    
}
