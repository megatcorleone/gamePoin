//
//  MainMenuViewController.swift
//  HackPoin
//
//  Created by Globaltium on 03/05/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import LGSideMenuController
import Kingfisher

class MainMenuViewController: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    // MARK:- properties
    
    fileprivate let imageNames = ["AOV.png","Dota2.jpg","Dota2-1.jpg"]
    fileprivate var numberOfItems = 3
    
    
    
    var collectionImage : Array<MyData> = [] 
    
//        var collectionImage = [UIImage(named: "AOV"), UIImage(named: "Dota2"), UIImage(named: "Dota2-1")]
    
    
    
    
    // MARK:- pagerView Properties start
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = .zero
            self.pagerView.automaticSlidingInterval = 1.0
            self.pagerView.isInfinite = true
            
        }
    }
    
    @IBOutlet weak var pageControl: FSPageControl! {
        
        didSet {
            self.pageControl.numberOfPages = self.imageNames.count
            self.pageControl.contentHorizontalAlignment = .center
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            self.pageControl.setFillColor(.cyan, for: .selected)
            self.pageControl.setFillColor(.gray, for: .normal)
            

        }
    }
    
    // MARK:- pagerView Properties end

    
    
    
    
//    var listItem: Array<MyData> = []
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        
    }

    
    
    

    // MARK:- pagerView Delegate and Datasource start
    
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return numberOfItems
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)

        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleToFill
        cell.imageView?.clipsToBounds = true
        cell.textLabel?.text = index.description+index.description
        return cell
    }
    
    
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
        self.pageControl.currentPage = index
    }
    
    // MARK:- pagerView Delegate and Datasource end
    
    // MARK:- UICollectionView Delegate and Datasource start
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionImage.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let order = self.collectionImage[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSliderCollectionViewCell", for: indexPath) as! ImageSliderCollectionViewCell
        

        let url = URL(string: "\(order.jsonFormat!["image_url"].rawValue as! String)")
        cell.imageSlide.kf.setImage(with: url)
        
//        cell.imageSlide.image = collectionImage[indexPath.row]
        
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    // MARK:- UICollectionView Delegate and Datasource end
    
    
    
    
    
    
    

    
}
