//
//  MVCTableViewController.swift
//  TableViewMVC
//
//  Created by Amol on 10/11/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit

class MVCTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //Variable store data and display in tableview
    fileprivate var dataArray = [MVCTableViewDataModelItem]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    //Data source for tableview
    private let dataSource = MVCTableViewDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        dataSource.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        dataSource.requestData()
    }
}
extension MVCTableViewController: UITableViewDelegate {
    
}

extension MVCTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MVCTableViewCell.identifier, for: indexPath) as? MVCTableViewCell {
            
            cell.configureWithItem(item: dataArray[indexPath.item])
            
            return cell
        }
        return UITableViewCell()
    }
}

extension MVCTableViewController: MVCTableViewDataModelDelegate {
    func didRecieveDataUpdate(data: [MVCTableViewDataModelItem]) {
        dataArray = data
    }
    func didFailDataUpdateWithError(error: Error) {
        print("error: \(error.localizedDescription)")
    }
}
