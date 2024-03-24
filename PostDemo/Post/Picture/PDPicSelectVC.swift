//
//  PDPicSelectVC.swift
//  PostDemo
//
//  Created by liucl on 2024/3/24.
//

import UIKit

class PDPicSelectVC: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
              
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid_sel_pic", for: indexPath) as! PDPicSelectItemCell
        
        
        return cell
    }
}
