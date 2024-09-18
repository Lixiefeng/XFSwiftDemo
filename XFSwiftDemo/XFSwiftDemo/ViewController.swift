//
//  ViewController.swift
//  XFSwiftDemo
//
//  Created by Aron.Li on 2024/3/22.
//

import UIKit
import CryptoKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private lazy var button: UIButton = {
        let button = UIButton.systemButton(with: UIImage(named: "img_bill_payWay_banner")!, target: self, action: #selector(onTapEvent(_:)))
        button.frame = CGRectMake((self.view.frame.size.width-300)/2, 200, 300, 44)
        button.buryId = "tap_ViewController_UIButton8888"
        return button
    }()
    
    @objc private func onTapEvent(_ sender: UIButton) {
//        NotificationCenter.default.post(name: .BuryEventControl, object: nil, userInfo: ["bury_id": sender.buryId ?? ""])
    }
}

