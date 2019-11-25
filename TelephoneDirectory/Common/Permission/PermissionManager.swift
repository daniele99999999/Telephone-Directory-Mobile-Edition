//
//  PermissionManager.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 23/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import Contacts

struct PermissionManager: PermissionProtocol
{
    func requestContactAccess(completion: @escaping (_ granted: Bool) -> Void)
    {
        let contactStore: CNContactStore = CNContactStore()
        
        switch CNContactStore.authorizationStatus(for: .contacts)
        {
        case .notDetermined:
            contactStore.requestAccess(for: .contacts)
            { (granted: Bool, error: Error?) in
                SystemUtils.mainDelay
                {
                    completion((error != nil) ? false : granted)
                }
            }
        case .authorized:
            completion(true)
        case .restricted, .denied:
            completion(false)
        @unknown default:
            fatalError("CNContactStore new authorizationStatus need to be handled")
        }
    }
}
