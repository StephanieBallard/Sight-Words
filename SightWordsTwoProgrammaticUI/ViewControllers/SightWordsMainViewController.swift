//
//  SightWordsMainViewController.swift
//  SightWordsTwoProgrammaticUI
//
//  Created by Stephanie Ballard on 2/8/21.
//

import UIKit

class SightWordsMainViewController: UIViewController {
    
    // MARK: - Enum -
    enum Section {
        case main
    }
    
    // MARK: - Properties -
    let curveView = CurveView()
    var dataSource: UICollectionViewDiffableDataSource<Section, SetOfWords>! = nil
    var collectionView: UICollectionView!
    
    
    // MARK: - Text Labels -
    private let sightWordsTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Sight Words"
        label.textColor = #colorLiteral(red: 0.5843137255, green: 0.2784313725, blue: 0.9254901961, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.init(name: "Futura", size: 50)
        return label
    }()
    
    private let directionsTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap a set of words to start practicing."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.init(name: "Futura", size: 19)
        return label
    }()
    
    private let comeBackTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Come back each day to stay sharp!"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.init(name: "Futura", size: 19)
        return label
    }()
    
    private let underLineUIView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .white
        return uiView
    }()
    
    private let collectionViewContainer: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .clear
        return uiView
    }()
    
    // MARK: - LifeCycle Functions -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureUI()
        configureDataSource()
        collectionView.delegate = self
    }

    // MARK: - Helper Functions -
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        
        view.addSubviews(subviews: curveView, sightWordsTextLabel, directionsTextLabel, comeBackTextLabel, underLineUIView, collectionViewContainer)

        view.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.8196078431, blue: 1, alpha: 1)
        
//        view.traitCollection.
        
        curveView.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.8196078431, blue: 1, alpha: 1)
        curveView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, height: UIScreen.main.bounds.height * 0.8)
        
        sightWordsTextLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 40, paddingRight: 40, height: 80)
        
        directionsTextLabel.anchor(top: sightWordsTextLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 130, paddingLeft: 20, paddingRight: 20, height: 25)
        
        comeBackTextLabel.anchor(top: directionsTextLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingRight: 20, height: 25)
        
        underLineUIView.anchor(top: comeBackTextLabel.bottomAnchor, left: comeBackTextLabel.safeAreaLayoutGuide.leftAnchor, right: comeBackTextLabel.safeAreaLayoutGuide.rightAnchor, paddingTop: 6, paddingLeft: 20, paddingRight: 20, height: 2)
        
        collectionViewContainer.anchor(top: underLineUIView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20, width: 300, height: 150)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: collectionViewContainer.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: collectionViewContainer.centerYAnchor).isActive = true
        collectionView.setDimensions(height: 150, width: 300)
        
        UIHelper.configureShadow(view: sightWordsTextLabel, color: UIColor.white.cgColor)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.50), heightDimension: .absolute(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 5, bottom: 4, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(300), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
//    private override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        <#code#>
//    }
}

extension SightWordsMainViewController {
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionViewContainer.addSubview(collectionView)
        collectionView.backgroundColor = #colorLiteral(red: 0.5843137255, green: 0.2784313725, blue: 0.9254901961, alpha: 1)
        collectionView.isScrollEnabled = false
        collectionView.layer.borderColor = #colorLiteral(red: 0.5836093415, green: 0.279776614, blue: 0.9270977454, alpha: 1).cgColor
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SetOfWords> { (cell: UICollectionViewListCell, indexPath: IndexPath, identifier: SetOfWords) in
            var content = cell.defaultContentConfiguration()
            content.text = identifier.name
            content.textProperties.font = UIFont.boldSystemFont(ofSize: 24)
            content.textProperties.alignment = .center
            content.textProperties.color = #colorLiteral(red: 0.5843137255, green: 0.2784313725, blue: 0.9254901961, alpha: 1)
            var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfiguration.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.8196078431, blue: 1, alpha: 1)
            backgroundConfiguration.cornerRadius = 12
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.cornerRadius = 12
            cell.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.8196078431, blue: 1, alpha: 1)
            cell.contentView.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.8196078431, blue: 1, alpha: 1)
            cell.contentView.layer.borderWidth = 2
            cell.backgroundConfiguration = backgroundConfiguration
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, SetOfWords>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: SetOfWords) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, SetOfWords>()
        snapshot.appendSections([.main])
        snapshot.appendItems(wordSets, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension SightWordsMainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let setOfWords = dataSource.itemIdentifier(for: indexPath)
        let wordsDetailViewController = WordsDetailViewController()
        wordsDetailViewController.setOfWords = setOfWords
        present(wordsDetailViewController, animated: true, completion: nil)
        
    }
}
