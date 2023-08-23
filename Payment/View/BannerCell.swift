//
//  BannerCell.swift
//  Payment
//
//  Created by k2 tam on 17/08/2023.
//

import UIKit
import Kingfisher

class BannerCell: UITableViewCell {
    static let identifier = "BannerCellID"
    
    static func nib() -> UINib {
        return UINib(nibName: "BannerCell", bundle: nil)
    }
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    let pc = CustomPageControl.init(frame: .zero)
    
    var bannerData: [BannerDataModel]? {
        didSet {
            bannerCollectionView.reloadData()
            setupPageControl()

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupPageControl()
        setupCollectionView()

    }
    
    private func setupPageControl() {
        pc.currentPageIndicatorTintColor = .blue
        pc.pageIndicatorTintColor = .white
        
        pc.numberOfPages = bannerData?.count ?? 0
        

        pc.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(pc)
        
        contentView.addConstraints([
            
            pc.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            pc.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            pc.heightAnchor.constraint(equalToConstant: 12),
            pc.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5, constant: 0)
            
        ])
        
        DispatchQueue.main.async {
               self.pc.updateSelectedDotAppearance()
           }
        
    }

    
    private func setupCollectionView() {
        bannerCollectionView.layer.cornerRadius = 8
        bannerCollectionView.clipsToBounds = true
        
        
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        
        bannerCollectionView.register(BannerCollectionItem.nib(), forCellWithReuseIdentifier: BannerCollectionItem.identifier)
    }
    
}

extension BannerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionItem.identifier, for: indexPath) as? BannerCollectionItem
        
        guard let cell = cell, let bannerData = bannerData else{
            print("Cell or banner model is nil")
            return UICollectionViewCell()
        }
        
        
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        
        guard let bannerImgUrl = URL(string: bannerData[indexPath.item].imageUrl) else {
            return UICollectionViewCell()
        }
        
        cell.imageView.kf.setImage(with: bannerImgUrl)

        return cell
    }
    
    
}

extension BannerCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            // Calculate the current page based on the current content offset
            let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
            pc.currentPage = currentPage
        }
    
}



