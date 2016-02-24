//
//  API.swift
//  FSCalendar
//
//  Created by Paul Andrew Gutib on 30/01/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Locksmith

enum Router: URLRequestConvertible{
    static let baseURL = "https://fsv2test.rschooltoday.com"
    static let clientId = "fsiosapp"
    static let clientSecret = "fsiosapp"
    
    case usercredential(username: String, password: String)
    case RefreshToken
    case getfsclients(st_abbv: String)
    case forgotpassword(email: String)
    case getlocationtypes
    case getbuildingtypes
    case getbuildings(viewtype: String)
    case getlocations(viewtype: String, building_id: String, locationtypes_id: String)
    case getcalendarevents(viewtype: String, location_id: String, building_id: String, month_year: String, showTitleLocation: String, showTitleActivity: String, showTitleEndTime: String, showExpectedAttendance: String, showSetupTeardownTime: String, showCancelledPermit: String, sortby: String, fromtime: String, totime: String)
    case getuserinformation
    case getannouncements(viewtype: String)
    case changepassword(userid: String, currentpassword: String, newpassword: String, retypedpassword: String)
    
    var method: Alamofire.Method {
        switch self {
        case .usercredential:
            return .POST
        case .RefreshToken:
            return .POST
        case .getfsclients:
            return .GET
        case .forgotpassword:
            return .GET
        case .getlocationtypes:
            return .GET
        case .getbuildingtypes:
            return .GET
        case .getbuildings:
            return .GET
        case .getlocations:
            return .GET
        case .getcalendarevents:
            return .GET
        case .getuserinformation:
            return .GET
        case .getannouncements:
            return .GET
        case .changepassword:
            return .POST
        }
    }
    
