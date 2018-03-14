//
//  NewsTableViewCell.swift
//  RealmPractice
//
//  Created by Prajwal kc on 3/12/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
