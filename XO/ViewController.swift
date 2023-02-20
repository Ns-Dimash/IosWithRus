//
//  ViewController.swift
//  XO
//
//  Created by Dimash Nsanbaev on 2/15/23.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    let arr1 = ["roll1","roll2","roll3","roll4","roll5","roll6"]
    let arr2 = ["roll1","roll2","roll3","roll4","roll5","roll6"]
    
    

    private var firstRoll: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private var secondRoll: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let countLabel:UILabel = {
       var label = UILabel()
        label.text = ""
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(firstRoll)
        view.addSubview(secondRoll)
        view.addSubview(countLabel)
        setupConst()
        let ran1 = arr1.randomElement()!
        let ran2 = arr2.randomElement()!
        find(ran1)

        firstRoll.image = UIImage(named: "\(ran1)")
        secondRoll.image = UIImage(named: "\(ran2)")

    }
    
    func setupConst(){
        firstRoll.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(120)
            make.width.height.equalTo(70)
        }
        secondRoll.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(120)
            make.top.equalToSuperview().inset(50)
            make.width.height.equalTo(70)
        }
        countLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(60)
            make.top.equalToSuperview().inset(50)
            make.width.height.equalTo(70)
        }
        
        
    }

}

