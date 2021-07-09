//
//  wcell.swift
//  WeatherApp
//
//  Created by DCS on 08/07/21.
//  Copyright © 2021 HRK. All rights reserved.
//

import UIKit

class Wcell: UITableViewCell {
    
    private let myimageview:UIImageView = {
        let imgv = UIImageView()
        imgv.layer.cornerRadius = 40
        imgv.clipsToBounds = true
        return imgv
    }()
    
    private let mylabel:UILabel = {
        let lab = UILabel()
        lab.font = UIFont.boldSystemFont(ofSize: 22)
        return lab
    }()
    
    public let mybutton:UIButton = {
        let btn = UIButton()
        //btn.setImage(UIImage(named: ""), for: .normal)
        btn.setTitle("Click here", for: .normal)
        btn.tintColor = UIColor.black
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    func setupcell(city name:Citydetail)
    {
        //myimageview.image = UIImage(named: name)
        mylabel.text = name.location.name
        //mybutton.tag = index
        
        //contentView.addSubview(myimageview)
        contentView.addSubview(mylabel)
        //contentView.addSubview(mybutton)
        
        //myimageview.frame = CGRect(x: 20, y: 10, width: 80, height: 80)
        
        mylabel.frame = CGRect(x: myimageview.right + 20, y: 10, width: 140, height: 80)
    }
    /*
    private func setupUI(at index:Int, with state:Bool){
        contentView.addSubview(myimageview)
        contentView.addSubview(mylabel)
        contentView.addSubview(mybutton)
        
        myimageview.frame = CGRect(x: 20, y: 10, width: 80, height: 80)
        
        mylabel.frame = CGRect(x: myimageview.right + 20, y: 10, width: 140, height: 80)

        
        mybutton.frame = CGRect(x: contentView.width - 80, y: 10, width: 40, height: 80)
    }*/
}
