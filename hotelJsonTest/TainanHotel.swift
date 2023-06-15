//
//  TainanHotel.swift
//  hotelJsonTest
//
//  Created by 吳宗祐 on 2023/6/16.
//

import Foundation

struct Hotel: Codable {
    //let id: String
    let name: String
    //let summary: String
    //let introduction: String
    let openTime: String
    let district: String
    let address: String
    let tel: String
    //let fax: String
    let lat: String // 其他檔案是存 Double
    let long: String // 其他檔案是存 Double


    enum CodingKeys: String, CodingKey {
        //case id
        case name
       // case summary
        //case introduction
        case openTime = "open_time"
        case district
        case address
        case tel
        //case fax
        case lat
        case long
    }
}
