//
//  ModelTransform.swift
//  CSWeChat
//
//  Created by 杨晓冬 on 11/3/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import Foundation
import ObjectMapper

func transfromOfTimestapAndTimeAgo() -> TransformOf<String, NSNumber> {
    return TransformOf<String, NSNumber>.init(fromJSON: { (value: NSNumber?) -> String? in
        return "刚刚"
    }, toJSON: { (value: String?) -> NSNumber? in
        return nil
    })
}

func transformOfStringAndFloat() -> TransformOf<Float, String> {
    return TransformOf<Float, String>.init(fromJSON: { (value: String?) -> Float? in
        guard let value = value else { return 0 }
        return Float(value)
    }, toJSON: { (value: Float?) -> String? in
        guard let value = value else { return nil }
        return String(value)
    })
}

func transformOfStringAndInt() -> TransformOf<Float, Int> {
    return TransformOf<Float, Int>.init(fromJSON: { (value: Int?) -> Float? in
        guard let value = value else { return 0 }
        return Float(value)
    }, toJSON: { (value: Float?) -> Int? in
        guard let value = value else { return nil }
        return Int(value)
    })
}

func transformOfStringAndCGFloat() -> TransformOf<CGFloat, String> {
    return TransformOf<CGFloat, String>.init(fromJSON: { (value: String?) -> CGFloat? in
        guard let value = value else { return CGFloat(0) }
        return CGFloat(Int(value)!)
    }, toJSON: { (value: CGFloat?) -> String? in
        guard let value = value else { return nil }
        return String(Float(value))
    })
}
