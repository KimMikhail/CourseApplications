//
//  TableViewCell.swift
//  Notes List
//
//  Created by  Mikhail on 10.05.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
   

        
        // Configure the view for the selected state
    }

    @IBAction func doneButtonAction(_ sender: UIButton) {
        if self.backgroundColor != .darkGray {
            self.backgroundColor = .darkGray
        } else {
            self.backgroundColor = .none
        }
        
        
    }
        
}
