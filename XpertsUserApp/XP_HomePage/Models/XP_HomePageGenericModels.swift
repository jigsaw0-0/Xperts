//
//  XP_HomePageGenericModels.swift
//  TempXpertsApp
//
//  Created by Sriram S on 06/03/22.
//

import Foundation
import UIKit

protocol XP_ItemViewModel {
    
    var reuseIdentifier : String { get }
    
    func setup(_ cell : UICollectionReusableView, in collectionView : UICollectionView, at indexPath : IndexPath)
    
}


protocol XP_SectionViewModel {
    
    var header : XP_ItemViewModel? { get }
    var footer : XP_ItemViewModel? { get }
    
    var items : [XP_ItemViewModel] { get }
    
    func model(for elementOfKind : String) -> XP_ItemViewModel?
    
    
    
}
