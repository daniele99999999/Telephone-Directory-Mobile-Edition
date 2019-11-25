//
//  ListContactViewController.swift
//  TelephoneDirectory
//
//  Created by Daniele Salvioni on 12/11/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit
import SwifterSwift

class ListContactViewController: BaseViewController
{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ListPresenter!
    private var datasource: [ListViewData.CellViewData] = []
    
    internal var tableInsets: UIEdgeInsets { return .zero }
    
    class func createOne() -> ListContactViewController
    {
        let vc: ListContactViewController = self.loadFromStoryboard(storyboardName: Constants.Resources.Storyboards.main)
        return vc
    }
    
    override func setupUI()
    {
        super.setupUI()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addContactButtonPressed))
        
        self.view.backgroundColor = Constants.Colors.colorDDDDDD
        self.containerView?.backgroundColor = .clear
        self.tableView.backgroundColor = .clear
        
        self.searchBar.delegate = self
        
        self.tableView.registerCell(nibClass: ContactTableViewCell.self)
        self.tableView.contentInset = self.tableInsets
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = false
        self.tableView.bounces = true
        self.tableView.showsVerticalScrollIndicator = true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.presenter.setup()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.presenter.resetData()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        self.dismissKeyboard()
    }
    
    @IBAction func addContactButtonPressed()
    {
        self.presenter.newContact()
    }
}

extension ListContactViewController: UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        self.dismissKeyboard()
        
        self.presenter.searchContacts(text: self.searchBar.text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        self.presenter.searchContacts(text: self.searchBar.text)
    }
}

extension ListContactViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return min(1, self.datasource.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withClass: ContactTableViewCell.self, for: indexPath)
        
        let viewData = self.datasource[indexPath.row]
        cell.loadData(indexPath: indexPath, viewData: viewData)
        cell.delegate = self
        return cell
    }
}

extension ListContactViewController: ContactTableViewCellDelegate
{
    func editButtonPressed(indexPath: IndexPath)
    {
        self.presenter.editContact(index: indexPath.row)
    }
}

extension ListContactViewController: ListPresenterViewProtocol
{
    func updateMain(viewData: ListViewData.MainViewData)
    {
        self.title = viewData.title
        self.searchBar.placeholder = viewData.searchPlaceholder
        self.searchBar.text = viewData.searchValue
    }
    
    func updateCells(viewData: [ListViewData.CellViewData])
    {
        self.datasource = viewData
        self.tableView.reloadData()
    }
}


