//
//  FileManager+Document.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

extension FileManager
{
    static func documentDirectoryFileURL() -> URL?
    {
        return try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    }
    
    static func documentDirectoryString(appendingPath: String? = nil) -> String?
    {
        let fileURL = self.documentDirectoryFileURL()
        guard let _appendingPath = appendingPath else { return fileURL?.path }
        return fileURL?.appendingPathComponent(_appendingPath).path
    }
    
    static func temporaryDirectoryFileURL(create: Bool = true) -> URL?
    {
        return try? FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: create)
    }
    
    static func temporaryDirectoryString(appendingPath: String? = nil, create: Bool = true) -> String?
    {
        let fileURL = self.temporaryDirectoryFileURL(create: create)
        guard let _appendingPath = appendingPath else { return fileURL?.path }
        return fileURL?.appendingPathComponent(_appendingPath).path
    }
}
