//
//  HomeViewModelProtocol.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

protocol HomeViewModelProtocol: BaseViewModelProtocol {
    var title: String { get }
    var albums: [AlbumItemResponse] { get }
    var isOnline: Bool { get }
    
    func loadData()
    func openDetails(for album: AlbumItemResponse)
}
