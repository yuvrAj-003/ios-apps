//
//  FilteredFriendList.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 14/08/25.
//

import SwiftUI

struct FilteredFriendList: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
                FriendList(nameFilter: searchText)
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    FilteredFriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
