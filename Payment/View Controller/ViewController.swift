//
//  ViewController.swift
//  Payment
//
//  Created by k2 tam on 17/08/2023.
//

import UIKit

enum PaymentSection {
    case banner
    case otherBills
    case recentTrans
}

class ViewController: UIViewController {
    
    private let data:[PaymentSection] = [.banner,.otherBills,.recentTrans]
    
    @IBOutlet weak var paymentTblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTblView()
        
    }
    
    private func setupTblView() {
        paymentTblView.dataSource = self
        paymentTblView.delegate = self
        
        paymentTblView.register(HeaderSectionView.nib(), forHeaderFooterViewReuseIdentifier: HeaderSectionView.identifier)
        
        paymentTblView.register(BannerCell.nib(), forCellReuseIdentifier: BannerCell.identifier)
        paymentTblView.register(OtherBillCell.nib(), forCellReuseIdentifier: OtherBillCell.identifier)
        paymentTblView.register(RecentTransactionCell.nib(), forCellReuseIdentifier: RecentTransactionCell.identifier)
        
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch data[section] {
        case .banner:
            return 1
        case.otherBills:
            return 1
        case .recentTrans:
            return 1
            
        }
    }
    
    //MARK: - Header section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if data[section] == .banner {
            return nil
        }
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderSectionView.identifier) as? HeaderSectionView
        
        guard let headerView = headerView else {
            print("Header View is nil")
            return nil
        }
        
        
        switch data[section] {
        case .banner:
            return nil
        case .otherBills:
            headerView.configure(leadingLabel: "Hoá đơn khác")
        case .recentTrans:
            headerView.configure(leadingLabel: "Giao dịch gần đây")
        }
        
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if data[section] == .banner {
            return 0
        }else {
            return 32.0 // Adjust this value to your desired top distance
        }
        
    }
    
    
    //MARK: - Cell for rows
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (data[indexPath.section]){
        case .banner:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell
            
            guard let cell = cell else {
                print("Cell is nil")
                return UITableViewCell()
            }
            
            return cell
        case .otherBills:
            let cell = tableView.dequeueReusableCell(withIdentifier: OtherBillCell.identifier, for: indexPath) as? OtherBillCell
            
            guard let cell = cell else {
                print("Cell is nil")
                return UITableViewCell()
                
            }
            
            return cell
            
        case .recentTrans:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecentTransactionCell.identifier, for: indexPath) as? RecentTransactionCell
            
            guard let cell = cell else {
                print("Cell is nil")
                return UITableViewCell()
                
            }
            
            return cell
  
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        switch data[indexPath.section] {
        case .banner:
            return 80.0
        case .otherBills:
            return 120.0
        default:
            return UITableView.automaticDimension
            
        }
 
    }

}


extension ViewController: UITableViewDelegate {
    
}

