//
//  ViewController.swift
//  assigment
//
//  Created by 吉祥具 on 2019/3/8.
//  Copyright © 2019 吉祥具. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var columnTxtField: UITextField!
    @IBOutlet weak var rowTxtField: UITextField!
    
    @IBOutlet weak var createBtn: UIButton!
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        initLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    //MARK: init

    func initLayout(){
        
        //set keyboard input type
        columnTxtField.keyboardType = .numberPad
        rowTxtField.keyboardType = .numberPad
        
        //add button event
        createBtn.addTarget(self, action: #selector(createBtn_Clicked), for: .touchUpInside)
    }
    
    func initData(){
        
    }
    
    //MARK: click event
    
    @objc func createBtn_Clicked(){
        let column = columnTxtField.text?.trimmingCharacters(in: .whitespaces)
        let row = rowTxtField.text?.trimmingCharacters(in: .whitespaces)
        
        if(column == "" || row == ""){
            showAlert(message: "column and row number must have a value")
            return
        }
        
        if( Int(column!)! <= 0 || Int(row!)! <= 0 ){
            showAlert(message: "column and row number must larger than zero")
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gridViewController = storyboard.instantiateViewController(withIdentifier: "GridViewController") as! GridViewController
        
        gridViewController.column = CGFloat(Int(column!)!)
        gridViewController.row = CGFloat(Int(row!)!)
        
        navigationController?.pushViewController(gridViewController, animated: true)
    }
    
    //MARK : - private method
    
    func showAlert(message msg:String){
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

