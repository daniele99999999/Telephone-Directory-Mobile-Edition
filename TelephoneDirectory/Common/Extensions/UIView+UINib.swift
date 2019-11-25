//
//  UIView+UINib.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

public extension UIView
{
    class func loadFromXib<T>(withOwner: Any? = nil, viewName: String = String(describing: T.self), options: [UINib.OptionsKey : Any]? = nil) -> T where T: UIView
    {
        let bundle = Bundle(for: self)
        
        let nib = UINib(nibName: viewName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? T else
        {
            fatalError("Could not load \(viewName) from xib file.")
        }
        return view
    }
}
