//
//  FirstView.swift
//  Experiments
//
//  Created by Krzysztof Lema on 21/01/2021.
//

import SwiftUI
struct FirstView: View {
    
    @State var percent = 0.0
    @State var uScale: CGFloat = 1
    @State var squareColor = Color.white
    @State var squereScale: CGFloat = 1
    @State var lineScale: CGFloat = 1
    @State var textAlpha = 0.0
    @State var textScale: CGFloat = 1
    @State var coverCircleScale: CGFloat = 1
    @State var coverCircleAlpha = 0.0
    
    let blueColor = Color(.systemBlue)
    let uLineWidth: CGFloat = 5
    let uZoomFactor: CGFloat = 1.4
    let uSquereLength: CGFloat = 12
    let lineHeight: CGFloat = 28
    let lineWidth: CGFloat = 4
    
    var body: some View {
        ZStack {
            Image("Chimes")
                .resizable(resizingMode: .tile)
                .opacity(textAlpha)
                .scaleEffect(textScale)
            
            Circle()
                .fill(blueColor)
                .frame(width: 1, height: 1, alignment: .center)
                .scaleEffect(coverCircleScale)
                .opacity(coverCircleAlpha)
            
            Text("F           BER")
                .font(.largeTitle)
                .foregroundColor(.white)
                .opacity(textAlpha)
                .offset(x: 20,
                        y: 0)
                .scaleEffect(textScale)
            
            FuberU.init(percent: percent)
                .stroke(Color.white, lineWidth: uLineWidth)
                .rotationEffect(.degrees(-90))
                .aspectRatio(1, contentMode: .fit)
                .padding(20)
                .onAppear() {
                    self.handleAnimations()
                }
                .scaleEffect(uScale * uZoomFactor)
                .frame(width: 45, height: 45, alignment: .center)
            
            Rectangle()
                .fill(squareColor)
                .scaleEffect(squereScale * uZoomFactor)
                .frame(width: uSquereLength, height: uSquereLength, alignment: .center)
                .onAppear() {
                    self.squareColor = self.blueColor
                }
            
            Rectangle()
                .fill(blueColor)
                .scaleEffect(lineScale, anchor: .bottom)
                .frame(width: lineWidth, height: lineHeight, alignment: .center)
                .offset(x: 0,y: -22)
            
            Rectangle()
                .fill(blueColor)
                .scaleEffect(lineScale, anchor: .bottom)
                .frame(width: lineWidth, height: lineHeight, alignment: .center)
                .offset(x: 0,y: -22)
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity)
        .background(blueColor)
        .edgesIgnoringSafeArea(.all)
    }
}

extension FirstView {
    var uAnimationDuration: Double { return 1.0 }
    var uAnimationDelay: Double { return 0.2 }
    var uExitAnimationDuration: Double { return 0.3 }
    var finalAnimationDuration: Double { return 0.4 }
    var minAnimationInterval: Double { return 0.1 }
    var fadeAnimationDuration: Double { return 0.4 }
    
    func handleAnimations() {
        runAnimationPart1()
        runAnimationPart2()
        runAnimatiomPart3()
        restartAnimation()
    }
    
    func runAnimationPart1(){
        withAnimation(.easeIn(duration: uAnimationDuration)) {
            percent = 1
            uScale = 5
            lineScale = 1
        }
        withAnimation(Animation.easeIn(duration: uAnimationDuration).delay(0.5)) {
            textAlpha = 1
        }
        let deadline: DispatchTime = .now() + uAnimationDuration + uAnimationDelay
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            withAnimation(.easeOut(duration: self.uExitAnimationDuration)) {
                self.uScale = 0
                self.lineScale = 0
            }
            withAnimation(.easeOut(duration: self.minAnimationInterval)){
                self.squereScale = 0
            }
            withAnimation(Animation.spring()) {
                self.textScale = self.uZoomFactor
            }
        }
    }
    
    func runAnimationPart2() {
        let deadline: DispatchTime = .now() + uAnimationDuration + uAnimationDelay
            + minAnimationInterval
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.squareColor = Color.white
            self.squereScale = 1
            withAnimation(.easeOut(duration: self.fadeAnimationDuration)) {
                self.coverCircleAlpha = 1
                self.coverCircleScale = 1000
            }
        }
    }
    
    func runAnimatiomPart3() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2 * uAnimationDuration) {
            withAnimation(.easeIn(duration: self.finalAnimationDuration)) {
                self.textAlpha = 0
                self.squareColor = self.blueColor
            }
        }
    }
    
    func restartAnimation() {
        let deadline: DispatchTime = .now() + 2 * uAnimationDuration
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.percent = 0
            self.textScale = 1
            self.coverCircleAlpha = 0
            self.coverCircleScale = 1
            self.handleAnimations()
        }
    }
}

struct FuberU: Shape {
    var percent: Double
    func path(in rect: CGRect) -> Path {
        let end = percent * 360
        var p = Path()
        
        p.addArc(
            center: CGPoint(
                x: rect.size.width / 2,
                y: rect.size.height / 2),
            radius: rect.size.width / 2,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: end),
            clockwise: false)
        
        return p
    }
    
    var animatableData: Double {
        get { return percent }
        set { percent = newValue }
    }
    
}

#if DEBUG
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
#endif
