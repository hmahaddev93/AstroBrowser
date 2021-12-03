//
//  AstroService.swift
//  AstroBrowser
//
//  Created by Khateeb H. on 12/3/21.
//

import Foundation
import Alamofire

enum NASAAPI  {
    static let host: String = "api.nasa.gov"
    static let apiKey: String = "gUZ9juThaq6EEYv9eLdQT4LSgQTn24TnXtqaehHQ"
    enum EndPoints {
        static let APOD = "/planetary/apod"
    }
}

protocol NASAService_Protocol {
    func APOD(count: Int, completion: @escaping (Result<[Astronomy], Error>) -> Void)
}

class NASAService: NASAService_Protocol {
    
    private let httpClient: HTTPClient_Protocol
    private let jsonDecoder: JSONDecoder

    init(httpClient: HTTPClient_Protocol = HTTPClient()) {
        self.httpClient = httpClient
        self.jsonDecoder = JSONDecoder()
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func APOD(count: Int = 30, completion: @escaping (Result<[Astronomy], Error>) -> Void) {
       
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = NASAAPI.host
        urlComponents.path = NASAAPI.EndPoints.APOD
        
        let queryItemAPIKey = URLQueryItem(name: "api_key", value: NASAAPI.apiKey)
        let queryItemCount = URLQueryItem(name: "count", value: "\(count)")
        urlComponents.queryItems = [queryItemAPIKey, queryItemCount]
        
        let request = HTTPRequest(url: urlComponents.url!)
        httpClient.send(request: request) { result in
            switch result {
            case let .success(value):
                completion(Result(catching: {
                    try self.jsonDecoder.decode([Astronomy].self, from: value)
                }))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
