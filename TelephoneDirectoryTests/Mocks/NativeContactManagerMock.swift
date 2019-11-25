//
//  NativeContactManagerMock.swift
//  TelephoneDirectoryTests
//
//  Created by Daniele Salvioni on 24/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

struct NativeContactManagerMock: NativeContactProtocol
{
    let contacts: [ContactModel]
    
    func getAllEntity(completion: @escaping ([ContactModel]) -> Void)
    {
        completion(self.contacts)
    }
}
