//
//  StorageError.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import Foundation

public enum StorageError: Error {
    case notFound
    case cantWrite(Error)
    case cantDelete(StorageKey)
}
