//
//  ContentView.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 11/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            Tab("Friend", systemImage: "person.and.person"){
                
                FriendList()
            }
            
            
            Tab("Movies", systemImage: "film.stack") {
                MovieList()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
