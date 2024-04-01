//
//  CloseSushiView.swift
//  menu_D33
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/31.
//

import SwiftUI

struct CloseSushiView: View {
    @Binding var selectedImage:String
    var body: some View {
        Image(selectedImage)
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    CloseSushiView(selectedImage: Binding.constant("Amaebi"))
}
