//
//  MyButtonView.swift
//  assigment
//
//  Created by 吉祥具 on 2019/3/8.
//  Copyright © 2019 吉祥具. All rights reserved.
//

import Foundation
import UIKit

class MyButtonView: UIView {
    
    @IBOutlet weak var confirmBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         loadViewFromNib()
    }
    
    func loadViewFromNib() {
        let contentView = Bundle.main.loadNibNamed("MyButtonView", owner: self, options: nil)?[0] as! UIView
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = bounds
        self.addSubview(contentView)
    }
}
