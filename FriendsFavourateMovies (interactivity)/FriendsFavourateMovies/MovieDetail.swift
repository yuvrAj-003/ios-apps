//
//  MovieDetail.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 12/08/25.
//

import SwiftUI

struct MovieDetail: View {
    
    let isNew: Bool;
    @Bindable var movie : Movie
    @Environment(\.dismiss) private var dismiss;
    @Environment(\.modelContext) private var context;
    
    var sortedFriends: [Friend] {
        movie.favoratedBy.sorted {
            first, second in first.name < second.name
        }
    }
    
    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie;
        self.isNew = isNew;
    }
    var body: some View {
        
        Form {
            TextField("Name", text: $movie.title)
                .onChange(of: movie.title) {
                    if(movie.title.count <= 0){
                        movie.title = "Default";
                    }
                }
                .autocorrectionDisabled();
                
            
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
            
            if !movie.favoratedBy.isEmpty {
                Section("Favourated By") {
                    ForEach(sortedFriends) {
                        friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New Movie" : "Movies")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if(isNew){
                ToolbarItem (placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(movie);
                        dismiss();
                    }
                }
                ToolbarItem (placement: .confirmationAction) {
                    Button("Save") {
                        dismiss();
                    }
                }
            }
            
            
            
        }
    }
    
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
