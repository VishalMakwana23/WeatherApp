//
//  ViewController.swift
//  WeatherApp
//
//  Created by DCS on 07/07/21.
//  Copyright © 2021 HRK. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    public var name = ""
    
    public let city:UITextField = {
        let textf = UITextField()
        textf.placeholder = "Enter City"
        textf.text = ""
        textf.textAlignment = .center
        textf.borderStyle = .roundedRect
        textf.backgroundColor = UIColor.init(white: 1, alpha: 3)
        return textf
    }()
    
    private let search:UIButton = {
        let btn = UIButton()
        btn.setTitle("Search", for: .normal)
        btn.addTarget(self, action: #selector(nextscreen), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 0.6)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "WeatherApp"
        
        let bckimage = UIImageView(frame: UIScreen.main.bounds)
        bckimage.image = UIImage(named: "back3")
        bckimage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(bckimage, at: 0)
        
        
        view.addSubview(city)
        view.addSubview(search)
        name = city.text!
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        city.frame = CGRect(x: 40, y: additionalSafeAreaInsets.top + 300, width: view.width - 60, height: 60)
        search.frame = CGRect(x: 40, y: city.bottom + 20, width: view.width - 60, height: 60)
    }
    
    @objc func nextscreen(){
        
        UserDefaults.standard.set(city.text, forKey: "name")
        let vc = viewweather()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}



    
