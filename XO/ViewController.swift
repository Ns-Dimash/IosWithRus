//
//  ViewController.swift
//  XO
//
//  Created by Dimash Nsanbaev on 2/15/23.
//

import UIKit
import SnapKit
class ViewController: UIViewController{
    
        struct Person {
            var name: String
            var position: Int
            var money:Int
        }

        let person1 = Person(name: "red", position:0 , money: 2000000)
        let person2 = Person(name: "blue", position:0 , money: 2000000)

    var poss = 0
    
    var mapsArray = ["Go","Mediter-Ranean","Chest","Baltic","Tax","Reading","Oriental","Chance","Vermont","Connecticut","Just Visiting","St.Charles","Electric","States","Virginia","Pennsylvania","St.James","Chest","Tennessee","New York","Free Parking","Kentucky","Chance","Indiana","Illinois","B. & O.","Atlantic","Ventnor","Water","Marvin","GoToJail","Pacific","North Carolina","Chest","Pennsylvania","Short","Chance","ParkPlace","Luxury Tax","BoardWalk"]
    
    var numPlayers = RegistrationViewController.textFieldValue
    
    let options = ["red", "blue", "green", "yellow"]
    
    var index = 0
    var cnt = 0
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
        imageView.image = UIImage(named: "roll1")
        return imageView
    }()
    private var secondRoll: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "roll1")

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
    
    private let startButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(Tapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.setTitle("Start", for: .normal)
        return button
    }()
    
    private let buyButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buyTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.setTitle("Buy", for: .normal)
        return button
    }()
    
    private let notBuyButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(notBuyTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.setTitle("NotBuy", for: .normal)
        return button
    }()
    
    private let place:UILabel = {
       var label = UILabel()
        label.text = "Empty"
        return label
    }()
    
    

    @objc func Tapped(){
        let ran1 = arr1.randomElement()!
        let ran2 = arr2.randomElement()!
        cnt = arr1.firstIndex(of: ran1)! + arr2.firstIndex(of: ran2)! + 2
        
        countLabel.text = "Count: \(cnt)"
        countLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        firstRoll.image = UIImage(named: "\(ran1)")
        secondRoll.image = UIImage(named: "\(ran2)")
//        view.addSubview(buyButton)
//        view.addSubview(notBuyButton)
        place.text = "\(mapsArray[cnt])"
        place.font = UIFont.boldSystemFont(ofSize: 23.0)

    }
    @objc func buyTapped(){
        
    }
    @objc func notBuyTapped(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        
        setupViews()
        setupConst()
//        
//
        
        
        
//
//        let ran1 = arr1.randomElement()!
//        let ran2 = arr2.randomElement()!
//        let cnt = arr1.firstIndex(of: ran1)! + arr2.firstIndex(of: ran2)! + 2
//
//        countLabel.text = "Count: \(cnt)"
//        countLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
//
//        firstRoll.image = UIImage(named: "\(ran1)")
//        secondRoll.image = UIImage(named: "\(ran2)")
//
        segmentControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
       

    }
    
    func setupViews() {
        view.addSubview(segmentControl)
        view.addSubview(firstRoll)
        view.addSubview(secondRoll)
        view.addSubview(countLabel)
        view.addSubview(map)
        view.addSubview(startButton)
        view.addSubview(buyButton)
        view.addSubview(notBuyButton)
        view.addSubview(place)

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
        startButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(130)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        buyButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(40)
            make.bottom.equalTo(startButton.snp.top).inset(-10)
            make.width.equalTo(100)
        }
        notBuyButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(40)
            make.bottom.equalTo(startButton.snp.top).inset(-10)
            make.width.equalTo(100)
        }
        place.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
            
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

