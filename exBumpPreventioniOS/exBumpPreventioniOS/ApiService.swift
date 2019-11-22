//
//  ApiServuce.swift
//  exBumpPreventioniOS
//
//  Created by 조예진 on 2019/11/20.
//  Copyright © 2019 조예진. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ApiService {
  static var baseHostName = "http://127.0.0.1:3000"
  enum Router: URLRequestConvertible {
    
    case host(myUUID:String)
    case invite(myUUID:String, randomCode:String)
    case updateGPS(myUUID:String, latitude:Float, longitude:Float)
    
    // MARK:- URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
      let result: (path: String, parameters: Parameters, method: HTTPMethod) = {
        switch self {
        case let .host(myUUID):
          return ("/user/host", ["myUUID": myUUID], .post)
        case let .invite(myUUID, randomCode):
          return ("/user/invite", ["myUUID": myUUID, "randomCode": randomCode], .post)
        case let .updateGPS(myUUID, latitude, longitude):
          return ("/user/updateGPS", ["myUUID": myUUID, "latitude": latitude, "longitude": longitude], .post)
        }
      }()
      let url = try (baseHostName + "/api").asURL()
      let urlRequest = try URLRequest(url: url.appendingPathComponent(result.path), method: result.method)
      print("my url is...")
      print(url)
      return try JSONEncoding.default.encode(urlRequest, with: result.parameters)
    }
  }
  
  static func host(myUUID: String, callback: ((String)->())?) {
    Alamofire.request(Router.host(myUUID: myUUID)).responseJSON { (response) in
      
      guard let jsonData = response.result.value, response.result.isSuccess else {
        callback?("error host")
        return
      }
      let json = JSON(jsonData)
      callback?(json["randomCode"].stringValue)
    }
  }
  
  static func invite(myUUID:String, randomCode:String) {
    Alamofire.request(Router.invite(myUUID: myUUID, randomCode: randomCode)).responseJSON { (response) in
      
      guard let jsonData = response.result.value, response.result.isSuccess else {
        return
      }
      let json = JSON(jsonData)
      print(json)
    }
  }
  
  static func updateGPS(myUUID: String, latitude: Float, longitude: Float){
    Alamofire.request(Router.updateGPS(myUUID: myUUID, latitude: latitude, longitude: longitude)).responseJSON { (response) in
         
         guard let jsonData = response.result.value, response.result.isSuccess else {
           return
         }
         let json = JSON(jsonData)
         print(json)
       }
  }
  
}
