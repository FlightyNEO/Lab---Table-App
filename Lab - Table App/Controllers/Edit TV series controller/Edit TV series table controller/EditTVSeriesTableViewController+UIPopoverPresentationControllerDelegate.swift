//
//  TVSeriesDetailTableViewController+UIPopoverPresentationControllerDelegate.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

// MARK: - Popover presentation controller delegate
extension EditTVSeriesTableViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        
        if controller.presentedViewController.isKind(of: UIImagePickerController.self) {
            return .popover
        } else {
            return .none
        }
        
    }
    
}
