//
//  GridViewController.swift
//  assigment
//
//  Created by 吉祥具 on 2019/3/8.
//  Copyright © 2019 吉祥具. All rights reserved.
//

import Foundation
import UIKit

class GridViewController : UIViewController {
    
    var column : CGFloat?
    var row : CGFloat?
    
    var previousX : Int?
    var previousY : Int?
    
    var newX : Int?
    var newY : Int?
    
    var viewArray : Array<ContainerSubViews>?
    var colorArray : Array<[UIColor]>?
    
    var height_Of_NavigationBar : CGFloat?
    
    var timer : Timer?
    let timerInterval = 10.0
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        initLayout()
        
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if(timer != nil){
            timer!.invalidate()
            timer = nil
        }
    }
    
    //MARK: init
    
    func initLayout(){
        createGrid(column: column!, row: row!)
        
    }
    
    func initData(){
        viewArray = Array()
        height_Of_NavigationBar = navigationController?.navigationBar.frame.size.height
        
        colorArray = Array()
        for _ in 0...(Int(row!) - 1){
            colorArray?.append(UIColor.randomColors())
        }
    }
    
    //MARK: click event
    
    @objc func confirmBtn_Clicked(_ sender : UIButton){
         setNormalStyle(containerSubViews: viewArray![sender.tag], indexOfMyView: Int(previousY!) - 1)
    }
    
    //MARK : - private method
    
    func createGrid(column _column:CGFloat, row _row:CGFloat){
        
        let height_Of_Screen = UIScreen.main.bounds.size.height - height_Of_NavigationBar! 
        let height_Of_Button = CGFloat(100.0)
        
        var width_Of_Screen = UIScreen.main.bounds.size.width
        var initial_X = CGFloat(0.0)
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            if ((UIScreen.main.bounds.width * UIScreen.main.scale) >= 2436) {
                width_Of_Screen = width_Of_Screen - (44.0 * 2)
                initial_X = CGFloat(44.0)
            }
        }
        
        
        
        for col in 0...(Int(column!) - 1) {
            let containerView = UIView.init(frame: CGRect(x: CGFloat(col) * (width_Of_Screen/column!) + initial_X, y :0 + height_Of_NavigationBar! , width: width_Of_Screen/column!, height:height_Of_Screen))
            
            self.view.addSubview(containerView)
            
            var myViewArray = Array<MyView>()
            for ro in 0...(Int(row!) - 1){
                let myView = MyView.init(frame: CGRect(x: 0, y: CGFloat(ro) * (((height_Of_Screen - height_Of_Button) / row!))  , width: width_Of_Screen/column!, height: ((height_Of_Screen - height_Of_Button) / row!) ))
                myView.upView.backgroundColor = colorArray![ro][1]
                myView.downView.backgroundColor = colorArray![ro][0]
                myView.randomLabel.isHidden = true

                containerView.addSubview(myView)
                myViewArray.append(myView)
            }

            let myButtonView = MyButtonView.init(frame: CGRect(x: 0, y: height_Of_Screen - height_Of_Button , width: width_Of_Screen/column!, height:  height_Of_Button ))
            setButtonStyle(button: myButtonView.confirmBtn)
            myButtonView.confirmBtn.tag = col
            myButtonView.confirmBtn.addTarget(self, action: #selector(confirmBtn_Clicked(_:)), for: .touchUpInside)
            
            containerView.addSubview(myButtonView)

            let containerSubViews = ContainerSubViews.init(containerView: containerView, myView: myViewArray, myButtonView: myButtonView)
            viewArray?.append(containerSubViews)
            
        }
        
    }
    
    func setButtonStyle(button _button:UIButton){
        _button.setTitle("確定", for: .normal)
        _button.setTitleColor(.lightGray, for: .normal)
        _button.backgroundColor = .darkGray
        _button.layer.borderWidth = 1
        _button.layer.borderColor = UIColor.lightGray.cgColor
        _button.layer.cornerRadius = _button.frame.size.width / 40.0
    }
    
    func setHighlightStyle(containerSubViews _containerSubViews:ContainerSubViews, indexOfMyView index:Int){
        let containerView = _containerSubViews.containerView
        containerView?.layer.borderWidth = 2
        containerView?.layer.borderColor = UIColor.init(red: 102/255.0, green: 208/255.0, blue: 211/255.0, alpha: 1).cgColor
        
        let myViewArray = _containerSubViews.myView
        myViewArray![index].randomLabel.isHidden = false
        
        let  myButtonView = _containerSubViews.myButtonView
        myButtonView?.confirmBtn.setTitleColor(.white, for: .normal)
        myButtonView?.confirmBtn.layer.borderColor = UIColor.init(red: 102/255.0, green: 208/255.0, blue: 211/255.0, alpha: 1).cgColor
         myButtonView?.confirmBtn.backgroundColor = UIColor.init(red: 102/255.0, green: 208/255.0, blue: 211/255.0, alpha: 1)
    }
    
    func setNormalStyle(containerSubViews _containerSubViews:ContainerSubViews, indexOfMyView index:Int){
        let containerView = _containerSubViews.containerView
        containerView?.layer.borderWidth = 0
        
        let myViewArray = _containerSubViews.myView
        myViewArray![index].randomLabel.isHidden = true
        
        let  myButtonView = _containerSubViews.myButtonView
        myButtonView?.confirmBtn.setTitleColor(.lightGray, for: .normal)
        myButtonView?.confirmBtn.layer.borderColor = UIColor.lightGray.cgColor
        myButtonView?.confirmBtn.backgroundColor = .darkGray
    }

    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(refreshGrid), userInfo: nil, repeats: true)
    }
    
    @objc func refreshGrid(){
        if(previousX != nil && previousY != nil){
            //reset the previous location ui first
            setNormalStyle(containerSubViews: viewArray![previousX! - 1], indexOfMyView: Int(previousY!) - 1 )
        }
            previousX = Int.random(in: 1...Int(column!))
            previousY = Int.random(in: 1...Int(row!))
            
        setHighlightStyle(containerSubViews: viewArray![previousX! - 1], indexOfMyView: Int(previousY!) - 1 )
        
    }
    
    
}

