//
//  NewsViewController.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 23.03.2024.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var news = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.dataSource = self
        
        let news1 = News(imageView: UIImage(systemName: "star"), title: "", detail: "")
        let news2 = News(imageView: UIImage(systemName: "star"), title: "", detail: "")
        let news3 = News(imageView: UIImage(systemName: "star"), title: "", detail: "")
        
        news = [news1, news2, news3]
    }

}


extension NewsViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCell
        
        cell.setup(model: news[indexPath.row])
        
        return cell
    }
    
    
    
    
    
    
}
