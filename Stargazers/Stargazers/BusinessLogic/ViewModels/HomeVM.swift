//
//  HomeVM.swift
//  Stargazers
//
//  Created by Nicola Ferrara on 18/11/2020.
//

import UIKit

final class HomeVM {
    
    private(set) var apiService: APIService
    
    var apiFinish: ((Bool)-> Void)?
    
    var model: [User] = []
    
    init() {
        self.apiService = APIService()
    }
    
    func getData(with owner: String, repository: String) {
        self.apiService.apiToGetStargazersData(owner: owner, repository: repository) { [weak self] (empData) in
            guard let self = self else { return }
            if let model = empData {
                self.model = model
                self.apiFinish?(true)
            } else {
                self.apiFinish?(false)
            }
        }
    }
}
