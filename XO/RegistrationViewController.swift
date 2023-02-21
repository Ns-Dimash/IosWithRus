//
//  RegistrationViewController.swift
//  XO
//
//  Created by Dimash Nsanbaev on 2/21/23.
//

import UIKit
import SnapKit

class RegistrationViewController: UIViewController {
    
    
    static var textFieldValue = 0
    
    private let justLabel:UILabel = {
        var label = UILabel()
        label.text = "How many players?"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        return label
    }()
    
    
    private let countPlayers:UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 2
        text.textAlignment = .center
        text.font = UIFont(name: "Times", size: 30)
        text.layer.borderColor = UIColor.black.cgColor
        return text
    }()
    
    
    private let buttonPlayers:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(Tapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.setTitle("Let's Go", for: .normal)
        return button
    }()
    
    @objc func Tapped(){
        RegistrationViewController.textFieldValue = Int(countPlayers.text!)!
        if RegistrationViewController.textFieldValue>4{
            justLabel.text = "Max Players is 4"
        }else{
            justLabel.text = "Counts of Players is \(RegistrationViewController.textFieldValue)"
            let vc = ViewController()
            navigationController?.pushViewController(vc, animated: true)
            navigationItem.title = "Home!"
            
        }
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Welcome!"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .black
        
        view.addSubview(justLabel)
        view.addSubview(countPlayers)
        view.addSubview(buttonPlayers)
        
        setupConst()
    }
    
    func setupConst(){
        
        justLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(300)
        }
        
        countPlayers.snp.makeConstraints { make in
            make.top.equalTo(justLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        buttonPlayers.snp.makeConstraints { make in
            make.top.equalTo(countPlayers.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
            
        }
    }
    
    
}
