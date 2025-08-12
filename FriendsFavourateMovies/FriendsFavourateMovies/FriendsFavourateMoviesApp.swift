//
//  FriendsFavourateMoviesApp.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 11/08/25.
//

import SwiftUI

@main
struct FriendsFavourateMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Movie.self, Friend.self])
    }
}
