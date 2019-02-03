//
//  SearchAPIClient.swift
//  Quizzes
//
//  Created by Stephanie Ramirez on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class SearchAPIClient {
    
    private init() {}
    static func getSearchQuizzes(completionHandler: @escaping (AppError?, [SearchModel]?) -> Void) {
        
        let endpointURLString = "https://quizzes-9ff59.firebaseio.com/.json"
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let searchInfo = try JSONDecoder().decode([SearchModel].self, from: data)
                    completionHandler(nil, searchInfo)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
