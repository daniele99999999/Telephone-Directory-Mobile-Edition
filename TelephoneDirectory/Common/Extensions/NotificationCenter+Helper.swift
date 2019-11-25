//
//  NotificationCenter+Helper.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

extension NotificationCenter
{
    static func post(name: String)
    {
        NotificationCenter.default.post(name: Notification.Name(name), object: nil, userInfo: nil)
    }
    
    static func post(name: String, object: Any?)
    {
        NotificationCenter.default.post(name: Notification.Name(name), object: object, userInfo: nil)
    }
    
    static func addObserver(_ object: Any, name: Notification.Name, action: Selector)
    {
        NotificationCenter.default.addObserver(object, selector: action, name: name, object: nil)
    }
    
    static func addObserver(_ object: Any, name: String, action: Selector)
    {
        NotificationCenter.default.addObserver(object, selector: action, name: Notification.Name(name), object: nil)
    }
    
    static func removeObserver(_ object: Any, name: Notification.Name)
    {
        NotificationCenter.default.removeObserver(object, name: name, object: nil)
    }
    
    static func removeObserver(_ object: Any, name: String)
    {
        NotificationCenter.default.removeObserver(object, name: Notification.Name(name), object: nil)
    }
    
    static func removeObserver(_ object: Any, notification: Notification)
    {
        NotificationCenter.default.removeObserver(object, name: notification.name, object: nil)
    }
    
    static func removeAllObserver(_ object: Any)
    {
        NotificationCenter.default.removeObserver(object, name: nil, object: nil)
    }
}
