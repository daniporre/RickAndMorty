//
//  LoadingView.swift
//  Rick&MortyApp
//
//  Created by Dani on 9/6/23.
//

import Foundation
import SwiftUI

public struct LoadingView: View {
    @State private var rotating = false

    public init() {}
    
    public var body: some View {
        VStack {
            SwiftUI.Image("customProgressImage")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: Constants.spinnerSize,
                   height: Constants.spinnerSize,
                   alignment: .center)
            .rotationEffect(.degrees(rotating ? Constants.maxRotate : .zero))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.linear(duration: Constants.rotateDuration).repeatForever(autoreverses: false)) {
                        rotating = true
                    }
                }
            }
        }
    }

    private enum Constants {
        static let spinnerSize: CGFloat = 55
        static let rotateDuration: Double = 0.9
        static let maxRotate: Double = 360
    }
}
