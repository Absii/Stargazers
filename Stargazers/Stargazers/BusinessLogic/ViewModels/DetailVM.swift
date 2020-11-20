//
//  DetailVM.swift
//  Stargazers
//
//  Created by Nicola Ferrara on 18/11/2020.
//

import UIKit

class DetailVM {
    
    private(set) var apiService: APIService
    
    var model: [User] = []
    
    
    init(user: [User]) {
        self.model = user
        self.apiService = APIService()
    }
}
