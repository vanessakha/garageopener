//
//  GarageOpenerButton.swift
//  GarageOpener
//
//  Created by Vanessa on 10/15/17.
//  Copyright © 2017 Vanessa. All rights reserved.
//

import Foundation

class Webiopi {
    //    let webiopiServerAddress: String = "" // address
    //    let webiopiServerPort: Int = 8000
    let webiopiServerAddress: String = "cef71d2a.ngrok.io"
    let webiopiServerPort: Int = 80
    
    func constructURLRequest(url: String) -> URLRequest {
        var request = URLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        
        // Set the login user/password as the HTTP Authorization header
        // Authorization: Basic <base64-encoded-user-colon-password>
        // where <base64-encoded-user-colon-password> = Base64-Encode of (user ":" password)
        let username = "webiopi"
        let password = "raspberry"
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    //    func prepareHttpRequestToSetGpioPin(gpioNumber: Int, on: Bool) throws -> URLRequest {
    //        let gpioValue: Int = on ? 1 : 0
    //        let url = String(format: "http://%@:%d/GPIO/%d/value/%d",
    //                         webiopiServerAddress, webiopiServerPort, gpioNumber, gpioValue)
    //        return constructURLRequest(url: url)
    //    }
    //
    func prepareHttpRequestToSendPulse(gpio gpioNumber: Int) throws -> URLRequest {
        let url = String(format: "http://%@:%d/GPIO/%d/sequence/1000,10",
                         webiopiServerAddress, webiopiServerPort, gpioNumber)
        return constructURLRequest(url: url)
    }
    
    func sendPulse(gpioNumber: Int) throws {
        // Perform the request to send a sequence to the gpio pin gpioNumber to simulate a long pulse
        let requestOn = try prepareHttpRequestToSendPulse(gpio: gpioNumber)
        let response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
        let data = try NSURLConnection.sendSynchronousRequest(requestOn, returning: response)
        print(data)
    }
    
}




