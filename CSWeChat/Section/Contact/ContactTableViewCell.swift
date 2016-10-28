//
//  ContactTableViewCell.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 10/17/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func setCellContent(mode: ContactModel) {
//        self.avatarImageView.
//    }
    
}
