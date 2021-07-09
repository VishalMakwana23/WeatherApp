//
//  city.swift
//  WeatherApp
//
//  Created by DCS on 07/07/21.
//  Copyright © 2021 HRK. All rights reserved.
//

import Foundation

class Citydetail:Decodable{
    var location: Cityweather
    var current: currentdetail
}

class Cityweather:Decodable{
    var name = ""
    var region = ""
    var country = ""
    var localtime = ""
}

class currentdetail:Decodable{
    var last_updated = ""
    var is_day:Int
    var temp_c:Float
    var temp_f :Float
    var condition: conditiondetail
    var wind_mph:Float
    var cloud:Int
    var uv:Float
}
class conditiondetail:Decodable{
    var text = ""
    var icon = ""
    var code:Int
}


/*{
 "location":{
 "name":"London",
 "region":"City of London, Greater London",
 "country":"United Kingdom",
 "lat":51.52,
 "lon":-0.11,
 "tz_id":"Europe/London",
 "localtime_epoch":1625666176,
 "localtime":"2021-07-07 14:56"
 },
 "current":{
 "last_updated_epoch":1625665500,
 "last_updated":"2021-07-07 14:45",
 "temp_c":20.0,
 "temp_f":68.0,
 "is_day":1,
 "wind_mph":12.5,
 "wind_kph":20.2,
 "wind_degree":200,
 "wind_dir":"SSW",
 "pressure_mb":1013.0,
 "pressure_in":30.4,
 "precip_mm":0.8,
 "precip_in":0.03,
 "humidity":64,
 "cloud":75,
 "feelslike_c":20.0,
 "feelslike_f":68.0,
 "vis_km":10.0,
 "vis_miles":6.0,
 "uv":4.0,
 "gust_mph":15.2,
 "gust_kph":24.5
 }
 }*/
