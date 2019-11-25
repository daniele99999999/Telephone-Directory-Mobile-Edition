//
//  PermissionProtocol.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 23/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

protocol PermissionProtocol
{
    func requestContactAccess(completion: @escaping (_ granted: Bool) -> Void)
}
