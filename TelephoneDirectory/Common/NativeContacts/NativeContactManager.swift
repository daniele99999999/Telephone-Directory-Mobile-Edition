//
//  NativeContactManager.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 23/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import Contacts

struct NativeContactManager: NativeContactProtocol
{
    func getAllEntity(completion: @escaping ([ContactModel]) -> Void)
    {
        let contactStore: CNContactStore = CNContactStore()
        var nativeContacts = [CNContact]()
        let request = CNContactFetchRequest(keysToFetch: [
            CNContactGivenNameKey as CNKeyDescriptor,
            CNContactFamilyNameKey as CNKeyDescriptor,
            CNContactPhoneNumbersKey as CNKeyDescriptor
        ])
        
        SystemUtils.backgroundDelay
        {
            do
            {
                try contactStore.enumerateContacts(with: request)
                { contact, stop in
                    nativeContacts.append(contact)
                }
            }
            catch let error as NSError
            {
                print("error: \(error.description)")
                SystemUtils.mainDelay
                {
                    completion([])
                }
            }
            
            let contacts = nativeContacts.map
            { (nativeContact: CNContact) -> ContactModel in
                ContactModel(id: nil,
                             firstName: nativeContact.givenName,
                             lastName: nativeContact.familyName,
                             phoneNumber: nativeContact.phoneNumbers.first?.value.stringValue ?? "")
            }
            
            SystemUtils.mainDelay
            {
                completion(contacts)
            }
        }
    }
}
