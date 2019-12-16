//
//  RootClass.swift
//  NewsDetailsApp
//
//  Created by SYDULU THAPPETLA on 14/12/19.
//  Copyright © 2019 SYDULU THAPPETLA. All rights reserved.
//

import Foundation
struct RootClass : Decodable {
    
    let articles : [Article]?
    let status : String?
    let totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
        case articles = "articles"
        case status = "status"
        case totalResults = "totalResults"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        articles = try values.decodeIfPresent([Article].self, forKey: .articles)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
    
}
