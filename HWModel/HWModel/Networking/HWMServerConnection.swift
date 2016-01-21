//
//  HWMServerConnection.swift
//  HWModel
//
//  Created by Kamil Wasag on 20/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

import Foundation

@objc public class HWMServerConnection : NSObject {
    public static let sharedInstance = HWMServerConnection()
    private let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    public func getPropertiesForDefaultCityWithCompletionHandler(cHnadler:(Array<HWMPropertyBasic>?, NSError?)->Void) {
        self.getPropertiesForCityWithCityNumber(kHWMNetwork.kHWMDefaultCity) { properties,error in
            cHnadler(properties,error)
        }
    }
    
    public func getPropertyForPropertyNumber(propertyNumber:Int, withCompletionHandler cHandler:(HWMProperty?, NSError?)->Void){
        let request = self.buildRequestWithBaseURL(kHWMNetwork.kHWMBaseURL, withParameters: [kHWMNetwork.kHWMEndpointProperties:String(propertyNumber)])
        self.downloadDataWitchRequest(request) { data, response, error in
            do {
                let jsonResult = try HWMProperty(data: data)
                cHandler(jsonResult,error)
            }catch let parsingError as NSError{
                NSLog("\(parsingError)")
            }
        }
    }
    
    private func getPropertiesForCityWithCityNumber(cityNumber:Int, withCompletionHandler cHandler:(Array<HWMPropertyBasic>?, NSError?)->Void) {
        let request = self.buildRequestWithBaseURL(kHWMNetwork.kHWMBaseURL, withParameters: [kHWMNetwork.kHWMEndpointCities:String(cityNumber),kHWMNetwork.kHWMEndpointProperties:nil])
        self.downloadDataWitchRequest(request) {
            data,response,error in
            do {
                let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                let prop = try HWMPropertyBasic.arrayOfModelsFromDictionaries(jsonResult[kHWMNetwork.kHWMEndpointProperties] as! [AnyObject], error: ()).copy() as! Array<HWMPropertyBasic>
                cHandler(prop,error)
            }catch let error as NSError{
                NSLog("\(error)");
            }
        }
    }
    
    private func buildRequestWithBaseURL(baseURL:String,withParameters parameters:[String:String?]) -> NSURLRequest
    {
        var url = NSURL(string: baseURL)!
        for (endpoint, parameter) in parameters {
            url = url.URLByAppendingPathComponent(endpoint, isDirectory: true)
            if let param = parameter {
                url = url.URLByAppendingPathComponent(param)
            }
        }
        return NSURLRequest(URL: url)
    }
    
    
    public func downloadDataWitchRequest(request:NSURLRequest,witchCompletionHandler cHandler:(NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask{
        let downloadTask = self.session.dataTaskWithRequest(request, completionHandler: {
            data, response, error in
            cHandler(data,response,error);
        })
        downloadTask.resume()
        return downloadTask
    }
}