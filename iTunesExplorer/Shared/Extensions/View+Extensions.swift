//
//  View+Extensions.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import SwiftUI

extension View {
    
    func insideHostingController(clearBackground: Bool = false) -> ViewAwareHostingController<some View> {
        let content = self
            .environment(\.font, .brand())
        
        // We HAVE TO pass the "name" from here, because the view we pass ("content") has environment
        // variables, which makes it a type of ModifiedContent<View, _EnvironmentKey...>.
        // To be able to get the name of a view, we must use non-modified version.
        let viewController = ViewAwareHostingController(rootViewName: name, rootView: content)
        
        if clearBackground {
            viewController.view.backgroundColor = .clear
        }
        
        return viewController
    }
    
    /// Returns the exact name of the view. (i.e, if the view is IntroView, this will return IntroView)
    /// When views are used with UIHostingController, which does not provide the name of its root view,
    /// there is no way to know what view is the root view. Using this property, we can tell what view is wrapped.
    var name: String { String(describing: Self.self) }
}
