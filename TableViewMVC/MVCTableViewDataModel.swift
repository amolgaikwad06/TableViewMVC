//
//  MVCTableViewDataModel.swift
//  TableViewMVC
//
//  Created by Amol on 10/11/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import Foundation

//Define a protocol for sending data back to view controller
protocol MVCTableViewDataModelDelegate: class {
    func didRecieveDataUpdate(data: [MVCTableViewDataModelItem])
    func didFailDataUpdateWithError(error: Error)
}


class MVCTableViewDataModel {
    
    //delegate property
    weak var delegate: MVCTableViewDataModelDelegate?
    
    func requestData() {
        //  this two variables will be returned from either an API call or local JSON file.
        
        let data: [AnyObject]? = nil
        let error: Error? = nil
        
        
        
        if let error = error {
            delegate?.didFailDataUpdateWithError(error: error)
        } else if let data = data {
            setDataWithResponse(response: data)
        }
    }
    
    private func handleError(error: Error) {
        
    }
    
    private func setDataWithResponse(response: [AnyObject]) {
        var data = [MVCTableViewDataModelItem]()
        for item in response {
            if let mvcTableViewDataModelItem = MVCTableViewDataModelItem(data: item as? [String: String]) {
                data.append(mvcTableViewDataModelItem)
            }
        }
        delegate?.didRecieveDataUpdate(data: data)
    }
}
