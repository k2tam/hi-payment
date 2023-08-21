//
//  OtherBillCell.swift
//  Payment
//
//  Created by k2 tam on 21/08/2023.
//

import UIKit

class OtherBillCell: UITableViewCell {
    static let identifier = "OtherBillCellID"
    
    static func nib() -> UINib {
        return UINib(nibName: "OtherBillCell", bundle: nil)
    }
    
    @IBOutlet weak var billThumb1: UIImageView!
    @IBOutlet weak var billThumb2: UIImageView!
    @IBOutlet weak var billThumb3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
