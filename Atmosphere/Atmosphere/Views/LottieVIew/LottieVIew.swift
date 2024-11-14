//
//  LottieVIew.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/22/24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animeName: String
    var loopMode: LottieLoopMode = .loop
    var animationSpeed: CGFloat = 0.5 // Default is 1.0, adjust this value to control speed

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        uiView.subviews.forEach({ $0.removeFromSuperview() })
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named(animeName)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed // Set the animation speed
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        uiView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: uiView.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: uiView.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: uiView.centerYAnchor)
        ])
        animationView.play()
    }
}
