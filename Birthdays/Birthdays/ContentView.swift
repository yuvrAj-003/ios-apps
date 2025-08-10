//
//  ContentView.swift
//  Birthdays
//
//  Created by YUVRAJ SINGH  on 10/08/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query(sort: \Friend.birthday) private var friends: [Friend];
    @Environment(\.modelContext) private var context;
    
    @State private var newName = ""
    @State private var newDate = Date.now
    var body: some View {
        NavigationStack {
            
            List(friends, id: \.self) {
                friend in
                
                
                HStack (alignment: .center){
                    
                    
                    if(friend.isBirthdayToday) {
                        Image(systemName: "birthday.cake");
                    }
                    Text(friend.name).font(.subheadline)
                        .bold(friend.isBirthdayToday)
                    
                    Spacer()
                    
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                    
                    Button(action: {
                        withAnimation {
                            context.delete(friend)
                        }
                        
                    }){
                        Image(systemName: "multiply.circle.fill")
                    }
                    
                    .buttonStyle(.borderless)
                    .tint(.black)
                    
                }
                
            
                
            }
            .animation(.default, value: friends)
            .scrollContentBackground(.hidden)
            .background(.gray.opacity(0.10))
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 20){
                
                VStack (alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    
                    DatePicker(
                        selection: $newDate,
                        displayedComponents: .date
                    ) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Save") {
                        withAnimation {
                            let newFriend = Friend(name:newName, birthday: newDate)
                            context.insert(newFriend); 
                            
                            newName = ""
                            newDate = .now
                        }
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)
                }
                .padding()
                .padding(.vertical, 20)
                .background(.bar)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
