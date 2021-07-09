//
//  viewweather.swift
//  WeatherApp
//
//  Created by DCS on 09/07/21.
//  Copyright © 2021 HRK. All rights reserved.
//

import UIKit

class viewweather: UIViewController {

    var name = ""
    var img = ""
    private var cityarray = [Citydetail]()
    
    private let searchbar = UISearchBar()
    
    private let status:UILabel = {
        let lab = UILabel()
        lab.text = ""
        //lab.layer.borderWidth = 5
        lab.font = UIFont.boldSystemFont(ofSize: 22)
        lab.textAlignment = .center
        //lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let uv:UILabel = {
        let lab = UILabel()
        lab.text = ""
        //lab.layer.borderWidth = 5
        lab.font = UIFont.boldSystemFont(ofSize: 15)
        lab.textAlignment = .center
        lab.textColor = .white
        //lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let cloud:UILabel = {
        let lab = UILabel()
        lab.text = ""
        //lab.layer.borderWidth = 5
        lab.font = UIFont.boldSystemFont(ofSize: 15)
        lab.textColor = .white
        lab.textAlignment = .center
        //lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let wind:UILabel = {
        let lab = UILabel()
        lab.text = ""
        //lab.layer.borderWidth = 5
        lab.font = UIFont.boldSystemFont(ofSize: 15)
        lab.textColor = .white
        lab.textAlignment = .center
        //lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let citystate:UILabel = {
        let lab = UILabel()
        lab.text = ""
        //lab.layer.borderWidth = 5
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        lab.textAlignment = .center
        //lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let temp:UILabel = {
        let lab = UILabel()
        lab.text = ""
        //lab.layer.borderWidth = 5
        lab.font = UIFont.boldSystemFont(ofSize: 80)
        lab.textAlignment = .center
        //lab.backgroundColor = UIColor.gray
        return lab
    }()

    private let lastupdate:UILabel = {
        let lab = UILabel()
        lab.text = ""
        //lab.layer.borderWidth = 5
        lab.font = UIFont.boldSystemFont(ofSize: 21)
        lab.textAlignment = .center
        //lab.backgroundColor = UIColor.gray
        return lab
    }()
    private let update:UILabel = {
        let lab = UILabel()
        lab.text = "Last Update"
        //lab.layer.borderWidth = 5
        lab.font = UIFont.boldSystemFont(ofSize: 15)
        lab.textAlignment = .center
        //lab.backgroundColor = UIColor.gray
        return lab
    }()
    
    private let icon:UIImageView = {
        let imgv = UIImageView()
        //imgv.image = UIImage(named: "")
        imgv.layer.cornerRadius = 5
        
        imgv.clipsToBounds = true
        return imgv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bckimage = UIImageView(frame: UIScreen.main.bounds)
        bckimage.image = UIImage(named: "back1")
        bckimage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(bckimage, at: 0)
        
        view.addSubview(status)
        view.addSubview(temp)
        view.addSubview(citystate)
        view.addSubview(lastupdate)
        view.addSubview(update)
        view.addSubview(icon)
        view.addSubview(wind)
        view.addSubview(cloud)
        view.addSubview(uv)
        
        name = UserDefaults.standard.value(forKey: "name") as! String
        getdata(name: name)
        
        view.addSubview(searchbar)
        searchbar.delegate =  self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchbar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 50)
        icon.frame = CGRect(x: 20, y: searchbar.bottom + 10, width: 64, height: 64)
        status.frame = CGRect(x: 40, y: searchbar.bottom + 50, width: view.width - 60, height: 50)
        citystate.frame = CGRect(x: 40, y: status.bottom + 5, width: view.width - 60, height: 30)
        temp.frame = CGRect(x: 40, y: citystate.bottom + 30, width: view.width - 80, height: 100)
        
        wind.frame = CGRect(x: 50, y: temp.bottom + 30, width: view.width - 80, height: 20)
        cloud.frame = CGRect(x: 50, y: wind.bottom + 1, width: view.width - 80, height: 20)
        uv.frame = CGRect(x: 50, y: cloud.bottom + 1, width: view.width - 80, height: 20)
        update.frame = CGRect(x: 40, y: view.bottom - 120, width: view.width - 80, height: 100)
        lastupdate.frame = CGRect(x: 40, y: view.bottom - 100, width: view.width - 80, height: 100)
        
    }
    
    func getdata(name:String)
    {
        self.name = name.replacingOccurrences(of: " ", with: "")
        cityarray = Apihandler.shared.searchcity(with: name)
        for i in cityarray{
            print(i.location.country)
            status.text = i.current.condition.text
            citystate.text = i.location.name+","+i.location.country
            temp.text = String(i.current.temp_c)+" C"
            img = i.current.condition.icon
            img = img.replacingOccurrences(of: "//cdn.weatherapi.com/", with: "")
            icon.image = UIImage(named: img)
            lastupdate.text = i.current.last_updated
            wind.text = "Wind_mph :- " + String(i.current.wind_mph)
            uv.text = "UV :- " + String(i.current.uv)
            cloud.text = "Cloud :- " + String(i.current.cloud)
            
        }
    }
}

extension viewweather:UISearchBarDelegate{

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print("searching..")
        view.endEditing(true)
        getdata(name: searchbar.text!)
    }
}

