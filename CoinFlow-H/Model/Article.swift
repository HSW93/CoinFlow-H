//
//  Article.swift
//  CoinFlow-H
//
//  Created by 황성우 on 2020/11/21.
//

import Foundation

struct NewsResponse: Codable {
    let articleArray: [Article]
}
struct Article: Codable {
    let title: String
    let link: String
    let date: String
    let timestamp: TimeInterval
    let description: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case date
        case timestamp
        case description
        case imageURL = "imageUrl"
    }
}
