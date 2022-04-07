//
//  Park.swift
//  NationalParkList
//
//  Created by Max Miller on 4/7/22.
//

import Foundation

struct Park : Codable, Identifiable {
    var id: String
    var name: String

    var description: String

    var imageName: String
}
