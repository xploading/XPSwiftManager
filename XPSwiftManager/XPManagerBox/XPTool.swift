//
//  XPTool.swift
//  XPSwiftManager
//
//  Created by QTJT on 2018/8/21.
//  Copyright © 2018年 耿晓鹏. All rights reserved.
//

import UIKit

final class XPTool: NSObject {
    private override init() {}
    
    /// 读取本地plist文件
    ///
    /// - Parameter plistName: plist文件名
    /// - Returns: 返回Array/Dictionary,如果解析失败返回nil
    static func readFromPlist(plistName:String)->Any?{
        
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true).first
        if path != nil{
            path = path!+String.init(format: "/%@.plist",plistName)
            if let array = (NSArray(contentsOfFile: path!) as? Array<Any>){
                return array
            }
            if let dict = (NSDictionary(contentsOfFile:path!) as? Dictionary<String,Any>){
                return dict
            }
        }
        print("plist读取失败-->",path!)
        return nil
    }
    

}
