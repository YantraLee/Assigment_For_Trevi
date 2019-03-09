//
//  CGFloatExtension.swift
//  assigment
//
//  Created by 吉祥具 on 2019/3/10.
//  Copyright © 2019 吉祥具. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGFloat {
    
    //MARK: Create number from range 0 to 1
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
