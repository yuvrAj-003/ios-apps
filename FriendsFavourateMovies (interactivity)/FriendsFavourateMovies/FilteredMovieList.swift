//
//  FilteredMovieList.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 14/08/25.
//

import SwiftUI

struct FilteredMovieList: View {
    
    @State private var searchText = "";
    var body: some View {
        NavigationStack {
            MovieList(titleFilter: searchText)
                
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
