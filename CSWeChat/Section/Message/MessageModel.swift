//
//  MessageModel.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 11/3/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import Foundation
import ObjectMapper

class MessageMode: NSObject, CSModeProtocol {
    
    var middleImageURL : String?
    var unreadNumber : Int?
    var nickname : String?
    var messageFromType : MessageFromType = MessageFromType.personal
    var messageContentType : MessageContentType = MessageContentType.text
    var chatId : String?  //每个人，群，公众帐号都有一个 uid，统一叫 chatId
    var latestMessage : String? //当且仅当消息类型为 Text 的时候，才有数据，其他类型需要本地造
    var dateString: String?
    
    required init?(map: Map){
        
    }
    
    override init() {
        super.init()
    }
    
    func mapping(map: Map) {
        middleImageURL <- map["avatar_url"]
        unreadNumber <- map["message_unread_num"]
        nickname <- map["nickname"]
        messageFromType <- (map["meesage_from_type"], EnumTransform<MessageFromType>())
        chatId <- map["userid"]
        latestMessage <- map["last_message.message"]
        messageContentType <- (map["last_message.message_content_type"], EnumTransform<MessageContentType>())
        dateString <- (map["last_message.timestamp"], transfromOfTimestapAndTimeAgo())
    }
    
    var lastMessage: String? { get {
        switch (self.messageContentType) {
        case .text, .system:
            return self.latestMessage
        case .image:
            return "[图片]"
        case .voice:
            return "[语音]"
        case .file:
            return "[文件]"
        default:
            return ""
        }}
    }
}
