//
//  UsersNewsTableViewCell.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/12/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class UsersNewsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var myNewsTitleLabel: UILabel!
    
    @IBOutlet weak var myNewsAuthor: UILabel!
    @IBOutlet weak var myNewsDateLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
