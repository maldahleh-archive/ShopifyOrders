//
//  ShippingAddress.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-13.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

class ShippingAddress: Decodable {
    var name: String!
    var firstName: String!
    var lastName: String!
    var phone: String!
    
    var company: String?
    var addressLineOne: String!
    var addressLineTwo: String?
    var city: String!
    var province: String!
    var provinceCode: String!
    var zip: String!
    var country: String!
    var countryCode: String!
    
    var latitude: Double!
    var longitude: Double!
    
    enum CodingKeys: String, CodingKey {
        case name
        case firstName = "first_name"
        case lastName = "last_name"
        case phone
        case company
        case addressLineOne = "address1"
        case addressLineTwo = "address2"
        case city
        case province
        case provinceCode = "province_code"
        case zip
        case country
        case countryCode = "country_code"
        case latitude
        case longitude
    }
}
