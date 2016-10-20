//
//  ImageTextTableViewCell.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 9/30/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import UIKit

class ImageTextTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
