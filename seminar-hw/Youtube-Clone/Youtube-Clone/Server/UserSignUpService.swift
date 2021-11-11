//
//  UserSignService.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/11/06.
//

import Foundation
import Alamofire

struct UserSignUpService {
    
    //싱글톤 객체를 선언하여, 앱 어디에서든 접근 할 수 있도록 추가
    static let shared = UserSignUpService()
    
    //회원가입때 통신 할 함수 정의
    func signUp(email: String,
                name: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        //통신할 API주소
        let signUpUrl = APIConstants.signupURL
        
        //요청 헤더
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        //요청 바디
        let body: Parameters = [
            "email": email,
            "name" : name,
            "password": password
        ]
        
        //encoding(통신할 API주소, HTTP Method, 요청 바디, () , 요청 헤더)
        let dataRequest = AF.request(signUpUrl,
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
                let networkResult = self.judgeSignUpStatus(by: statusCode, value) //정제된 networkResult를 받아
                completion(networkResult) //completion에 저장
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
        
    }
    
    //서버통신 자체는 성공일지라도 응답 실패로 우리가 원하는 데이터를 받지 못한 상태일 때를 분기 처리하기위한 함수
    private func judgeSignUpStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
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
        // JSON데이터를 SignUpResponseData 구조체로 데이터를 변환
        guard let decodedData = try? decoder.decode(SignUpResponseData.self, from: data)
            else {return .pathErr(data)}
        // 그 데이터를 NerworkResult success 파라미터로 전달
        return .success(decodedData)
    }
    
    
    //400 pathErr의 경우 메시지 경우 나눌때 사용
    private func isUsedPathErrData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        //SignUpResponseData 형식에 맞춰 디코딩되지 않을 경우에 else문으로 빠져 pathErr를 리턴, 즉 서버로부터 SignUpResponseData 형식의 데이터가 오지 않은 것이고, 경로가 잘못된것이라고 분기처리 할 수 있다. 다른 경로를 설정해도, 아예 없는 경로를 설정해도 서버에서 맞는 형식의 데이터가 오지 않기 때문에 pathErr 로!
        guard let decodedData = try? decoder.decode(SignUpResponseData.self, from: data)
            else {return .pathErr(data)}
        // 디코딩은 성공했지만 상태코드가 400번인 경우는 클라 측의 오류이다. 요청이 잘못된 경우, 따라서 여기는 .pathErr대신 .requestErr가 적절하다.
        return .requestErr(decodedData)
    }
    
}
