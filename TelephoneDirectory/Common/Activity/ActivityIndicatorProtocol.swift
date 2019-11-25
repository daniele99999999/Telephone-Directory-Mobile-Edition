//
//  ActivityIndicatorProtocol.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

public protocol ActivityIndicatorProtocol: class
{    
    func showActivityIndicator(title: String?, animated: Bool)
    func showActivityIndicatorSuccess(title: String?, animated: Bool)
    func showActivityIndicatorFailure(title: String?, animated: Bool)
    func hideActivityIndicator(animated: Bool)
}
