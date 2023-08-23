//
//  OtherBillCell.swift
//  Payment
//
//  Created by k2 tam on 21/08/2023.
//

import UIKit

class BillCategoryCell: UITableViewCell {
    static let identifier = "BillCategoryCellID"
    
    static func nib() -> UINib {
        return UINib(nibName: "BillCategoryCell", bundle: nil)
    }
    
    var billCategoriesModel: BillCategoriesModel?
    
    @IBOutlet weak var billThumb1: UIImageView!
    @IBOutlet weak var billThumb2: UIImageView!
    @IBOutlet weak var billThumb3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        billThumb1.layer.cornerRadius = 10
        billThumb2.layer.cornerRadius = 10
        billThumb3.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
