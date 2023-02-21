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
    let options = ["red", "blue", "green", "yellow"]
    var index = 0
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
    lazy var segmentControl: UISegmentedControl = {
        var arr = [String]()
        for i in 0..<numPlayers {
            arr.append(options[i])
        }
        let control = UISegmentedControl(items: arr)
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        
        setupViews()
        setupConst()
        
        
        
        let ran1 = arr1.randomElement()!
        let ran2 = arr2.randomElement()!
        let cnt = arr1.firstIndex(of: ran1)! + arr2.firstIndex(of: ran2)! + 2
        
        countLabel.text = "Count: \(cnt)"
        countLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        firstRoll.image = UIImage(named: "\(ran1)")
        secondRoll.image = UIImage(named: "\(ran2)")
        
        segmentControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        print(numPlayers)
        print(countLabel.text!)

    }
    
    func setupViews() {
        view.addSubview(segmentControl)
        view.addSubview(firstRoll)
        view.addSubview(secondRoll)
        view.addSubview(countLabel)
        view.addSubview(map)
    }
    
    func setupConst(){
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
        }
        firstRoll.snp.makeConstraints { make in
            make.top.equalTo(segmentControl.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(150)
            make.width.height.equalTo(50)
        }
        secondRoll.snp.makeConstraints { make in
            make.top.equalTo(segmentControl.snp.bottom).offset(10)
            make.left.equalTo(firstRoll.snp.right).offset(10)
            make.width.height.equalTo(50)
        }
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(firstRoll.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        map.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(420)
        }
    }
    
    
    @objc func segmentedControlValueChanged(sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
        if index != -1 {
            let selectedSegmentTitle = sender.titleForSegment(at: index) ?? ""
            print("Selected option: \(selectedSegmentTitle)")
        }
    }


}

