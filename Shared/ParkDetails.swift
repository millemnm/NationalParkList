//
//  ParkDetails.swift
//  NationalParkList
//
//  Created by Max Miller on 4/7/22.
//

import SwiftUI

struct ParkDetails: View {
    let selectedPark: Park
    
    var body: some View {
        Form {
            Section(header: Text ("Park Details")) {
                Image(selectedPark.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text (selectedPark.name)
                    .font(.headline)
                Text(selectedPark.description)
                    .font(.body)
            }
        }
    }
}

struct ParkDetails_Previews: PreviewProvider {
    static var previews: some View {
        ParkDetails(selectedPark: parkData[0])
    }
}
