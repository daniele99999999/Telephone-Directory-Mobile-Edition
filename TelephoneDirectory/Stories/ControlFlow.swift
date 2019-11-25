//
//  ControlFlow.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift

final class ControlFlow
{
    private let window: UIWindow
    private var globalNavigation: UINavigationController
    private var contactPersistence: PersistenceProtocol
    
    init(contactPersistence: PersistenceProtocol)
    {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.globalNavigation = UINavigationController()
        self.contactPersistence = contactPersistence
    }
    
    private func setupRootController(viewController: UIViewController)
    {
        self.window.rootViewController = viewController
        self.window.makeKeyAndVisible()
    }
    
    private var switchRootVCTransitionOptions: UIWindow.TransitionOptions
    {
        var options = UIWindow.TransitionOptions()
        options.direction = .fade
        options.duration = 0.25
        options.style = .easeOut
        return options
    }
    
    func start()
    {
        let vc = self.createList()
        self.globalNavigation.setViewControllers([vc], animated: false)
        self.setupRootController(viewController: self.globalNavigation)
    }
}

private extension ControlFlow
{
    func createList() -> UIViewController
    {
        let vc = ListContactViewController.createOne()
        vc.presenter = ListPresenter(contactPersistance: self.contactPersistence,
                                     viewDelegate: vc,
                                     flowDelegate: self)
        return vc
    }
    
    func createEdit(contact: ContactModel) -> UIViewController
    {
        let vc = EditContactViewController.createOne()
        vc.presenter = EditPresenter(contact: contact,
                                     contactPersistance: self.contactPersistence,
                                     viewDelegate: vc,
                                     flowDelegate: self)
        return vc
    }
    
    func createAdd() -> UIViewController
    {
        let vc = AddContactViewController.createOne()
        vc.presenter = AddPresenter(contactPersistance: self.contactPersistence,
                                    viewDelegate: vc,
                                    flowDelegate: self)
        return vc
    }
    
    func createImport() -> UIViewController
    {
        let vc = ImportContactViewController.createOne()
        vc.presenter = ImportPresenter(permissionManager: PermissionManager(),
                                       nativeContactManager: NativeContactManager(),
                                       viewDelegate: vc,
                                       flowDelegate: self)
        return vc
    }
}

private extension ControlFlow
{
    func flowEdit(animated: Bool = true, contact: ContactModel)
    {
        let vc = self.createEdit(contact: contact)
        self.globalNavigation.pushViewController(vc, animated: animated)
    }
    
    func flowAdd(animated: Bool = true)
    {
        let vc = self.createAdd()
        self.globalNavigation.pushViewController(vc, animated: animated)
    }
    func flowImport(animated: Bool = true)
    {
        let vc = self.createImport()
        self.globalNavigation.pushViewController(vc, animated: animated)
    }
}

extension ControlFlow: ListPresenterFlowProtocol
{
    func requestFlowAddContact(presenter: ListPresenter)
    {
        self.flowAdd(animated: true)
    }
    
    func requestFlowEditContact(presenter: ListPresenter, contact: ContactModel)
    {
        self.flowEdit(animated: true, contact: contact)
    }
}

extension ControlFlow: AddPresenterFlowProtocol
{
    func requestFlowImport(presenter: AddPresenter)
    {
        self.flowImport(animated: true)
    }
    
    func requestFlowClose(presenter: AddPresenter)
    {
        self.globalNavigation.popToRootViewController(animated: true)
    }
}

extension ControlFlow: EditPresenterFlowProtocol
{
    func requestFlowClose(presenter: EditPresenter)
    {
        self.globalNavigation.popToRootViewController(animated: true)
    }
}

extension ControlFlow: ImportPresenterFlowProtocol
{
    func requestFlowImportContact(presenter: ImportPresenter, contact: ContactModel)
    {
        self.flowEdit(animated: true, contact: contact)
    }
}
