//
//  UIViewController+EndEditing.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func hideKeyboardWhenTappedAround(cancelTouches: Bool = false) -> UITapGestureRecognizer
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = cancelTouches
        self.view.addGestureRecognizer(tap)
        return tap
    }

    @objc func dismissKeyboard()
    {
        self.view.endEditing(true)
    }
}
