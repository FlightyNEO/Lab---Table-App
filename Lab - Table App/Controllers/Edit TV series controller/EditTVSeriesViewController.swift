//
//  EditTVSeriesViewController.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 12/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

class EditTVSeriesViewController: UIViewController {
    
    // MARK: ... Properties
    var tvSeries: TVSeries? {
        didSet {
            guard let tvSeries = tvSeries else { return }
            //self.dataPoster = tvSeries.poster
            title = tvSeries.name
        }
    }
    
    // MARK: ... Life cile
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
    }
    
    deinit {
        print("DEINIT")
    }

}
