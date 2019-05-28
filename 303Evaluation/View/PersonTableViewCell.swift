//
//  PersonTableViewCell.swift
//  303Evaluation
//
//  Created by Thomas Condon on 5/23/19.
//  Copyright © 2019 Niwot Software, LLC. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    static let cellId = "PersonTableCellViewId"

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var city: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
