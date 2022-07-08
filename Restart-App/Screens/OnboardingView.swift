//
//  OnboardingView.swift
//  Restart-App
//
//  Created by Sarath P on 07/07/22.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                //MARK: - HEADER
                
                Spacer()
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                         It's not how much we give but how much love we put into giving.
                         """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    
                }//MARK: -HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                //MARK: - CENTER
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            
                        DragGesture()
                            .onChanged({ gesture in
                                if abs(imageOffset.width) <= 100 {
                                    imageOffset = gesture.translation
                                }
                            })
                            .onEnded({ _ in
                                imageOffset = .zero
                            })
                        
                        )//MARK: GESTURE
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                } //MARK: CENTER
                Spacer()
                
                //MARK: - FOOTER
                ZStack {
                    //MARK: 1. BACKGROUND (STATIC)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.3))
                        .padding(8)
                    //MARK: 2. CALL-TO-ACITON (STATIC)
                    Text("Get started")
                        .font(.system(.title3))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    //MARK: 3. CAPSULE (DYNAMIC)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                        
                    }
                    //MARK: 4. CIRCLE (DRAGGABLE)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                    buttonOffset = gesture.translation.width
                                }
                            })
                            .onEnded({ gesture in
                                
                                withAnimation(.easeOut(duration: 0.4)) {
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset =  buttonWidth - 80
                                        isOnboardingActive = false
                                    } else {
                                        buttonOffset = 0
                                    }
                                }
                                
                            })
                        )//MARK: END OF GESTURE
                        
                        Spacer()
                    }
                } //MARK: FOOTER
                .frame(width: buttonWidth ,height: 80, alignment: .center)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 45)
                .animation(.easeOut(duration: 1), value: isAnimating)
                .padding()
                
            } //MARK: - VSTACK
        } //MARK: - ZSTACK
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
