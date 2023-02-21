//
//  ViewController.swift
//  XO
//
//  Created by Dimash Nsanbaev on 2/15/23.
//

import UIKit
import SnapKit
class ViewController: UIViewController{
    
    
    var numPlayers = RegistrationViewController.textFieldValue
    var numpy = 4
//    asf
   
    
    let arr1 = ["roll1","roll2","roll3","roll4","roll5","roll6"]
    let arr2 = ["roll1","roll2","roll3","roll4","roll5","roll6"]
    

    
    private var map: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named:"map")
        return imageView
    }()
    
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
        label.text = "Count:0"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(firstRoll)
        view.addSubview(secondRoll)
        view.addSubview(countLabel)
        view.addSubview(map)
        setupConst()
        let ran1 = arr1.randomElement()!
        let ran2 = arr2.randomElement()!
        let cnt = arr1.firstIndex(of: ran1)! + arr2.firstIndex(of: ran2)! + 2
        
        countLabel.text = "Count: \(cnt)"
        countLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        firstRoll.image = UIImage(named: "\(ran1)")
        secondRoll.image = UIImage(named: "\(ran2)")
        
        print(numPlayers)
        print(countLabel.text!)

    }
    
    func setupConst(){
        map.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(420)
            
        }
        firstRoll.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(150)
            make.width.height.equalTo(50)
        }
        secondRoll.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(150)
            make.top.equalToSuperview().inset(50)
            make.width.height.equalTo(50)
        }
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(firstRoll.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(175)
        }
        
        
    }

}

