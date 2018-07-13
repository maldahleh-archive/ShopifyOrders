//
//  APIClient.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-13.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

protocol APIClient: class {
    static var apiKey: String { get }
    
    var session: URLSession { get }
    var jsonDecoder: JSONDecoder { get }
    
    func fetchWith<T: Decodable>(_ request: URLRequest, decode: T.Type, completion: @escaping (Result<T, APIError>) -> Void)
}

extension APIClient {
    typealias JSON = [String: AnyObject]
    typealias JSONTaskCompletionHandler = (Data?, APIError?) -> Void
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode != 200 {
                completion(nil, .responseUnsuccessful)
                return
            }
            
            guard let data = data else {
                completion(nil, .invalidData)
                return
            }
            
            completion(data, nil)
        }
        
        return task
    }
    
    func fetchWith<T: Decodable>(_ request: URLRequest, decode: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        jsonTask(with: request) { [weak self] json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.failure(.invalidData))
                    }
                    
                    return
                }
                
                do {
                    guard let selfRef = self else {
                        completion(.failure(.jsonConversionFailure))
                        return
                    }
                    
                    let parsed = try selfRef.jsonDecoder.decode(decode, from: json)
                    completion(.success(parsed))
                } catch {
                    completion(.failure(.jsonConversionFailure))
                }
            }
        }.resume()
    }
}
