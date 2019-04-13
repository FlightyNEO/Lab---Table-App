//
//  TVSeriesDetailTableViewController+UITextViewDelegate.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

// MARK: - Text view delegate
extension TVSeriesDetailTableViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        let height = CGFloat(150)
        
        if textView.frame.height >= height &&
            textView != descriptionTextView {
            
            textView.isScrollEnabled = true
            let heightConstraint = NSLayoutConstraint(item: textView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: height)
            textView.addConstraint(heightConstraint)
            
        } else if textView == descriptionTextView {
            
            textView.sizeToFit()
            tableView.beginUpdates()
            tableView.endUpdates()
            let indexPath = IndexPath(row: 7, section: 0)
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            
        } else {
            
            textView.sizeToFit()
            tableView.beginUpdates()
            tableView.endUpdates()
            
        }
        
        //tableView.scrollToRow(at: IndexPath(row: 2, section: 0), at: .none, animated: true)
        
    }
    
}
