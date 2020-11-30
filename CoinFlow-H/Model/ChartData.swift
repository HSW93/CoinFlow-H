//
//  ChartData.swift
//  CoinFlow-H
//
//  Created by 황성우 on 2020/11/21.
//

import Foundation

struct ChartDataResponse: Codable {
    let chartDatas: [ChartData]
    enum CodingKeys: String, CodingKey {
        case chartDatas = "Data"
    }
}
struct ChartData: Codable {
    let time: TimeInterval
    let closePrice: Double
    enum CodingKeys: String, CodingKey {
        case time
        case closePrice = "close"
    }
}
