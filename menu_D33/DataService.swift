//
//  DataService.swift
//  menu_D33
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/31.
//

import Foundation
import SwiftUI

struct DataService{
    //SushiMenuView Data
    func sushiViewData() -> [SushiLogic]{
        
        if let url = Bundle.main.url(forResource: "JapaneseSushi", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                do{
                    let sushi = try decoder.decode([SushiLogic].self, from: data)
                    return sushi
                }
                catch{
                    print("Could not parse the JSON: \(error)")
                }
            }
            catch{
                print("404: \(error)")
            }
        }
        
        return [SushiLogic]()
    }
}
