//
//  Astronomy.swift
//  AstroBrowser
//
//  Created by Khateeb H. on 12/2/21.
//

import Foundation
import IGListKit

class Astronomy: NSObject, Decodable {
    let title: String
    let explanation: String
    let date: String
    let url: URL
    
    init(title: String, explanation: String, date: String, url: URL) {
        self.title = title
        self.explanation = explanation
        self.date = date
        self.url = url
    }
}
