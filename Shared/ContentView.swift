//
//  ContentView.swift
//  Shared
//
//  Created by Max Miller on 4/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var parkStore : ParkStore = ParkStore(parks: parkData)
    
    var body: some View {
        NavigationView {
            List{
                ForEach (parkStore.parks){ park in
                    ListCell(park: park)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("National Parks"))
            .navigationBarItems(leading: NavigationLink(destination:            AddNewParks(parkStore: self.parkStore)){
                    Text("Add")
                        .foregroundColor(.blue)
                }, trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        parkStore.parks.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int){
        parkStore.parks.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    var park: Park
    var body: some View {
        NavigationLink(destination: ParkDetails(selectedPark:park)){
            HStack{
                Image(park.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(park.name)
            }
        }
    }
}
