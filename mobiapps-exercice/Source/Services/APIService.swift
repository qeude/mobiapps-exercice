
//
//  APIService.swift
//  mobiapps-exercice
//
//  Created by Quentin Eude on 14/05/2019.
//  Copyright © 2019 Quentin Eude. All rights reserved.
//

import Foundation
import Alamofire

/// Service class that provide a network abstraction to communicate with the guild wars 2 API.
class APIService {
    
    
    /// HTTP request that get all groups Ids from the guild wars 2 API
    ///
    /// - Parameter completion: Function that is exectued after getting a result
    static func getAllGroupsIds(completion: @escaping (Result<[String], NetworkError>) -> Void){
        AF.request("https://api.guildwars2.com/v2/achievements/groups")
            .responseJSON { response in
                guard let data = response.value as? [String]
                    else{
                        // Case the response value is empty, an error is thrown
                        completion(.failure(.emptyResult))
                        return
                }
                // Case the response value contains data.
                completion(.success(data))
        }
    }
    
    
    /// HTTP request that get all groups from the guild wars 2 API, it use the getAllGroupsIds method to get query parameters "ids"
    ///
    /// - Parameter completion: Function that is exectued after getting a result
    static func getAllGroups(completion: @escaping (Result<[Group], Error>) -> Void){
        // Getting groups IDs to get the "ids" query parameter
        getAllGroupsIds{ result in
            switch result{
            // Case the "getAllGroupsIds" request respond
            case .success(let ids):
                let parameters : Parameters = [
                    "ids" : ids.joined(separator: ",")
                ]
                // HTTP request to get groups list with details
                AF.request("https://api.guildwars2.com/v2/achievements/groups", parameters:parameters)
                    .responseDecodable{(response: DataResponse<[Group]>) in
                        completion(response.result)
                }
            // Case the "getAllGroupsIds" request fails
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /// HTTP request that get all categories for a specific group from the guild wars 2 API.
    ///
    /// - Parameters:
    ///   - group: concerned group from which we fetch categories
    ///   - completion: Function that is exectued after getting a result
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
    
    
    /// HTTP request that get all achievements for a given category from the guild wars 2 API.
    ///
    /// - Parameters:
    ///   - category: concerned category from which we fetch achievements
    ///   - completion: Function that is exectued after getting a result
    static func getAchievementsByCategory(category : Category, completion:@escaping (Result<[Achievement], Error>) -> Void){
        let ids: [String] = category.achievements.map{String($0)}
        let param: Parameters = [
            "ids": ids.joined(separator: ",")
        ]
        AF.request("https://api.guildwars2.com/v2/achievements", parameters: param)
            .responseDecodable{ (response: DataResponse<[Achievement]>) in
                completion(response.result)
        }
    }
}
