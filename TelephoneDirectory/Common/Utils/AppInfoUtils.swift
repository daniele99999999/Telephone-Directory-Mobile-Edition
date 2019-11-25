//
//  AppInfoUtils.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import SwifterSwift

class AppInfoUtils
{
    class func getAppVersion() -> String
    {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    class func getAppBuildVersion() -> String
    {
        return (Bundle.main.object(forInfoDictionaryKey: (kCFBundleVersionKey as String?) ?? "")) as? String ?? ""
    }
    
    class func getAppBundleName() -> String
    {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    class func getAppDisplayName() -> String
    {
        return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? self.getAppBundleName()
    }
    
    class func getAppExecutableName() -> String
    {
        return Bundle.main.infoDictionary?["CFBundleExecutable"] as? String ?? ""
    }
    
    class func getAppProcessName() -> String
    {
        return ProcessInfo.processInfo.processName
    }
    
    class func getAppFileName() -> String
    {
        let bundlePath: String = Bundle.main.bundlePath
        return FileManager.default.displayName(atPath: bundlePath)
    }
    
    class func getAppBundleIdentifier() -> String
    {
        return Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? ""
    }
    
    class func getAppBundlePrefix() -> String
    {
        let bundleIdentifier: String = self.getAppBundleIdentifier()
        let bundleName: String = self.getAppBundleName()
        let bundlePrefixWithFinalPoint: String = bundleIdentifier.replacingOccurrences(of: bundleName, with: "")
        var bundlePrefix: String? = nil
        if (((bundlePrefixWithFinalPoint as NSString).substring(from: ((bundlePrefixWithFinalPoint.count ) - 1))) == ".")
        {
            bundlePrefix = (bundlePrefixWithFinalPoint as NSString).substring(to: ((bundlePrefixWithFinalPoint.count) - 1))
        }
        else
        {
            bundlePrefix = bundlePrefixWithFinalPoint
        }
        return bundlePrefix ?? ""
    }
}
