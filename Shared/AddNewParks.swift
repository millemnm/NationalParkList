//
//  AddNewParks.swift
//  NationalParkList
//
//  Created by Max Miller on 4/7/22.
//

import SwiftUI



struct AddNewParks: View {
    
    @StateObject var parkStore : ParkStore
    @State private var name: String = ""
    @State private var description: String = ""
    
    
    var body: some View {
        Form{
            Section(header: Text("Park Details")){
                Image(systemName: "park.fill")
                    .resizable()
                    .aspectRatio (contentMode: .fit)
                    .padding()
                DataInput(title: "Park Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
            }
            
            
            Button (action: addNewPark){
                Text ("Add Park")
                
            }
        }
    }
    
    func addNewPark(){
        let newPark = Park(id: UUID().uuidString, name: name, description: description, imageName: "tesla_model_3")
        
        parkStore.parks.append(newPark)
    }
}

struct DataInput: View{
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading){
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
