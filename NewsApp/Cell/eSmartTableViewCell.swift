//
//  eSmartTableViewCell.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/3/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class eSmartTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabelArab: UILabel!
    
    @IBOutlet weak var myLabelEng: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
