//
//  ViewController.swift
//  XO
//
//  Created by Dimash Nsanbaev on 2/15/23.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    let arr = ["roll1","roll2","roll3","roll4","roll5","roll6"]
    lazy var ran:Array = {
        return arr
    }()
    let random = ran.randomElement()
    
    private var backgroundImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "\(random)")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(backgroundImageView)
        setupConst()
        print(random)
    }
    
    func setupConst(){
        backgroundImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
    }

}

