//
//  EditTVSeriesTableViewController+UIImagePickerControllerDelegate.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension EditTVSeriesTableViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            //posterImageView.image = editedImage
            tvSeries?.poster = editedImage.pngData()
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            //posterImageView.image = originalImage
            tvSeries?.poster = originalImage.pngData()
        }
        
        picker.dismiss(animated: true)
    }
    
}
