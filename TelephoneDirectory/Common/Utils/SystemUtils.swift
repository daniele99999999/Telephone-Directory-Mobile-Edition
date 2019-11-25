//
//  SystemUtils.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

final class SystemUtils
{
    class var isPad: Bool
    {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    class var isPhone: Bool
    {
        return !self.isPad
    }
    
    class var isLandscape: Bool
    {
        return UIApplication.shared.statusBarOrientation.isLandscape
    }
    
    class var isPortrait: Bool
    {
        return !self.isLandscape
    }
    
    class func backgroundDelay(after: Double = 0.0, completion: @escaping () -> Void)
    {
        DispatchQueue.global().asyncAfter(deadline: .now() + after) { completion() }
    }
    
    class func mainDelay(after: Double = 0.0, completion: @escaping () -> Void)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + after) { completion() }
    }
    
    class func statusBarSize() -> CGSize
    {
        return UIApplication.shared.statusBarFrame.size
    }
    
    class func navigationBarSize() -> CGSize
    {
        return UIApplication.topViewController()?.navigationController?.navigationBar.frame.size ?? .zero
    }
    
    class func screenSize() -> CGSize
    {
        return UIScreen.main.bounds.size
    }
    
    class func minScreenDimension() -> CGFloat
    {
        return min(self.screenSize().width, self.screenSize().height)
    }
    
    class func maxScreenDimension() -> CGFloat
    {
        return max(self.screenSize().width, self.screenSize().height)
    }
}
