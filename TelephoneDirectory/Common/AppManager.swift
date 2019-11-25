//
//  AppManager.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift

final class AppManager
{
    static let shared = AppManager()
    
    fileprivate (set) var persistenceService: PersistenceService!
    fileprivate (set) var controlFlow: ControlFlow!
    
    private init() {}
    
    func didFinishLaunching()
    {
        self.setupAppearance()
        self.setupPersistenceService()
        self.setupControlFlow()
    }
    
    func applicationDidEnterBackground()
    {
        
    }
    
    func applicationWillEnterForeground()
    {
        
    }
    
    private func setupAppearance()
    {
        UITextField.appearance().keyboardAppearance = .light
        UITextView.appearance().keyboardAppearance = .light
        UISearchBar.appearance().keyboardAppearance = .light
        
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().titleTextAttributes = [.font: Constants.Fonts.systemRegular(size: 18),
                                                            .foregroundColor : UIColor.black]
    }
    
    private func setupPersistenceService()
    {
        self.persistenceService = PersistenceService()
    }
    
    private func setupControlFlow()
    {
        self.controlFlow = ControlFlow(contactPersistence: self.persistenceService.contactModelPersistence)
    }
    
    func logAppInfo()
    {
        print("""
            
            *************** App Info ***************
            BundleIdentifier: \(AppInfoUtils.getAppBundleIdentifier())
            BundlePrefix: \(AppInfoUtils.getAppBundlePrefix())
            BundleName: \(AppInfoUtils.getAppBundleName())
            DisplayName: \(AppInfoUtils.getAppDisplayName())
            Version: \(AppInfoUtils.getAppVersion())
            BuildVersion: \(AppInfoUtils.getAppBuildVersion())
            DatabasePath: \(FileManager.documentDirectoryString(appendingPath: Constants.Resources.Database.sqlLiteFileName) ?? "<Empty>")
            ****************************************
            
            """)
    }
    
    var globalDefaultSupportedOrientation: UIInterfaceOrientationMask
    {
        switch UIDevice.current.userInterfaceIdiom
        {
        case .phone:
            return .portrait
        case .pad:
            return .all
        default:
            return .all
        }
    }
    
    func start()
    {
        self.controlFlow.start()
    }
}
