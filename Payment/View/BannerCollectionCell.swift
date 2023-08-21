//
//  BannerCollectionCell.swift
//  Payment
//
//  Created by k2 tam on 20/08/2023.
//

import UIKit

class BannerCollectionCell: UICollectionViewCell {
    
    static let identifier = "BannerCollectionCellID"
    
    static func nib() -> UINib {
        return UINib(nibName: "BannerCollectionCell", bundle: nil)
    }

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    

}
