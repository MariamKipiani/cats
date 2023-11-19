//
//  APIService.swift
//  cats
//
//  Created by user on 11/20/23.
//

import UIKit
import Networking

struct Fact: Decodable {
    let text: String
}

struct FactResponse: Decodable {
    let data: [Fact]
}

final class APIService {
    static let shared = APIService()
    private let baseURL = "https://catfact.ninja"
    private let networkService = NetworkService()
    
    private init() {}
    
    
    func fetchFacts(completion: @escaping (Result<[Fact], APIServiceError>) -> Void) {
        let urlStr = "\(baseURL)/facts?max_length=50&limit=15"
        networkService.fetchData(urlString: urlStr) { (result: Result<FactResponse, Error>) in
            switch result {
            case .success(let factResponse):
                completion(.success(factResponse.data))
            case .failure(let error):
                let apiError = APIServiceError.networkError(description: error.localizedDescription)
                completion(.failure(apiError))
            }
        }
    }
}

enum APIServiceError: Error {
    case networkError(description: String)
}
