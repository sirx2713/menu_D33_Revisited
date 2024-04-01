//
//  SushiSheetView.swift
//  menu_D33
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/31.
//

import SwiftUI

struct SushiSheetView: View {
    
    @State var closeView = ""
    @State var closeSushiView = false
    @Binding var selectedImage:String
    @Binding var selectedSushi:String
    @Binding var selectedSushiDescription:String
    @Binding var selectedSushiPrice:String
    @Binding var sushuSheet:Bool
    
    var body: some View {
        VStack{
            VStack {
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                .ignoresSafeArea()
            }
            .onTapGesture {
                closeView = selectedImage
                closeSushiView = true
            }
            .sheet(isPresented: $closeSushiView, content: {
                CloseSushiView(selectedImage: $closeView)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.large])
            })
            
            Spacer()
            Text(selectedSushi)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Text(selectedSushiDescription)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            Text("$" + selectedSushiPrice)
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    SushiSheetView(selectedImage: Binding.constant("Amaebi"), selectedSushi: Binding.constant("Amaebi"), selectedSushiDescription: Binding.constant("Amaebi Sushi. Amaebi, or spot prawns, (colloquially known as sweet shrimp) are cold water northern shrimp known and named for their sweet taste. They are the only species of shrimp which are best enjoyed raw, as cooking them will rob them of their full sweetness."), selectedSushiPrice: Binding.constant("6.99"), sushuSheet: Binding.constant(true))
}
