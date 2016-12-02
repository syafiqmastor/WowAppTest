//
//  WebService.swift
//  WowAppTest
//
//  Created by Syafiq on 11/24/16.
//  Copyright © 2016 Syafiq. All rights reserved.
//

import UIKit
import SwiftyJSON

typealias ServiceResponse = (JSON,NSError?) -> Void

class WebService: NSObject {
    static let sharedInstance = WebService()
    
    
    // MARK: Perform a GET Request
    private func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse) {
        let request = NSMutableURLRequest(url: NSURL(string: path)! as URL)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if let jsonData = data {
                let json:JSON = JSON(data: jsonData)
                onCompletion(json, error as NSError?)
            } else {
                onCompletion(JSON.null, error as NSError?)
            }
        })
        task.resume()
    }
}
