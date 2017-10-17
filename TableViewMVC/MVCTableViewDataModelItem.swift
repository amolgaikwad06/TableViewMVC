//
//  MVCTableViewDataModelItem.swift
//  TableViewMVC
//
//  Created by Amol on 10/11/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import Foundation

class MVCTableViewDataModelItem {
    
    //Properties
    var title: String?
    
    init?(data: [String : String]?) {
        if let data = data, let title = data["title"] {
            self.title = title
        } else {
            return nil
        }
    }
}
