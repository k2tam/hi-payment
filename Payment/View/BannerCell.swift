//
//  BannerCell.swift
//  Payment
//
//  Created by k2 tam on 17/08/2023.
//

import UIKit

class BannerCell: UITableViewCell {
    static let identifier = "BannerCellID"
    
    static func nib() -> UINib {
        return UINib(nibName: "BannerCell", bundle: nil)
    }
    
    let pc = CustomPageControl.init(frame: .zero)

    
    private var bannerImages: [String]? = ["banner1","banner2","banner3","banner4"]
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    
    func setBannerImages(images: [String]) {
        self.bannerImages = images
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        setupPageControl()
        setupCollectionView()
        

        
    }
    
    private func setupPageControl() {
        pc.currentPageIndicatorTintColor = .blue
        pc.pageIndicatorTintColor = .white
        
        pc.numberOfPages = bannerImages?.count ?? 0

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
        return bannerImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionItem.identifier, for: indexPath) as? BannerCollectionItem
        
        guard let cell = cell else{
            print("Cell is nil")
            return UICollectionViewCell()
        }
        
        
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        cell.imageView.image = UIImage(named: bannerImages?[indexPath.item] ?? "banner1")

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



