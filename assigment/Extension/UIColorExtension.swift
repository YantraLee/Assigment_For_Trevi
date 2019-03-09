//
//  UIColorExtension.swift
//  assigment
//
//  Created by 吉祥具 on 2019/3/10.
//  Copyright © 2019 吉祥具. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func randomColors() -> [UIColor] {
        let redRandomNum = CGFloat.random()
        let blueRandomNum = CGFloat.random()
        let greenRandomNum = CGFloat.random()
        
        let lightRedRanddomNum = redRandomNum + 0.2 >= 1 ? 1 : redRandomNum + 0.2
        let lightBlueRanddomNum = blueRandomNum + 0.2 >= 1 ? 1 : blueRandomNum + 0.2
        let lightGreenRanddomNum = greenRandomNum + 0.2 >= 1 ? 1 : greenRandomNum + 0.2
        
        return [UIColor(red:   redRandomNum,
                       green: blueRandomNum,
                       blue:  greenRandomNum,
                       alpha: 1.0),
                UIColor(red:   lightRedRanddomNum,
                        green: lightBlueRanddomNum,
                        blue:  lightGreenRanddomNum,
                        alpha: 1.0)]
    }
    
}
