//
//  FeedViewController.swift
//  AstroBrowser
//
//  Created by Khateeb H. on 12/2/21.
//

import UIKit
import IGListKit

class FeedViewController: UIViewController {
    
    private let viewModel: FeedViewModel! = FeedViewModel()
    
    private let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        viewModel.fetchAllAstroPictures { [unowned self] result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.adapter.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
      
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

// MARK: - ListAdapterDataSource
extension FeedViewController: ListAdapterDataSource {
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
      return self.viewModel.astroPictures
  }
  
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
      return AstroPicturesSectionController()
  }
  
  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}


