//
//  EditTVSeriesTableViewController.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

protocol EditTVSeriesTableViewControllerDelegate: class {
    func didChangeTVSeries(_ series: TVSeries)
}

class EditTVSeriesTableViewController: UITableViewController {
    
    // MARK: ... IBOutlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    // MARK: ... Properties
    weak var delegate: EditTVSeriesTableViewControllerDelegate?
    
    var tvSeries: TVSeries? {
        didSet {
            guard let tvSeries = tvSeries else { return }
            updateUI()
            delegate?.didChangeTVSeries(tvSeries)
        }
    }
    
    var showRatingPickerIdentifire: String {
        return "showRatingPicker"
    }
    
    // MARK: ... Private properties
    private var dataPoster: Data? {
        return tvSeries?.poster
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
}

// MARK: - Private methods
extension EditTVSeriesTableViewController {
    
//    private func setupUI() {
//
//
//        updateUI()
//    }
    
    private func updateUI() {
        guard let dataPoster = dataPoster else { return }
        posterImageView?.image = UIImage(data: dataPoster)
        ratingLabel?.text = tvSeries?.ratingStars
    }
    
    private func showImagePicker(anchor: UIView) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = .popover
        imagePicker.popoverPresentationController?.delegate = self
        imagePicker.popoverPresentationController?.sourceView = anchor
        imagePicker.popoverPresentationController?.sourceRect = anchor.bounds
        
        present(imagePicker, animated: true)
    }
    
}

// MARK: - Actions
extension EditTVSeriesTableViewController {
    
    @IBAction func actionChoosePoster(_ sender: UIButton) {
        
        showImagePicker(anchor: sender)
        
    }
    
}
