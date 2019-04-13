//
//  EditTVSeriesTableViewController+TableView.swift
//  Lab - Table App
//
//  Created by Arkadiy Grigoryanc on 13/04/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit

extension EditTVSeriesTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: showRatingPickerIdentifire, sender: nil)
        
    }
    
}

