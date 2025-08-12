//
//  MovieDetail.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 12/08/25.
//

import SwiftUI

struct MovieDetail: View {
    
    @Bindable var movie : Movie
    var body: some View {
        
        Form {
            TextField("Name", text: $movie.title)
                .autocorrectionDisabled();
            
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
        }
        .navigationTitle("Movie")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    MovieDetail(movie: SampleData.shared.movie)
}
