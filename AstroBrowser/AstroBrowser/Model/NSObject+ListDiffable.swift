//
//  NSObject+ListDiffable.swift
//  AstroBrowser
//
//  Created by Khateeb H. on 12/3/21.
//

import Foundation
import IGListKit

// MARK: - ListDiffable
extension NSObject: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    return self
  }

  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    return isEqual(object)
  }
}
