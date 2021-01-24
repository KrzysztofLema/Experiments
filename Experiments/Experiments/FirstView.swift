//
//  FirstView.swift
//  Experiments
//
//  Created by Krzysztof Lema on 21/01/2021.
//

import SwiftUI
struct FirstView: View {
    
    @State var percent = 0.0
    @State var uScale: CGFloat = 1.0
    @State var squareColor = Color.white
    @State var uSquereScale:CGFloat = 1.0
    @State var lineScale: CGFloat = 1
    
    let blueColor = Color(.systemBlue)
    let uLineWidth: CGFloat = 5
    let uZoomFactor: CGFloat = 1.4
    let uSquereLength: CGFloat = 12
    let lineHeight: CGFloat = 28
    let lineWidth:CGFloat = 4
    
    var body: some View {
      ZStack {
        Text("F           BER")
          .font(.largeTitle)
          .foregroundColor(.white)
          .offset(x: 20,
                  y: 0)
        FuberU.init(percent: percent)
            .stroke(Color.white, lineWidth: uLineWidth)
            .rotationEffect(.degrees(0))
            .aspectRatio(1, contentMode: .fit)
            .padding(20)
            .onAppear() {
                self.handleAnimations()
            }
            .scaleEffect(uScale * uZoomFactor)
            .frame(width: 45, height: 45, alignment: .center)
        
        Rectangle()
            .fill(squareColor)
            .scaleEffect(uSquereScale * uZoomFactor)
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
    var uFinalAnimationDuration: Double { return 0.4 }
    var minAnimationInterval: Double { return 0.1 }
    var fadeAnimationDuration: Double { return 0.4 }
    
    
    func handleAnimations() {
        runAnimationPart1()
        restartAnimation()
    }
    
    func runAnimationPart1(){
        withAnimation(.easeInOut(duration: uAnimationDuration)) {
            percent = 1
            uScale = 5
            lineScale = 1
        }
        let deadline: DispatchTime = .now() + uAnimationDuration + uAnimationDelay
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            withAnimation(.easeOut(duration: self.uExitAnimationDuration)) {
                self.uScale = 0
                self.lineScale = 0
            }
            withAnimation(.easeOut(duration: self.minAnimationInterval)){
                self.uSquereScale = 0
            }
        }
    }
    
    func restartAnimation() {
        let deadline: DispatchTime = .now() + uAnimationDuration
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.percent = 0
            self.handleAnimations()
        }
    }
}

struct FuberU: Shape {
    var percent: Double
    func path(in rect: CGRect) -> Path {
        let end = percent * 360
        var p = Path()
        
        p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.height/2), radius: rect.size.width/2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: end), clockwise: false)
        
        return p
    }
    
    var animatableData: Double {
        get { return percent }
        set { percent = newValue }
    }
    
}

#if DEBUG
struct SplashScreen_Previews : PreviewProvider {
  static var previews: some View {
    FirstView()
  }
}
#endif
