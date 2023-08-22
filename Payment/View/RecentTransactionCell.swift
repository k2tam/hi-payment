//
//  RecentTransactionCell.swift
//  Payment
//
//  Created by k2 tam on 21/08/2023.
//

import UIKit

class RecentTransactionCell: UITableViewCell {
    static let identifier = "RecentTransactionCellID"
    
    static func nib() -> UINib {
        return UINib(nibName: "RecentTransactionCell", bundle: nil)
    }
    
    @IBOutlet weak var transactionID: UILabel!
    @IBOutlet weak var transactionTitle: UILabel!
    @IBOutlet weak var transactionTotal: UILabel!
    @IBOutlet weak var transactionTime: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = 8.0
        contentView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
