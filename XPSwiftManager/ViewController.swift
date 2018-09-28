//
//  ViewController.swift
//  XPSwiftManager
//
//  Created by QTJT on 2018/8/20.
//  Copyright © 2018年 耿晓鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dict = [["小明":["age":18,"sex":"男"]],["小红":["age":"19","sex":"女"]]]
//        dict.wirteToPlist(plistName: "test")
        dict.writeToPlist(plistName: "test")
        
        let a = XPTool.readFromPlist(plistName: "aaa")
        print(a)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

