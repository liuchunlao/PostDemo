//
//  PDComposeVC.swift
//  PostDemo
//
//  Created by liucl on 2024/3/23.
//

import UIKit

class PDComposeVC: UIViewController {
    let maxTextCount = 10
    
    @IBOutlet weak var btnSend: UIBarButtonItem!
    @IBOutlet weak var txtV: UITextView!
    @IBOutlet weak var btmConsToolbar: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        regNotification()
        setupUI()
    }
    
    func setupUI() {
        txtV.addSubview(phLabel)
        
        
    }
    
    lazy var phLabel: UILabel = {
        let lbl = UILabel.init(frame: .init(x: 5, y: 8, width: 0, height: 0))
        lbl.text = "分享新鲜事儿~"
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = .lightGray
        lbl.sizeToFit()
        return lbl
    }()
    
    private func regNotification() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardChangeNoti(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardChangeNoti(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - 取消、发布
extension PDComposeVC {
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func sendAction(_ sender: Any) {
        
        
    }
}


// MARK: - 键盘处理
extension PDComposeVC {
    
    @objc func keyboardChangeNoti(_ noti: Notification) {
        let duration = noti.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        let rect = (noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        var height: CGFloat = 0
        if noti.name == UIResponder.keyboardWillShowNotification {
            height = rect.height
        }
        self.btmConsToolbar.constant = height
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
}

// MARK: - 文本改变
extension PDComposeVC: UITextViewDelegate {
    
    // 拖拽时关闭键盘
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        txtV.resignFirstResponder()
        
    }
    
    // 控制占位文字及发布按钮
    func textViewDidChange(_ textView: UITextView) {
        
        phLabel.isHidden = !textView.text.isEmpty
        btnSend.isEnabled = !textView.text.isEmpty
        
        var text = textView.text! as NSString
        if text.length > maxTextCount {
            text = text.substring(to: maxTextCount) as NSString
            textView.text = text as String
        }
    }
    
    // 限制文本长度
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            print("回车")
        }
        
        print("\(#function) \(text)")
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= maxTextCount
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtV.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        txtV.resignFirstResponder()
    }
    
}
