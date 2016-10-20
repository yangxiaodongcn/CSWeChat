//
//  Logger.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 9/30/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import Foundation
import XCGLogger


let documentDirectory: URL = {
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return urls[urls.endIndex - 1]
}()

let cacheDirectory: URL = {
    let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
    return urls[urls.endIndex - 1]
}()

let log: XCGLogger = {
    let log = XCGLogger.default
    
    #if USE_NSLOG
        log.removeLogDestination(XCGLogger.constants.baseConsoleLogDestinationIdentifier)
        log.addLogDestination(XCGNSLogDestination(owner: log, identifier: XCGLogger.constants.nslogDestinationIdentifier))
        log.logAppDetails()
    #else
        let logPath: URL = cacheDirectory.appendingPathComponent("CSWeChatLog.txt")
        log.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: logPath)
    #endif
    
    return log
}()





