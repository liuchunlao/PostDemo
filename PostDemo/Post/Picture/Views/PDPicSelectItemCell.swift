//
//  PDPicSelectItemCell.swift
//  PostDemo
//
//  Created by liucl on 2024/3/24.
//

import UIKit

let pic_add_noti = Notification.Name(rawValue: "pic_add_noti")
let pic_del_noti = Notification.Name(rawValue: "pic_del_noti")

class PDPicSelectItemCell: UICollectionViewCell {
    
    let notiCenter = NotificationCenter.default
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnDel: UIButton!
    
    
    var image: UIImage? {
        didSet {
            if image == nil {
                btnDel.isHidden = true
                btnAdd.setImage(.init(named: "compose_pic_big_add"), for: .normal)
            } else {
                btnDel.isHidden = false
                btnAdd.setImage(image, for: .normal)
            }
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnAdd.imageView?.contentMode = .scaleAspectFill
    }
    
    // 移除
    @IBAction func deleteBtnClick() {
        notiCenter.post(name: pic_del_noti, object: self)
    }
    
    // 添加
    @IBAction func addBtnClick() {
        notiCenter.post(name: pic_add_noti, object: self)
    }
    
}
