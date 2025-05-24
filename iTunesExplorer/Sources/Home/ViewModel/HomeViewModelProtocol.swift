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
    var systemAlert: SystemAlertModel? { get set }
    var albumsQuantity: Int { get set }
    
    func loadData()
    func openDetails(for album: AlbumItemResponse)
}
