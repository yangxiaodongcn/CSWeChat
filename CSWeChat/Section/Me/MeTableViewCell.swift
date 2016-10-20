//
//  MeTableViewCell.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 9/29/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import UIKit

class MeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var meImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var wechatIDLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.accessoryType = .disclosureIndicator
        self.meImageView.layer.masksToBounds = true
        self.meImageView.layer.cornerRadius = 5
        self.meImageView.layer.borderWidth = 0.5
        self.meImageView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
