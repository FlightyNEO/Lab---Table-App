//
//  EditTVSeriesViewController+Navigation.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

// MARK: - Navigation
extension EditTVSeriesTableViewController {
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        
        guard identifier == showRatingPickerIdentifire else { return }
        
        let destNav = createRatingController()
        
        present(destNav, animated: true, completion: nil)
        
    }
    
}

// MARK: - Other methods
extension EditTVSeriesTableViewController {
    
    private func createRatingController() -> UINavigationController {
        
        let ratingViewController = storyboard?.instantiateViewController(withIdentifier: "RatingChoosingViewController") as! RatingChoosingViewController
        let contentSize = CGSize(width: 280, height: 200)
        let destNav = UINavigationController(rootViewController: ratingViewController)
        
        ratingViewController.symbol = tvSeries?.symbol ?? "-"
        ratingViewController.delegate = self
        ratingViewController.currentRating = tvSeries?.rating ?? 10
        
        ratingViewController.preferredContentSize = contentSize
        destNav.modalPresentationStyle = .popover
        destNav.navigationBar.isHidden = true
        
        let popverController = destNav.popoverPresentationController
        popverController?.delegate = self
        popverController?.sourceView = ratingLabel
        popverController?.sourceRect = ratingLabel.bounds
        
        return destNav
        
    }
    
}
