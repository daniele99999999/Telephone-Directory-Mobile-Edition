//
//  BaseViewController.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController
{
    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet weak var containerView: UIView?
    
    public var orientations = UIInterfaceOrientationMask.all
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask
    {
        get { return self.orientations }
        set { self.orientations = newValue }
    }
    
    public var statusBarStyle = UIStatusBarStyle.default
    override var preferredStatusBarStyle : UIStatusBarStyle
    {
        get { return self.statusBarStyle }
        set { self.statusBarStyle = newValue }
    }
    
    override var prefersStatusBarHidden: Bool { return false }
    
    private (set) var alreadyWillAppeared: Bool = false
    private (set) var alreadyDidAppeared: Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        _ = self.hideKeyboardWhenTappedAround()
        
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        if !self.alreadyWillAppeared
        {
            self.alreadyWillAppeared = true
            self.viewWillAppearFirstTime()
        }
        
        self.updateNavigationBarUI()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        if !self.alreadyDidAppeared
        {
            self.alreadyDidAppeared = true
            self.viewDidAppearFirstTime()
        }
        
        self.scrollView?.addKeyboardEventsObserver()
    }
    
    func viewWillAppearFirstTime()
    {
        
    }
    
    func viewDidAppearFirstTime()
    {
        
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        
        self.dismissKeyboard()
        
        self.scrollView?.removeKeyboardEventsObserver()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.viewWillTransition(to: size, with: coordinator)
        
        let interfaceOrientation: UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
        let startSize: CGSize = self.view.frame.size
        
        self.controllerWillChangeOrientation(startInterfaceOrientation: interfaceOrientation, startSize: startSize, endSize: size, context: coordinator)
        
        coordinator.animate(alongsideTransition:
        {(_ context: UIViewControllerTransitionCoordinatorContext) -> Void in
            self.controllerAlongsideChangeOrientation(startInterfaceOrientation: interfaceOrientation, startSize: startSize, endSize: size, context: coordinator)
        },
                            completion:
        {(_ context: UIViewControllerTransitionCoordinatorContext) -> Void in
            self.controllerDidChangeOrientation(startInterfaceOrientation: interfaceOrientation, startSize: startSize, endSize: size, context: coordinator)
        })
    }
    
    func controllerWillChangeOrientation(startInterfaceOrientation: UIInterfaceOrientation, startSize: CGSize, endSize: CGSize, context: UIViewControllerTransitionCoordinatorContext)
    {
        
    }
    
    func controllerAlongsideChangeOrientation(startInterfaceOrientation: UIInterfaceOrientation, startSize: CGSize, endSize: CGSize, context: UIViewControllerTransitionCoordinatorContext)
    {
        
    }
    
    func controllerDidChangeOrientation(startInterfaceOrientation: UIInterfaceOrientation, startSize: CGSize, endSize: CGSize, context: UIViewControllerTransitionCoordinatorContext)
    {
        
    }
    
    func setupUI()
    {
        UIScrollView.fixedKeyboardAdjustingHeightFactor = 0.0
        
        self.updateNavigationBarUI()
        
        self.showNavigationBar(show: true, animated: false)
    }
}



// MARK: - NavigationBar
extension BaseViewController
{
    public func updateNavigationBarUI()
    {
        self.updateLeftItems()
        self.updateRightItems()
        self.updateBasicLayout()
    }
    
    public func updateBasicLayout()
    {
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.edgesForExtendedLayout = UIRectEdge.all
        self.extendedLayoutIncludesOpaqueBars = false
    }
    
    func updateLeftItems()
    {
        self.showBackArrowOnly()
    }
    
    func updateRightItems()
    {
        
    }
    
    func showNavigationBar(show: Bool, animated: Bool)
    {
        self.navigationController?.setNavigationBarHidden(!show, animated: animated)
    }
    
    @objc private func navigationBack()
    {
        self.navigationController?.popViewController(animated: true)
    }
}
