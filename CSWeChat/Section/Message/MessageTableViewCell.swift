//
//  MessageTableViewCell.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 11/3/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var unreadNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatarImageView.layer.masksToBounds = true
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.width / 2 / 180 * 30
        self.unreadNumberLabel.layer.masksToBounds = true
        self.unreadNumberLabel.layer.cornerRadius = self.unreadNumberLabel.height / 2.0
    }
    
    func setCellContent(model: MessageMode) {
        self.avatarImageView.setImageWithURLString(URLString: model.middleImageURL, placeholder: model.messageFromType.placHolderImage)
        self.unreadNumberLabel.text = model.unreadNumber! > 99 ? "99+" : String(model.unreadNumber!)
        self.unreadNumberLabel.isHidden = (model.unreadNumber == 0)
        self.lastMessageLabel.text = model.lastMessage
        self.dateLabel.text = model.dateString
        self.nameLabel.text = model.nickname
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
