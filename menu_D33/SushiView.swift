//
//  SushiView.swift
//  menu_D33
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/31.
//

import SwiftUI

struct SushiView: View {
    
    @State var selectedImage = ""
    @State var selectedSushi = ""
    @State var selectedSushiDescription = ""
    @State var selectedSushiPrice = ""
    @State var sushuSheet = false
    
    @State var sushiList = [SushiLogic]()
    var getData = DataService()
    
    var body: some View {
        List(sushiList){sushi in
            HStack{
                VStack(alignment: .leading){
                    
                    
                    HStack {
                        //Sushi Image
                        Image(sushi.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                        .cornerRadius(20)
                        //Sushi Description
                        Text(sushi.name)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        Spacer()
                        
                        //Price
                        Text("$\(sushi.price)")
                            .fontWeight(.bold)
                    }
                    
                    //Description
                    Text(sushi.description)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
            }.onTapGesture {
                selectedImage = sushi.imageName
                selectedSushi = sushi.name
                selectedSushiPrice = sushi.price
                selectedSushiDescription = sushi.description
                sushuSheet = true
            }
            
        }
        .listStyle(.plain)
        .onAppear(perform: {
            sushiList = getData.sushiViewData()
        })
        .sheet(isPresented: $sushuSheet, content: {
            SushiSheetView(selectedImage: $selectedImage, selectedSushi: $selectedSushi, selectedSushiDescription: $selectedSushiDescription, selectedSushiPrice: $selectedSushiPrice, sushuSheet: $sushuSheet)
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium, .large])
        })
    }
}

#Preview {
    SushiView()
}
