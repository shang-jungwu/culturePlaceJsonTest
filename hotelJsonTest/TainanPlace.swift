//
//  Hotel.swift
//  hotelJsonTest
//
//  Created by 吳宗祐 on 2023/6/14.
//

import Foundation

struct CulturalCenter: Codable {
    //let id: Int
    let name: String
    //let summary: String
    //let introduction: String
    let openTime: String
    let district: String
    let address: String
    let tel: String
    let lat: Double //緯度
    let long: Double //經度

    enum CodingKeys: String, CodingKey {
        case name
        case openTime = "open_time"
        case district
        case address
        case tel
        case lat
        case long
    }
}
