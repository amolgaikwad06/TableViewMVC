//
//  MVCTableViewCell.swift
//  TableViewMVC
//
//  Created by Amol on 10/11/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit

class MVCTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    class var identifier: String {
        return "Cell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWithItem(item: MVCTableViewDataModelItem) {
        title.text = item.title
    }

}
