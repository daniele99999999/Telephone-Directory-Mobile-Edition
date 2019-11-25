//
//  UIVIewController+PresentModals.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func presentModallyInOverlay(viewController: UIViewController, transitionStyle: UIModalTransitionStyle = .crossDissolve, animated: Bool = true, completion: @escaping () -> Void)
    {
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = transitionStyle
        self.present(viewController, animated: animated, completion: completion)
    }
}
