//
//  StargazersTableViewCell.swift
//  Stargazers
//
//  Created by Nicola Ferrara on 20/11/2020.
//

import UIKit

class StargazersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var ownerImageView: UIImageView!
    
    private(set) var apiService = APIService ()

    
    func config(owner: String, image: URL) {
        self.ownerLabel.text = owner
        
        self.apiService.getImage(from: image) { (img) in
            DispatchQueue.main.async {
                self.ownerImageView.image = img
            }
        }
    }
}
