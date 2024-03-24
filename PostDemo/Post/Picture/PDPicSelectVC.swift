//
//  PDPicSelectVC.swift
//  PostDemo
//
//  Created by liucl on 2024/3/24.
//

import UIKit

class PDPicSelectVC: UICollectionViewController {
    let notiCenter = NotificationCenter.default
    
    var imgList: [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        regNoti()
    }
    
    private func regNoti() {
        notiCenter.addObserver(self, selector: #selector(addPicNoti(_:)), name: pic_add_noti, object: nil)
        notiCenter.addObserver(self, selector: #selector(delPicNoti(_:)), name: pic_del_noti, object: nil)
    }
    
    @objc func addPicNoti(_ noti: Notification) {
        let obj = noti.object as! PDPicSelectItemCell
        if obj.image != nil {
            // 已设置图片
           return
        }
        let vc = UIImagePickerController.init()
        vc.modalPresentationStyle = .fullScreen
        vc.sourceType = .savedPhotosAlbum
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func delPicNoti(_ noti: Notification) {
        let obj = noti.object as! PDPicSelectItemCell
        if let path = collectionView.indexPath(for: obj) {
            imgList.remove(at: path.item)
            collectionView.reloadData()
        }
        
    }
    
    deinit {
        notiCenter.removeObserver(self)
    }
}

extension PDPicSelectVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgList.append(img.scaleImage(width: 220))
        collectionView.reloadData()
        picker.dismiss(animated: true)
    }
}

extension PDPicSelectVC {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgList.count + 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid_sel_pic", for: indexPath) as! PDPicSelectItemCell
        
        let item = indexPath.item
        if item < imgList.count {
            cell.image = imgList[item]
        } else {
            cell.image = nil
        }
        
        return cell
    }
}
