//
//  UserSignService.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/11/06.
//

import Foundation
import Alamofire

struct UserLoginService {
    
    //싱글톤 객체를 선언하여, 앱 어디에서든 접근 할 수 있도록 추가
    static let shared = UserLoginService()
    
    //로그인 통신 할 함수 정의
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        //통신할 API주소
        let loginUrl = APIConstants.loginURL
        
        //요청 헤더
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        //요청 바디
        let body: Parameters = [
            "email": email,
            "password": password
        ]
        
        //encoding(통신할 API주소, HTTP Method, 요청 바디, () , 요청 헤더)
        let dataRequest = AF.request(loginUrl,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        //request(요청서)의 dataresponseData를 호출해서 통신 시작
        dataRequest.responseData { dataResponse in //통신의 결과를 dataResponse에 저장
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value) //정제된 networkResult를 받아
                completion(networkResult) //completion에 저장
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    //GET 방식을 위한 코드 추가
    //GET,POST의 차이는 바디의 유무
    func readUserData(userId: Int,
                      completion: @escaping (NetworkResult<Any>) -> (Void)){
        //요청할 url
        let url = APIConstants.readUserURL + "\(userId)"

        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]

        let dataRquest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        dataRquest.responseData {dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }

    }
    
    
    //서버통신 자체는 성공일지라도 응답 실패로 우리가 원하는 데이터를 받지 못한 상태일 때를 분기 처리하기위한 함수
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidLoginData(data: data)
        case 400: return isUsedPathErrData(data: data)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    
    //원하는 데이터를 decoding하기 
    private func isValidLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        // JSON데이터를 LoginResponseData 구조체로 데이터를 변환
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data)
            else {return .pathErr(data)}
        // 그 데이터를 NerworkResult success 파라미터로 전달
        return .success(decodedData)
    }
    
    
    //400 pathErr의 경우 메시지 경우 나눌때 사용
    private func isUsedPathErrData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        // JSON데이터를 LoginResponseData 구조체로 데이터를 변환
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data)
            else {return .pathErr(data)}
        return .pathErr(decodedData)
    }
    
}
