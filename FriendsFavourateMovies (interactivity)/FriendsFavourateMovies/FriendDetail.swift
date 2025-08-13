//
//  FriendDetail.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 12/08/25.
//

import SwiftUI

struct FriendDetail: View {
    
    let isNew: Bool;
    @Bindable var friend: Friend
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context;
    
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
    FriendDetail(friend: SampleData.shared.friend);
}
