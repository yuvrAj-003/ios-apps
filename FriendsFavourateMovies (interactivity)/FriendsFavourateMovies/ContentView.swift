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
                
                FilteredFriendList()
            }
            
            
            Tab("Movies", systemImage: "film.stack") {
                FilteredMovieList()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
