//
//  ParkStore.swift
//  NationalParkList
//
//  Created by Max Miller on 4/7/22.
//

import Foundation
import SwiftUI
import Combine

class ParkStore : ObservableObject{
    @Published var parks: [Park]
    
    init (parks: [Park] = []) {
        self.parks = parks
    }
}
