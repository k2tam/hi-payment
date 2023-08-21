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
    
    private var bannerImages: [String]? = ["banner1","banner2","banner3"]
    
    @IBOutlet weak var pageControl: UIPageControl!
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
        pageControl.numberOfPages = bannerImages?.count ?? 0
        pageControl.currentPage = 0
    }
    
    private func setupCollectionView() {
        bannerCollectionView.layer.cornerRadius = 8
        bannerCollectionView.clipsToBounds = true
        
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self

        
        bannerCollectionView.register(BannerCollectionCell.nib(), forCellWithReuseIdentifier: BannerCollectionCell.identifier)
        
        
    }
    
}

extension BannerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionCell.identifier, for: indexPath) as? BannerCollectionCell
        
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
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
 
        pageControl.currentPage = indexPath.item
    }
    
    
}



