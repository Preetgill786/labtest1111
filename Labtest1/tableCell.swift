//
//  tableCell.swift
//  Labtest1
//
//  Created by MacStudent on 2020-01-14.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class tableCell: UITableViewCell {

    @IBOutlet weak var stuName: UITextField!
    @IBOutlet weak var stuAge: UITextField!
    
    @IBOutlet weak var stuFees: UITextField!
    
    @IBOutlet weak var stuDate: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
