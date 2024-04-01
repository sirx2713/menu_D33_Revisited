//
//  ContentView.swift
//  menu_D33
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/31.
//

import SwiftUI

struct MainView: View {
    
    @State private var isAnimationGradient:Bool = false
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                NavigationLink {
                    SushiView()
                        .navigationBarBackButtonHidden()
                } label: {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(colors: [.red, .yellow], startPoint: isAnimationGradient ? .topLeading : .bottomLeading, endPoint: isAnimationGradient ? .bottomTrailing : .topTrailing)
                                
                            )
                            .onAppear{
                                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                                    isAnimationGradient.toggle()
                                }
                            }
                        MotionAnimationView()
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        
                    }.frame(width: 256, height: 256)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
