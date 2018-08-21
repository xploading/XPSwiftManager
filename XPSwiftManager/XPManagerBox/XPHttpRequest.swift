//
//  XPHttpRequest.swift
//  XPSwiftManager
//
//  Created by QTJT on 2018/8/20.
//  Copyright © 2018年 耿晓鹏. All rights reserved.
//

import Foundation
import UIKit
import AFNetworking

/// 网络请求类
class XPHttpRequest: NSObject {
    private static let manager = AFHTTPSessionManager()
    static func share() ->AFHTTPSessionManager{
        let set = Set<String>(arrayLiteral: "text/html","text/plain","text/json","application/json", "text/javascript")
        manager.responseSerializer.acceptableContentTypes = set
        manager.requestSerializer.timeoutInterval = 30
        return manager
        
    }
    
/// GET请求
///
/// - Parameters:
///   - URLString: 请求URL地址
///   - parameters: 请求参数
///   - success: 请求成功返回闭包
///   - failure: 请求失败返回闭包
    static func GET(URLString:String,parameters:Any?,success:@escaping (Any?)->Void,failure:@escaping (Any?)->Void){
        
        self.share().get(URLString, parameters: parameters, progress: nil, success: { (Task, json) in
            if let dict = json as? Dictionary<String,Any>{
                success(dict)
            }else{
                print("数据解析失败","请求接口:",URLString,"数据:",json as Any)
            }
        }) { (Tast, error) in
            failure(error)
        }
    }
/// POST请求
///
/// - Parameters:
///   - URLString: 请求URL地址
///   - parameters: 请求参数
///   - success: 请求成功回调闭包
///   - failure: 请求失败回调闭包
    static func POST(URLString:String,parameters:Any?,success:@escaping (Dictionary<String,Any>)->Void,failure:@escaping (Any?)->Void){
        self.share().post(URLString, parameters: parameters, progress: nil, success: { (Task, json) in
            if let dict = json as? Dictionary<String,Any>{
                success(dict)
            }else{
                print("数据解析失败","请求接口:",URLString,"数据:",json as Any)
            }
        }) { (Task, error) in
            failure(error)
        }
    }
/// 上传图片
///
/// - Parameters:
///   - URLString: 请求URL地址
///   - para: 请求参数
///   - image: 上传的图片
///   - success: 请求成功回调闭包
///   - failure: 请求失败回调闭包
    static func POSTImage(URLString:String,
                          para:Any?,
                          image:UIImage,
                          success:@escaping (Dictionary<String,Any>)->Void,
                          failure:@escaping (_ error:Any)->Void){
        
        self.share().post(URLString,
                          parameters: para,
                          constructingBodyWith: { (formData) in
                            let data = UIImageJPEGRepresentation(image, 1)
                            formData.appendPart(withFileData: data!, name: "avatar", fileName: "avatar", mimeType: "image/jpeg")
        }, progress: { (progess) in
            
        }, success: { (task, json) in
            if let dict = json as? Dictionary<String,Any>{
                success(dict)
            }else{
                print("json解析失败","请求接口:",URLString,"数据:",json as Any)
            }
        }) { (task, error) in
            failure(error)
        }
    }
    
    
    
    
    
}





