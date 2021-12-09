//
//  BaseAPI.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/12/09.
//

import Moya
import Alamofire


enum BaseAPI{
  case sampleAPI(sample : String)
  // 계정관련
    case postLogin(param: LoginRequest)
    case postSignUp(param: SignUpRequest)
}


extension BaseAPI: TargetType {

  // MARK: - Base URL
  public var baseURL: URL {
    var base = Config.Network.baseURL
    switch self{
      case .sampleAPI:
        base += ""
      case .postLogin,
            .postSignUp:
        base += "/user"
    }
    guard let url = URL(string: base) else {
      fatalError("baseURL could not be configured")
    }
    print("URL",url)
    return url
  }
  
  // MARK: - Path
  var path: String {
    switch self{
      case .sampleAPI:
        return "뒤에붙는 주소"
      case .postLogin:
        return "/login"
      case .postSignUp:
        return "/signup"
      default :
        return ""
    }
  }
  
  
  // MARK: - Method
  var method: Moya.Method {
    switch self{
      case .postLogin,
           .postSignUp:
        return .post
      default :
        return .get

    }
  }
  
  // MARK: - Data
  var sampleData: Data {
    return Data()
  }
  
  // MARK: - Parameters
  private var bodyParameters: Parameters? {
    var params: Parameters = [:]
    switch self {
      case .sampleAPI:
        params[""] = ""
      case .postLogin(let param) :
        params["email"] = param.email
        params["password"] = param.password
      case .postSignUp(let param):
        params["email"] = param.email
        params["name"] = param.name
        params["password"] = param.password
      default :
        break
    }
    return params
  }
  
  
  // MARK: - MultiParts
  
  private var multiparts: [Moya.MultipartFormData] {
    switch self{
      case .sampleAPI(_):
        var multiparts : [Moya.MultipartFormData] = []
        multiparts.append(.init(provider: .data("".data(using: .utf8) ?? Data()), name: ""))
        return multiparts
      default : return []
//        images.forEach {
//          multiparts.append(.init(provider: .data($0), name: "images", fileName: "image.jpeg", mimeType: "image/jpeg"))
//        }
    }
  }
  
  
  private var parameterEncoding : ParameterEncoding{
    switch self {
      case .sampleAPI:
        return URLEncoding.init(destination: .queryString, arrayEncoding: .noBrackets, boolEncoding: .literal)
      default :
        return JSONEncoding.default
    }
  }
  
  
  
  var task: Task {
    switch self{
      case .sampleAPI:
        return .uploadMultipart(multiparts)
        
      case .postLogin :
        return .requestParameters(parameters: bodyParameters ?? [:], encoding: parameterEncoding)
      case .postSignUp:
        return .requestParameters(parameters: bodyParameters ?? [:], encoding: parameterEncoding)
        
      default :
        return .requestPlain
      
    }
  }
  
  public var headers: [String: String]? {
      return ["Content-Type": "application/json"]
  }
  
  public var validationType: ValidationType {
    return .successCodes
  }
}
