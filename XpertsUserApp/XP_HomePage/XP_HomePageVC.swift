//
//  ViewController.swift
//  TempXpertsApp
//
//  Created by Sriram S on 26/02/22.
//

import UIKit
import Combine
import CoreLocation


class XP_HomePageVC: XP_BaseVC {
    
    static let textHeaderId = "textHeaderId"
    static let textHeaderElementKindId = "textHeaderElementKindId"
    
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: XP_HomePageVC.createLayoutDiffSection()
    )
    
    var section0Data : [Int] = []
    var section1Data : [Int] = []
    var section2Data : [Int] = []
    var section3Data : [Int] = []
    var locationService : Locator

    
    
    
    
    
    
    enum XPHomeSectionType : String {
        case HeroCarousel
        case Hotkeys
        case Carousel
        case Packages
        case ReBook
        
    }
    var currentSections : [XPHomeSectionType] = [.HeroCarousel, .Hotkeys, .Carousel, .Packages, .Carousel, .ReBook, .Carousel]
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    init?(coder : NSCoder, locationService : LocationService) {
        self.locationService = locationService
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        //   super.init(coder: coder)
        fatalError("Needs Location")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.view.addSubview(collectionView)
        registerCells()
        collectionView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 400)
        collectionView.backgroundColor  = .red
        //     view.backgroundColor  = .orange
        //        collectionView.backgroundColor = .red
        collectionView.register(XP_HomePageHotKeyCell.self, forCellWithReuseIdentifier: XP_HomePageHotKeyCell.identifier)
        collectionView.frame = view.bounds
        print("------------- 1")

        collectionView.delegate = self
        print("------------- 1.5")

        collectionView.dataSource = self
        
        print("------------- 2")

        
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.section0Data = Array(repeating: 1, count: 10)
            self?.section1Data = Array(repeating: 1, count: 8)
            self?.section2Data = Array(repeating: 1, count: 9)
            self?.section3Data = Array(repeating: 1, count: 10)
            
            self?.section0Data = Array(repeating: 1, count: 10)
            self?.section1Data = Array(repeating: 1, count: 8)
            self?.section2Data = Array(repeating: 1, count: 9)
            self?.section3Data = Array(repeating: 1, count: 10)
            
            print("------------- 3")

            self?.collectionView.reloadData()
            
        }
        
        fetchData()
        
        
        delay(4) {
            print("------------- 4")
            
            self.collectionView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    
    func fetchData(){
        
        //  let future = locationService.getDummyInt()
        
    }
    
    func registerCells(){
        
        
        collectionView.register(XP_HomePageSectionHeaderView.self, forSupplementaryViewOfKind: XP_HomePageVC.textHeaderElementKindId, withReuseIdentifier: XP_HomePageVC.textHeaderId)
        
        
    }
    
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension:  .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let group  = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension:  .fractionalWidth(1),
                heightDimension: .fractionalHeight(2/5)
            ), subitem: item, count: 2)
        
        
        
        let section = NSCollectionLayoutSection(group: group)
        
        
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    
    
}


extension XP_HomePageVC : UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = XpertContainer.getXpertSampleCatogoryPage()
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return currentSections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch currentSections[section] {
        case .HeroCarousel:
            return section0Data.count
        case .Carousel:
            return section1Data.count
        case .Hotkeys:
            return section2Data.count
        case .Packages:
            return section3Data.count
            
        default:
            return section0Data.count
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: XP_HomePageHotKeyCell.identifier, for: indexPath) as! XP_HomePageHotKeyCell
        //    cell.backgroundColor = .blue
        cell.contentView.backgroundColor = .systemPink
        return cell
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: XP_HomePageVC.textHeaderId, for: indexPath)
        
        return header
        
    }
    
    
    
    
    
    class func createLayoutDiffSection() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
           
            print("Layout called for section Index \(sectionIndex)")
            
            var columns = 1
            switch sectionIndex{
            case 0:
                return firstLayoutSection()
                
            case 1:
                columns = 3
            case 2:
                columns = 5
            default:
                columns = 1
                
            }
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = columns == 1 ?
                NSCollectionLayoutDimension.absolute(44) :
                NSCollectionLayoutDimension.fractionalWidth(0.2)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
            
            
            
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            section.boundarySupplementaryItems = [
                NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44)), elementKind: textHeaderElementKindId, alignment: .top)
            ]
            
            
            return section
        }
        return layout
    }
    
    
    class func firstLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                                                .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension:
                                                .fractionalWidth(0.5))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    
    
    
    /*
     func createLayoutDiffSection() -> UICollectionViewLayout {
     let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
     layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
     
     var columns = 1
     switch sectionIndex{
     case 1:
     columns = 3
     case 2:
     columns = 5
     default:
     columns = 1
     
     }
     
     let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
     heightDimension: .fractionalHeight(1.0))
     let item = NSCollectionLayoutItem(layoutSize: itemSize)
     item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
     
     let groupHeight = columns == 1 ?
     NSCollectionLayoutDimension.absolute(44) :
     NSCollectionLayoutDimension.fractionalWidth(0.2)
     let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
     heightDimension: groupHeight)
     let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
     
     let section = NSCollectionLayoutSection(group: group)
     section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
     return section
     }
     return layout
     }
     **/
    
}


