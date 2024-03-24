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
        
        let marginL = 10.0
        let marginH = 10.0
        let col = 3.0
        let itemW = (ksw - 2 * marginL - (col - 1) * marginH) / col
        let itemH = itemW
        itemSize = .init(width: itemW, height: itemH)
        
        minimumLineSpacing = marginH
        minimumInteritemSpacing = marginH
        sectionInset = .init(top: marginL, left: marginL, bottom: marginL, right: marginL)
    }
}
