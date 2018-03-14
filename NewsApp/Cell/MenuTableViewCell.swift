//
//  MenuTableViewCell.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/6/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var myLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
