//
//  FriendDetail.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 12/08/25.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    
    let isNew: Bool;
    @Bindable var friend: Friend
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context;
    
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    init(friend: Friend, isNew: Bool = false){
        self.friend = friend;
        self.isNew = isNew;
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
                .onChange(of: friend.name){
                    if(friend.name.count <= 0){
                        friend.name = "Default"
                    }
                }
            Picker("Favorite Movie", selection: $friend.favoriteMovie) {
                
                Text("None").tag(nil as Movie?)
                
                ForEach(movies) {
                    movie in
                    Text(movie.title).tag(movie)
                }

            }.padding(.vertical, -10)
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            if(isNew){
                
                
                
                ToolbarItem(placement: .cancellationAction) {
                    
                    Button("Save") {
                        context.delete(friend)
                        dismiss();
                    }
                }
                
                
                ToolbarItem(placement: .confirmationAction) {
                    
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
            FriendDetail(friend: SampleData.shared.friend)
        }
    .modelContainer(SampleData.shared.modelContainer)
}
