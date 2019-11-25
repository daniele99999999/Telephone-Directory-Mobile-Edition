//
//  PermissionManagerMock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

struct PermissionManagerMock: PermissionProtocol
{
    let canAccess: Bool
    
    func requestContactAccess(completion: @escaping (Bool) -> Void)
    {
        completion(self.canAccess)
    }
}
