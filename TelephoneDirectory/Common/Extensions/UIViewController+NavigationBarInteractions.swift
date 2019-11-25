//
//  UIViewController+NavigationBarInteractions.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

extension UIViewController
{
    func allNavigationBarButtonsEnabled(_ enabled: Bool)
    {
        var allBarButtonItems = [UIBarButtonItem]()
        allBarButtonItems.appendIfNotNil(contentsOf: self.navigationItem.leftBarButtonItems)
        allBarButtonItems.appendIfNotNil(contentsOf: self.navigationItem.rightBarButtonItems)
        for barButtonItem in allBarButtonItems
        {
            barButtonItem.isEnabled = enabled
        }
    }
    
}