    var path: String {
        switch self {
        case .usercredential:
            return "/oauth2/usercredential"
        case .RefreshToken:
            return "/oauth2/usercredential"
        case .getfsclients:
            return "/mobile/getfsclients"
        case .forgotpassword:
            return "/mobile/forgotpassword"
        case .getlocationtypes:
            return "/mobile/getlocationtypes"
        case .getbuildingtypes:
            return "/mobile/getbuildingtypes"
        case .getbuildings:
            return "/mobile/getbuildings"
        case .getlocations:
            return "/mobile/getlocations"
        case .getcalendarevents:
            return "/mobile/getcalendarevents"
        case .getuserinformation:
            return "/mobile/getuserinformation"
        case .getannouncements:
            return "/mobile/getannouncements"
        case .changepassword:
            return "/mobile/changepassword"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: Router.baseURL)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        mutableURLRequest.HTTPMethod = method.rawValue
        
        debugPrint(mutableURLRequest.URLString)
        
        switch self{
        case .usercredential:
            break
        case .RefreshToken:
            break
        default:
            let dictionary = Locksmith.loadDataForUserAccount("fsiosapp")
            if dictionary != nil {
                let token = dictionary!["access_token"] as! String
                debugPrint(token)
                mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
            break
        }
        
        switch self {
        case .usercredential(let username, let password):
            let parameters = [
                "grant_type":"password"
                ,   "username": username
                ,   "password": password
                ,   "client_id": Router.clientId
                ,   "client_secret": Router.clientSecret
            ]
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        case .RefreshToken:
            let dictionary = Locksmith.loadDataForUserAccount("fsiosapp")
            if dictionary != nil {
                let token = dictionary!["refresh_token"] as! String
                debugPrint(token)
                let parameters = [
                    "grant_type":"refresh_token"
                    ,   "refresh_token": token
                    ,   "client_id": Router.clientId
                    ,   "client_secret": Router.clientSecret
                ]
                return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
            }
            return mutableURLRequest
        case .getfsclients(let st_abbv):
            let parameters = ["st_abbv": st_abbv]
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        case .getbuildings(let viewtype):
            let parameters = ["viewtype": viewtype]
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        case .getlocations(let viewtype, let building_id, let locationtypes_id):
            let parameters = [
                "viewtype": viewtype,
                "building_id": building_id,
                "locationtypes_id": locationtypes_id
            ]
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        case .getcalendarevents(let viewtype, let location_id, let building_id, let month_year, let showTitleLocation, let showTitleActivity, let showTitleEndTime, let showExpectedAttendance, let showSetupTeardownTime, let showCancelledPermit, let sortby, let fromtime, let totime):
            let parameters = [
                "viewtype": viewtype,
                "location_id": location_id,
                "building_id": building_id,
                "month_year": month_year,
                "showTitleLocation": showTitleLocation,
                "showTitleActivity": showTitleActivity,
                "showTitleEndTime": showTitleEndTime,
                "showExpectedAttendance": showExpectedAttendance,
                "showSetupTeardownTime": showSetupTeardownTime,
                "showCancelledPermit": showCancelledPermit,
                "sortby": sortby,
                "fromtime": fromtime,
                "totime": totime
            ]
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        case .getannouncements(let viewtype):
            let parameters = ["viewtype": viewtype]
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        case .changepassword(let userid, let currentpassword, let newpassword, let retypedpassword):
            let parameters = [
                "userid": userid,
                "currentpassword": currentpassword,
                "newpassword": newpassword,
                "retypedpassword": retypedpassword
            ]
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        case .forgotpassword(let email):
            let parameters = [
                "email": email
            ]
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
}

public protocol OAuth2Delegate {
    func noTokenFound()
    func refreshTokenFail()
}

public class API {
    static let instance = API()
    public var authDelegate:OAuth2Delegate?
    
    //TODO: support multiple request queue
    //private var cachedRequests = Array<URLRequestConvertible>()
    
    private var request:URLRequestConvertible?
    private var handler:((Response<AnyObject, NSError>) -> Void)?
    private var refreshingAttempts:Int = 0
    
    public func request(URLRequest: URLRequestConvertible, withDelegate:OAuth2Delegate) -> API {
        authDelegate = withDelegate
        return request(URLRequest)
    }
    
    public func request(URLRequest: URLRequestConvertible) -> API {
        request = URLRequest
        return self
    }
    
    public func responseJSON(completionHandler: Response<AnyObject, NSError> -> Void)
    {
        handler = completionHandler
        assert(request != nil, "No request passed")
        
        if tokenExpired() {
            self.refreshToken()
            return
        }
        
        Manager.sharedInstance.request(request!.URLRequest).responseJSON{ operation in
            switch operation.result {
            case .Success:
                self.request = nil
                self.handler!(operation)
            case .Failure:
                //check the failure type
                if let httpResponse = operation.response {
                    if httpResponse.statusCode == 401 && self.refreshingAttempts == 0{
                        //self.cachedRequests.append(self.request!)
                        //refresh the token
                        self.refreshToken()
                    }else{
                        self.request = nil
                        self.handler!(operation)
                    }
                }
            }
        }
    }
    
    private func tokenExpired() -> Bool {
        if request?.URLRequest.valueForHTTPHeaderField("Authorization") == nil {
            //doesn't need token
            return false
        }
        
        let dictionary = Locksmith.loadDataForUserAccount("fsiosapp")
        if dictionary == nil {
            if let delegate = self.authDelegate {
                delegate.noTokenFound()
            }
            return true
        }
        if dictionary!.keys.contains("access_expired"){
            let expireDate = dictionary!["access_expired"] as! Double
            let now = (NSDate()).timeIntervalSince1970
            if now > expireDate {
                //token expired
                return true
            }
        }
        return false
    }
    
    public func refreshToken() {
        refreshingAttempts += 1
        Alamofire.request(Router.RefreshToken).responseJSON{
            operation in
            switch operation.result{
            case .Success:
                //reload tokens
                let json = JSON(operation.result.value!)
                debugPrint(json)
                let accessToken = json["access_token"].stringValue
                let refreshToken = json["refresh_token"].stringValue
                let expiresIn = json["expires_in"].doubleValue
                let now = NSDate()
                let expireDate = now.dateByAddingTimeInterval(expiresIn).timeIntervalSince1970
                
                if json != nil && !accessToken.isEmpty {
                    //store tokens
                    do{
                        try Locksmith.updateData(["access_token": accessToken,
                            "refresh_token":refreshToken,
                            "access_expired":expireDate], forUserAccount: "fsiosapp")
                        
                        self.refreshingAttempts = 0
                        if self.request != nil {
                            self.responseJSON(self.handler!)
                        }
                        return
                    }catch {
                        debugPrint(error)
                    }
                }else{
                    if let delegate = self.authDelegate{
                        delegate.refreshTokenFail()
                    }
                }
            case .Failure:
                if let delegate = self.authDelegate{
                    delegate.refreshTokenFail()
                }
            }
        }
    }
}