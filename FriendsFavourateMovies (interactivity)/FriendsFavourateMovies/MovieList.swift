//
//  MovieList.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 11/08/25.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    
    @Query private var movies: [Movie]
    @Environment(\.modelContext) private var context : ModelContext;
    
    @State private var newMovie: Movie?
    
    // used to filter
    init(titleFilter: String = "") {
        let predicate = #Predicate<Movie> {
            movie in
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
        }
        
        _movies = Query(filter: predicate, sort: \Movie.title)
    }
    var body: some View {
        Group {
            if(!movies.isEmpty){
                List {
                    ForEach(movies) {
                        movie in
                        NavigationStack {
                            
                            NavigationLink(movie.title) {
                                MovieDetail(movie: movie)
                                
                            }
                        }
                    }
                    .onDelete(perform: deleteMovies(indexes:))
                }
            }
            else{
                ContentUnavailableView("Add Movies", systemImage: "film.stack")
            }
        }
        .navigationTitle("Movies")
        .toolbar {
            ToolbarItem {
                Button("Add Movie", systemImage: "plus") {
                    addMovie()
                }
            }
            ToolbarItem {
                EditButton()
            }
            
        }
        .sheet(item: $newMovie) {
            movie in
            NavigationStack{
                MovieDetail(movie:movie, isNew: true)
            }
            .interactiveDismissDisabled()
            
            
        }
            
        
        
    }
    
    private func addMovie() {
        let newMovie = Movie(title: "", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    
    private func deleteMovies(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}


#Preview("Filtered") {
    MovieList(titleFilter: "")
        .modelContainer(SampleData.shared.modelContainer)
}
