//
//  SplashView.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 12/06/25.
//

import SwiftUI

struct SplashView: View {

    public init() { }
    @State private var isGlitching = false
    @Environment(\.colorScheme) private var colorScheme
    
    public var body: some View {
        VStack {
            GlitchEffectView(
                content: Image(systemName: "movieclapper")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(colorScheme == .dark ? .white : .black),
                isGlitching: $isGlitching,
                colorScheme: colorScheme
            )
            .frame(width: 300, height: 300)
            
            GlitchEffectView(
                content: Text("app_name")
                    .font(.system(size: 50, weight: .heavy))
                    .foregroundColor(colorScheme == .dark ? .white : .black),
                isGlitching: $isGlitching,
                colorScheme: colorScheme
            )
            .padding(.top, 20)
            
        }
        .onAppear {
            isGlitching.toggle()
        }
    }
}

struct GlitchEffectView<Content: View>: View {
    let content: Content
    @Binding var isGlitching: Bool
    @State private var offsetRed: CGFloat = 0
    @State private var offsetBlue: CGFloat = 0
    let colorScheme: ColorScheme
    
    init(content: Content, isGlitching: Binding<Bool>, colorScheme: ColorScheme) {
        self.content = content
        self._isGlitching = isGlitching
        self.colorScheme = colorScheme
    }
    
    var body: some View {
        ZStack {
            content
                .modifier(GlitchModifier(color: .red, offset: offsetRed, colorScheme: colorScheme))
            content
                .modifier(GlitchModifier(color: .blue, offset: offsetBlue, colorScheme: colorScheme))
        }
        .onChange(of: isGlitching) { newValue in
            if newValue {
                startGlitchAnimation()
            } else {
                resetGlitch()
            }
        }

    }
    
    private func startGlitchAnimation() {
        let duration = 0.05
        let steps = 10
        
        for i in 0..<steps {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * duration) {
                withAnimation(.easeInOut(duration: duration)) {
                    self.offsetRed = CGFloat.random(in: -15...0)
                    self.offsetBlue = CGFloat.random(in: 0...15)
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(steps) * duration) {
            self.resetGlitch()
            self.isGlitching = false
        }
    }
    
    private func resetGlitch() {
        withAnimation(.easeInOut(duration: 0.1)) {
            offsetRed = 0
            offsetBlue = 0
        }
    }
}

struct GlitchModifier: ViewModifier {
    let color: Color
    let offset: CGFloat
    let colorScheme: ColorScheme
    
    func body(content: Content) -> some View {
        content
            .offset(x: offset / 4)
            .shadow(color: color.opacity(colorScheme == .dark ? 0.5 : 0.5), radius: 1, x: offset, y: 0)
    }
}

#Preview {
    SplashView()
}
