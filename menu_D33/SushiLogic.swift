//
//  SushiLogic.swift
//  menu_D33
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/31.
//

import Foundation

struct SushiLogic: Identifiable, Decodable{
    
    let id: UUID = UUID()
    var name:String
    var price:String
    var description:String
    var imageName:String
}
