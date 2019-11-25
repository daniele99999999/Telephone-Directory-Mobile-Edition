//
//  String+HTML.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

extension String
{
    func convertHtml(font: UIFont? = nil, color: UIColor? = nil) -> NSAttributedString
    {
        var attributes = [NSAttributedString.Key: Any]()
        if let _font = font { attributes[NSAttributedString.Key.font] = _font }
        if let _color = color { attributes[NSAttributedString.Key.foregroundColor] = _color }

        guard let data = data(using: .utf8, allowLossyConversion: false) else { return NSAttributedString() }
        do
        {
            let attributedString = try NSMutableAttributedString(data: data,
                                                                 options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                                                                           NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
                                                                 documentAttributes: nil)
            attributedString.addAttributes(attributes, range: NSMakeRange(0, attributedString.length))
            return attributedString
        }
        catch
        {
            return NSAttributedString()
        }
    }
    
    func cleanHtml() -> String?
    {
        guard let data = self.data(using: .unicode) else { return nil }
        guard let attributed = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil) else { return nil }
        return attributed.string
    }
    
    static func cleanHtml(stringToClean: String?, completion: @escaping (String?) -> Void)
    {
        guard let _stringToClean = stringToClean else { completion(nil); return }
        
        SystemUtils.backgroundDelay()
        {
            let stringClean = _stringToClean.cleanHtml()
            SystemUtils.mainDelay()
            {
                completion(stringClean)
            }
        }
    }
}
