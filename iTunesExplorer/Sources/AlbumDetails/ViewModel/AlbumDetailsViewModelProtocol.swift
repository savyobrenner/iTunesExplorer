//
//  AlbumDetailsViewModelProtocol.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

protocol AlbumDetailsViewModelProtocol: BaseViewModelProtocol {
    var album: AlbumItemResponse { get }
    var price: String { get }
    var trackCount: String { get }
}
