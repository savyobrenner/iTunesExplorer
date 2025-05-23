//
//  LottieView.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animationName: String
    var loopMode: LottieLoopMode = .autoReverse
    var contentMode: UIView.ContentMode = .scaleAspectFit

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView(name: animationName)
        animationView.contentMode = contentMode
        animationView.loopMode = loopMode
        animationView.backgroundColor = .clear
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.play()
        
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) { }
}
