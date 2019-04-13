//
//  YearChoosingViewController.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 12/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

protocol RatingChoosingViewControllerDelegate: class {
    func ratingDidChanged(value: Float)
}

class RatingChoosingViewController: UIViewController {
    
    // MARK: ... IBOutlets
    @IBOutlet weak var ratingPicker: UIPickerView!
    
    // MARK: ... Properties
    weak var delegate: RatingChoosingViewControllerDelegate?
    var currentRating: Float = 10
    var symbol: String = "+"
    private(set) var ratings = [Int]()
    
    // MARK: ... Life cilce
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("VIEW DID LOAD YearChoosingViewController")
        
        setRating()
        
        if let row = ratings.firstIndex(of: Int(currentRating)) {
            ratingPicker.selectRow(row, inComponent: 0, animated: false)
        }
        
    }
    
    deinit {
        print("DEINIT YearChoosingViewController")
    }
    
}

// MARK: - Private methods
extension RatingChoosingViewController {
    
    private func setRating() {
        
        ratings.append(contentsOf: 1...10)
        
    }
    
}

// MARK: - Actions
extension RatingChoosingViewController {
    
    @IBAction func actionDone(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
