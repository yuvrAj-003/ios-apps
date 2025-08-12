//
//  FriendDetail.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 12/08/25.
//

import SwiftUI

struct FriendDetail: View {
    
    @Bindable var friend: Friend
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
        }
        .navigationTitle("Friend")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FriendDetail(friend: SampleData.shared.friend);
}
