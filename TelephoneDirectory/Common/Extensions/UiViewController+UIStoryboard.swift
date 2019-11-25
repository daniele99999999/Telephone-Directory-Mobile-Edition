//
//  UiViewController+UIStoryboard.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController
{
    class func loadFromStoryboard<T>(storyboardName: String, viewControllerName: String = String(describing: T.self), bundle: Bundle? = nil) -> T where T: UIViewController
    {
        let bundle = Bundle(for: self)
        
        guard let viewController = UIStoryboard(name: storyboardName, bundle: bundle).instantiateViewController(withIdentifier: viewControllerName) as? T else
        {
            fatalError("Could not load \(viewControllerName) from \(storyboardName) file.")
        }
        return viewController
    }
}
