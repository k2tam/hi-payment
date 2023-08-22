//
//  BannerModel.swift
//  Payment
//
//  Created by k2 tam on 22/08/2023.
//

import Foundation

struct BannerModel {
    let statusCode: Int
    let message: String
    let data: [BannerDataModel]
    
}

struct BannerDataModel {
    let id: Int
    let imageUrl: String
    let action: BannerActionModel
}

struct BannerActionModel {
    let dataAction: String
    let actionType: String
    let actionData: String
    
}
