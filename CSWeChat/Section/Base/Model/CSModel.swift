//
//  CSModel.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 10/26/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import Foundation
import ObjectMapper


typealias CSModeProtocol = ObjectMapper.Mappable
typealias CSMapper = ObjectMapper.Mapper


enum GenderType: Int {
    case female = 0
    case male = 1
}

/* 消息内容类型:
 0 - 文本
 1 - 图片
 2 - 语音
 3 - 群组提示信息，例如:高必梵邀请白琳,彭莹加入群聊
 4 - 文件
 110 - 时间（客户端生成数据）
 */
enum MessageContentType: String {
    case text = "0"
    case image = "1"
    case voice = "2"
    case system = "3"
    case file = "4"
    case time = "110"
}

//服务器返回的是字符串
enum MessageFromType: String {
    //消息来源类型
    case system = "0"
    case personal = "1"
    case group = "2"
    case publicServer = "3"
    case publicSubscribe = "4"
    
    //消息类型对应的占位图
    var placHolderImage: UIImage {
        switch(self) {
        case .personal:
            return Asset.Icon_avatar.image
        case .system, .group, .publicServer, .publicSubscribe:
            return Asset.Icon_avatar.image
        }
    }
}

//发送消息的状态
enum MessageSendSuccessType: Int {
    case success = 0
    case failed = 1
    case sending = 2
}






