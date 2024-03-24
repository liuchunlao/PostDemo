//
//  UIImage+Extension.swift
//  PostDemo
//
//  Created by liucl on 2024/3/24.
//

import UIKit

extension UIImage {
    
    
    func scaleImage(width: CGFloat) -> UIImage {
        
        let size = scaleImageSize(width: width)
        
        UIGraphicsBeginImageContext(size)
        
        self.draw(in: .init(origin: .zero, size: size))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return img!
    }
    
    
    private func scaleImageSize(width: CGFloat) -> CGSize {
        let scale = size.width / width
        let height = size.height / scale
        return .init(width: width, height: height)
    }
    
    
}
