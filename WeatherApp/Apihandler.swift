//
//  Apihandler.swift
//  WeatherApp
//
//  Created by DCS on 07/07/21.
//  Copyright © 2021 HRK. All rights reserved.
//

import Foundation

class Apihandler{
    
    static let shared = Apihandler()

    func searchcity(with name:String) -> [Citydetail]{
        
        if let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=9ed7cfcb9dac424e92913451121070&q=\(name)")
        {
            
            if let data = try? Data(contentsOf: url)
            {
                
                let decoder = JSONDecoder()
                    
                if let jdata = try? decoder.decode(Citydetail.self,from: data)
                {
                    print(jdata.current.condition)
                    return [jdata]
                }
            }
        }
        return [Citydetail]()
    }
}
