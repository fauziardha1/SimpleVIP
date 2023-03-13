//
//  BaseNetworkRequest.swift
//  SimpleVIP
//
//  Created by FauziArda on 22/02/23.
//

import Foundation

class BaseNetworkRequest: NSObject{
    static func GET(url: String, header: [String: String], completionHandler: @escaping (Any?) -> Void) {
            //init request
            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
            //configure request method dan set header
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = header

            //init session
            let session = URLSession.shared

            //init datatask dengan
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error as Any)
                    completionHandler(nil)
                } else {
                    if let dataFromAPI = data {
                        completionHandler(dataFromAPI)
                    }
                }
            })

            dataTask.resume()
        }
}
