//
//  User.swift
//  Stargazers
//
//  Created by Nicola Ferrara on 18/11/2020.
//

import UIKit

struct User: Decodable {
    let name: String
    let avatarUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatarUrl = "avatar_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        avatarUrl = try values.decode(URL.self, forKey: .avatarUrl)
    }
}
