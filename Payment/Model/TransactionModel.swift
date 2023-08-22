//
//  PaymentModel.swift
//  Payment
//
//  Created by k2 tam on 22/08/2023.
//

import Foundation


struct RecentTransactionModel {
    let statusCode: Int
    let message: String
    let data: TransactionDataModel
}

struct TransactionDataModel {
    let histories: [TransactionHistoryModel]
    let content: TransactionContentModel
}

struct TransactionHistoryModel {
    let title: String
    let transactionTime: String
    let total: Int
    let totalText: String
    let currency: String
    
}

struct TransactionContentModel {
    let textNoBill: String
}
