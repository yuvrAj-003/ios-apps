//
//  MovieList.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 11/08/25.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    
    @Query(sort: \Movie.title) private var movies: [Movie]
    @Environment(\.modelContext) private var context : ModelContext;
    
    @State private var newMovie: Movie?
    var body: some View {
        NavigationSplitView {
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
            
        } detail : {
            
            Text("Select Movie")
                .navigationTitle("movie")
                .navigationBarTitleDisplayMode(.inline)
            
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
