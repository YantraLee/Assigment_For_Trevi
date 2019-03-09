//
//  ContainerSubViews.swift
//  assigment
//
//  Created by 吉祥具 on 2019/3/8.
//  Copyright © 2019 吉祥具. All rights reserved.
//

import Foundation
import UIKit

class ContainerSubViews{
    
    init(containerView _containerView:UIView, myView _myView:Array<MyView>, myButtonView _myButtonView:MyButtonView){
        containerView = _containerView
        myView = _myView
        myButtonView = _myButtonView
    }
    
    var containerView : UIView?
    var myView : Array<MyView>?
    var myButtonView : MyButtonView?
    
}
