//
//  BillCategoryModel.swift
//  Payment
//
//  Created by k2 tam on 22/08/2023.
//

import Foundation

struct BillCategoryModel {
    let statusCode: Int
    let message: String
    let data: BillCategoryDataModel
}

struct BillCategoryDataModel {
    let total: Int
    let iconsPerRow: Int
    let items: [BillCategoryItemModel]
}

struct BillCategoryItemModel {
    let title: String
    let actionType: String
    let dataAction: String
    let iconUrl: String
    let data: BillCategoryItemDataModel
}

struct BillCategoryItemDataModel {
    let id: Int
    let name: String
}
