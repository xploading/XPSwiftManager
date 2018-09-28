//
//  XPExtension.swift
//  XPSwifManager
//
//  Created by QTJT on 2018/8/20.
//  Copyright © 2018年 耿晓鹏. All rights reserved.
//

import Foundation
import UIKit


//MARK: - UIColor扩展
extension UIColor{

    ///设置RGB颜色 16进制转RGB颜色
    static func colorWith(Hex:String)->UIColor{
        var cString = Hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
        
        
    
}

//MARK: - Dictionary扩展
extension Dictionary{
    
/** Dictionary写入本地plist
*
* - Parameter plistName: plist文件名
*/
    func wirteToPlist(plistName:String){
        var path = Bundle.main.path(forResource: plistName, ofType: "plist")
        if path == nil{
            path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true).first
            path = String.init(format: "%@/%@.plist", path!,plistName)
        }
        let dict = self as NSDictionary
        dict.write(toFile: path!, atomically: true)
    }

}
//MARK: - Array扩展
extension Array{
    
/// Array写入本地plist
///
/// - Parameter plistName: plist文件名
    func writeToPlist(plistName:String){
        var path = Bundle.main.path(forResource: plistName, ofType: "plist")
        if path == nil{
            path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true).first
            path = String.init(format: "/%@/%@.plist", path!,plistName)
        }
        let array = self as NSArray
        array.write(toFile: path!, atomically: true)
    
    }
}

//MARK: - UIView扩展
extension UIView{
    var minX : CGFloat {get{return self.frame.minX}}
    var maxX : CGFloat {get{return self.frame.maxX}}
    var minY : CGFloat {get{return self.frame.minY}}
    var maxY : CGFloat {get{return self.frame.maxY}}
}



extension UIButton{
    
}

extension UIDevice{
    /// 当前设备名称
    var modelName:String{
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod1,1":  return "iPod Touch 1"
        case "iPod2,1":  return "iPod Touch 2"
        case "iPod3,1":  return "iPod Touch 3"
        case "iPod4,1":  return "iPod Touch 4"
        case "iPod5,1":  return "iPod Touch (5 Gen)"
        case "iPod7,1":   return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":  return "iPhone 4"
        case "iPhone4,1":  return "iPhone 4s"
        case "iPhone5,1":   return "iPhone 5"
        case "iPhone5,2":  return "iPhone 5 (GSM+CDMA)"
        case "iPhone5,3":  return "iPhone 5c (GSM)"
        case "iPhone5,4":  return "iPhone 5c (GSM+CDMA)"
        case "iPhone6,1":  return "iPhone 5s (GSM)"
        case "iPhone6,2":  return "iPhone 5s (GSM+CDMA)"
        case "iPhone7,2":  return "iPhone 6"
        case "iPhone7,1":  return "iPhone 6 Plus"
        case "iPhone8,1":  return "iPhone 6s"
        case "iPhone8,2":  return "iPhone 6s Plus"
        case "iPhone8,4":  return "iPhone SE"
        case "iPhone9,1":   return "国行、日版、港行iPhone 7"
        case "iPhone9,2":  return "港行、国行iPhone 7 Plus"
        case "iPhone9,3":  return "美版、台版iPhone 7"
        case "iPhone9,4":  return "美版、台版iPhone 7 Plus"
        case "iPhone10,1","iPhone10,4":   return "iPhone 8"
        case "iPhone10,2","iPhone10,5":   return "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":   return "iPhone X"
        case "iPad1,1":   return "iPad"
        case "iPad1,2":   return "iPad 3G"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":   return "iPad 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":  return "iPad Mini"
        case "iPad3,1", "iPad3,2", "iPad3,3":  return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":   return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":   return "iPad Air"
        case "iPad4,4", "iPad4,5", "iPad4,6":  return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":  return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":  return "iPad Mini 4"
        case "iPad5,3", "iPad5,4":   return "iPad Air 2"
        case "iPad6,3", "iPad6,4":  return "iPad Pro 9.7"
        case "iPad6,7", "iPad6,8":  return "iPad Pro 12.9"
        case "AppleTV2,1":  return "Apple TV 2"
        case "AppleTV3,1","AppleTV3,2":  return "Apple TV 3"
        case "AppleTV5,3":   return "Apple TV 4"
        case "i386", "x86_64":   return "Simulator"
        default:  return identifier
            }
        }
    
}
