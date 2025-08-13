//
//  FriendList.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 11/08/25.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    
    @Query(sort: \Friend.name) private var friends : [Friend];
    @Environment(\.modelContext) private var context;
    @State private var newFriend: Friend?
    var body: some View {
        NavigationSplitView {
            List {
                
                ForEach(friends) {
                    friend in
                    NavigationLink(friend.name){
                        NavigationStack {
                            FriendDetail(friend: friend)
                        }
                       
                    }
                    
                }
                .onDelete(perform: deleteFriend(indexes:))
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem {
                    Button("Add friend", systemImage: "plus"){
                        addFriend()
                    }
                }
                
                ToolbarItem {
                    EditButton()
                }
            }
            .sheet(item: $newFriend) {
                friend in
                NavigationStack {
                    FriendDetail(friend: friend, isNew: true )
                }
                .interactiveDismissDisabled()
            }
        } detail : {
            Text("Select a friend")
                    .navigationTitle("Friend")
                    .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    private func addFriend() {
        let newFriend = Friend(name: "")
        context.insert(newFriend)
        self.newFriend = newFriend
    }
    
    private func deleteFriend(indexes: IndexSet) {
        
        for index in indexes {
            context.delete(friends[index])
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
