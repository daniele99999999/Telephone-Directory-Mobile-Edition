//
//  ActivityIndicator.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import SwiftSpinner
import SwifterSwift

public class ActivityIndicator: ActivityIndicatorProtocol
{    
    public func showActivityIndicator(title: String? = nil, animated: Bool = true)
    {
        SwiftSpinner.show(title ?? NSLocalizedString("activity.get.title.message", comment: ""), animated: animated)
    }
    
    public func showActivityIndicatorSuccess(title: String? = nil, animated: Bool = true)
    {
        SwiftSpinner.show(duration: 1.0, title: title ?? NSLocalizedString("activity.success.title.message", comment: ""), animated: animated)
    }
    
    public func showActivityIndicatorFailure(title: String? = nil, animated: Bool = true)
    {
        SwiftSpinner.show(duration: 1.0, title: title ?? NSLocalizedString("activity.failure.title.message", comment: ""), animated: animated)
    }
    
    public func hideActivityIndicator(animated: Bool)
    {
        SwiftSpinner.hide()
    }
}

