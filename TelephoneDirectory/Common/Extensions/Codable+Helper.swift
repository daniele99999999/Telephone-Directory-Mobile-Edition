//
//  Codable+Helper.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import SwifterSwift

extension Decodable
{
    public static func decode<T: Decodable>(_ data: Data?) -> T?
    {
        guard let _data = data else { return nil }        
        do
        {
            return try JSONDecoder().decode(T.self, from: _data)
        }
        catch let error as NSError
        {
            print("Error decode: \(error.userInfo)")
            return nil
        }
    }
    
}

extension Encodable
{
    public func encode() -> Data?
    {
        return try? JSONEncoder().encode(self)
    }
}
