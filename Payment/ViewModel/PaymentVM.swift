//
//  PaymentViewModel.swift
//  Payment
//
//  Created by k2 tam on 22/08/2023.
//

import Foundation

protocol PaymentVMDelegate {
    func didGetNewTbvData()
}

enum PaymentSection {
    case banner([BannerDataModel])
    case billCategories(BillCategoryDataModel)
    case recentTransactions(TransactionDataModel)
}

class PaymentVM {
    var delegate: PaymentVMDelegate?
    var paymentTbvData:[PaymentSection] = []
    var bannerData: [BannerDataModel]?
    var billCategoriesData: BillCategoryDataModel?
    var recentTransactionData: TransactionDataModel?
    
    /// update lai data moi nhat
    private func composeData() {
        var temp: [PaymentSection] = []
        
        if let bannerData = bannerData {
            if bannerData.isEmpty {
                return
            }
            temp.append(.banner(bannerData))
        }
        
        if let billCategoriesData = billCategoriesData {
            temp.append(.billCategories(billCategoriesData))
        }
        
        if let recentTransactionData = recentTransactionData {
            temp.append(.recentTransactions(recentTransactionData))
        }
        
        self.paymentTbvData = temp
        
        ///Redload payment tbv data
        delegate?.didGetNewTbvData()

    }
    
  
    
    func fetchPaymentTblData() {
        PaymetManager.shared.callBannerAPI { [weak self] bannerData in
            guard let self = self else { return }
            self.bannerData = bannerData
            self.composeData()
        }
        
        PaymetManager.shared.callTransactionAPI { [weak self] recentTransactionData in
            guard let self = self else { return }
            self.recentTransactionData = recentTransactionData
            self.composeData()
        }
        
        PaymetManager.shared.callBillCategoryAPI { [weak self] billCategoriesData in
            guard let self = self else { return }
            self.billCategoriesData = billCategoriesData
            self.composeData()
           
        }
    } 
}
