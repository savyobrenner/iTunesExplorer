//
//  FloatingAlertModifier.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

struct FloatingAlertModifier: ViewModifier {
    @Binding
    var alert: FloatingAlertModel?
    
    @State
    private var workItem: DispatchWorkItem?

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    mainAlertView()
                }
                .animation(.spring(), value: alert)
            )
            .onChange(of: alert) { _ in
                showAlert()
            }
    }

    @ViewBuilder private func mainAlertView() -> some View {
        if let alert = alert {
            VStack {
                if alert.position == .top {
                    FloatingAlertView(alert: alert)
                    Spacer()
                } else {
                    Spacer()
                    FloatingAlertView(alert: alert)
                        .padding(.bottom, 40)
                }
            }
            .transition(.move(edge: alert.position == .top ? .top : .bottom))
        }
    }

    private func showAlert() {
        guard let alert = alert else { return }

        UIImpactFeedbackGenerator(style: .light).impactOccurred()

        if alert.duration > 0 {
            workItem?.cancel()

            let task = DispatchWorkItem {
                dismissAlert()
            }

            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + alert.duration, execute: task)
        }
    }

    private func dismissAlert() {
        withAnimation {
            alert = nil
        }

        workItem?.cancel()
        workItem = nil
    }
}

extension View {
    func showLAPAlert(alert: Binding<FloatingAlertModel?>) -> some View {
        self.modifier(FloatingAlertModifier(alert: alert))
    }
}
