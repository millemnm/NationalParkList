//
//  ParkData.swift
//  NationalParkList
//
//  Created by Max Miller on 4/7/22.
//

import UIKit
import SwiftUI
import Foundation

var parkData: [Park] = loadJson("parkData.json")

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("\(filename) not found.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Could not load \(filename): \(error)")
    }
    
    do{
        return try JSONDecoder().decode(T.self, from: data)
    }catch{
        fatalError("Unable to parse \(filename): \(error)")
    }
}
