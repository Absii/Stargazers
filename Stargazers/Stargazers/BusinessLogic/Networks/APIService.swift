//
//  APIService.swift
//  Stargazers
//
//  Created by Nicola Ferrara on 18/11/2020.
//

import UIKit

final class APIService: NSObject {
    
    func apiToGetStargazersData(owner: String, repository: String, completion : @escaping ([User]?) -> ()){
        
        if let sourcesURL = URL(string: Constants.API.STARGAZERS_FIRST_URL+"\(owner)" + "/" + "\(repository)"+Constants.API.STARGAZERS_SECOND_URL) {
            URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
                if let data = data {
                    
                    let jsonDecoder = JSONDecoder()
                    
                    let empData = try? jsonDecoder.decode([User].self, from: data)
                    
                    completion(empData)
                }
                
            }.resume()
        } else {
            print("Invalid URL")
        }
    }
    
    func getImage(from url: URL, completion: @escaping (UIImage?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let data = data {
                completion(UIImage(data: data))
            }
        }.resume()
    }
}
