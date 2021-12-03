//
//  FeedViewModel.swift
//  AstroBrowser
//
//  Created by Khateeb H. on 12/3/21.
//

import Foundation
final class FeedViewModel {
    private let nasaService = NASAService()
    var astroPictures = [Astronomy]()
    
    func fetchAllAstroPictures(completion: @escaping (Result<[Astronomy], Error>) -> Void) {
        nasaService.APOD { [unowned self] result in
          switch result {
            case .success(let apods):
              self.astroPictures = apods
              completion(.success(apods))
            case .failure(let error):
              completion(.failure(error))
          }
        }
    }
}
