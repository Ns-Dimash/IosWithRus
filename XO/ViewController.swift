//
//  ViewController.swift
//  XO
//
//  Created by Dimash Nsanbaev on 2/15/23.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    private var dimash:UILabel = {
        let label = UILabel()
        label.text = "MAAAAl"
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(dimash)
        setupConst()
        
    }
    
    func setupConst(){
        dimash.snp.makeConstraints{make in
            make.center.equalToSuperview()
        }
    }

}

