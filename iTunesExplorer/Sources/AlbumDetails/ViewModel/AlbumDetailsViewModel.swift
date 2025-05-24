//
//  AlbumDetailsViewModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

class AlbumDetailsViewModel: BaseViewModel<AlbumDetailsCoordinator>, AlbumDetailsViewModelProtocol {

    let album: AlbumItemResponse
    
    init(coordinator: AlbumDetailsCoordinator?, album: AlbumItemResponse) {
        self.album = album
        
        super.init(coordinator: coordinator)
    }
}
