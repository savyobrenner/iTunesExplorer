//
//  AppColors.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import SwiftUI

extension Color {
    enum Brand {
        static let clear = Color.clear
        static let white = Color.white
        static let black = Color.black
        static let red = Color.red
        static let gray = Color.gray
        
        static let success = Color.green
        static let warning = Color.orange
        static let error = Color.red
        
        ///#dde048
        static let primary = Color("primary_color")
        
        ///#a6a836
        static let primaryThirdPalette = Color("primary_color_third_palette")
        
        ///#151515
        static let secondary = Color("secondary_color")
        
        ///#f5f5f5
        static let offWhite = Color("off_white_color")
    }
}
