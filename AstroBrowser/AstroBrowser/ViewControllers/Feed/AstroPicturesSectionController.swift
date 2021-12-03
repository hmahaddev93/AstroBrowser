//
//  AstroPicturesSectionController.swift
//  AstroBrowser
//
//  Created by Khateeb H. on 12/2/21.
//

import IGListKit
import UIKit

final class AstroPicturesSectionController: ListSectionController {
    private var astro: Astronomy!
    
    override init() {
      super.init()
    }
}

// MARK: - Data Provider
extension AstroPicturesSectionController {
    override func didUpdate(to object: Any) {
        astro = object as? Astronomy
    }

    override func numberOfItems() -> Int {
        return 1
    }

    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let width = context.containerSize.width
        return CGSize(width: width, height: 50)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: AstroCell.self, for: self, at: index)
      
        if let cell = cell as? AstroCell {
            cell.titleLabel.text = astro.title
        }
        return cell
    }

    override func didSelectItem(at index: Int) {
        viewController?.navigationController?.pushViewController(AstroDetailViewController(astro: astro), animated: true)
    }
}

