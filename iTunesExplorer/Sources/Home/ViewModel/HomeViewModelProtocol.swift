//
//  HomeViewModelProtocol.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

protocol HomeViewModelProtocol: BaseViewModelProtocol {
    var albums: [AlbumItemResponse] { get }
    
    func loadData()
}
