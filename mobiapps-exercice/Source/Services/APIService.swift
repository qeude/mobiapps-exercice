
//
//  APIService.swift
//  mobiapps-exercice
//
//  Created by Quentin Eude on 14/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    static func getAllGroupsIds(completion: @escaping (Result<[String], NetworkError>) -> Void){
        AF.request("https://api.guildwars2.com/v2/achievements/groups")
            .responseJSON { response in
                guard let data = response.value as? [String]
                    else{
                        completion(.failure(.emptyResult))
                        return
                }
                completion(.success(data))
        }
    }
    
    
    static func getAllGroups(completion: @escaping (Result<[Group], Error>) -> Void){
        getAllGroupsIds{ result in
            switch result{
            case .success(let ids):
                let parameters : Parameters = [
                    "ids" : ids.joined(separator: ",")
                ]
                AF.request("https://api.guildwars2.com/v2/achievements/groups", parameters:parameters)
                    .responseDecodable{(response: DataResponse<[Group]>) in
                        completion(response.result)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func getCategoriesByGroup(group : Group, completion:@escaping (Result<[Category], Error>) -> Void) {
        let ids: [String] = group.categories.map{String($0)}
        let param : Parameters = [
            "ids": ids.joined(separator: ",")
        ]
        AF.request("https://api.guildwars2.com/v2/achievements/categories", parameters: param)
            .responseDecodable{ (response: DataResponse<[Category]>) in
                completion(response.result)
                
        }
    }
}
