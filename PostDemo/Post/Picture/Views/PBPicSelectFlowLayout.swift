//
//  PBPicSelectFlowLayout.swift
//  PostDemo
//
//  Created by liucl on 2024/3/24.
//

import UIKit

class PBPicSelectFlowLayout: UICollectionViewFlowLayout {
    
    
    override func prepare() {
        super.prepare()
        
        let ksw = UIScreen.main.bounds.size.width
//        let ksh = UIScreen.main.bounds.size.height
        let itemW = (ksw - 20) / 3
        let itemH = itemW
        itemSize = .init(width: itemW, height: itemH)
        
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
        sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
    }
}
