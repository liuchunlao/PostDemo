//
//  ViewController.swift
//  PostDemo
//
//  Created by liucl on 2024/3/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func postAction(_ sender: Any) {
        
        let sb = UIStoryboard.init(name: "PDComposeVC", bundle: nil)
        let vc = sb.instantiateInitialViewController()!
        present(vc, animated: true)
    }
    
}

