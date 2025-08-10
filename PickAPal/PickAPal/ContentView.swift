//
//  ContentView.swift
//  PickAPal
//
//  Created by YUVRAJ SINGH  on 03/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var names: [String] = [];
    @State private var pickedName: String = "";
    @State private var username: String = "";
    @State private var isChecked = false;
    @State private var wordCount: Int = 16;
    @State private var shouldRemovePickedName : Bool = false;
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                
                Text("Pick A Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? "" : pickedName)
                .font(.headline.lowercaseSmallCaps())
                .foregroundStyle(.tint)
                .bold()
            
            // name list
            List {
                ForEach(names.indices, id: \.self) { id in
                    
                    HStack {
                        
                        Text("\(names[id])").font(.subheadline.lowercaseSmallCaps())
                        Spacer()
                        
                        
                        Button("Remove", systemImage: "trash") {
                            names.remove(at: id)
                        }.buttonStyle(.borderless)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .labelStyle(.iconOnly)
            .animation(.default, value: names)
            
            
            VStack {
                HStack{
                    
                    // text field
                    TextField("Enter Name", text: $username)
                        .font(.subheadline.lowercaseSmallCaps())
                        .autocorrectionDisabled()
                        .onKeyPress{ keyPress in
                            
                            let deleteKey: Bool = keyPress.key == KeyEquivalent("\u{08}");
                            
                            if(deleteKey){
                                if(wordCount < 16){
                                    wordCount += 1;
                                }
                            }
                            else {
                                if(wordCount > 0){
                                    wordCount -= 1;
                                }
                            }
                            
                            return .ignored
                        }
                        .onSubmit {
                            withAnimation{
                                wordCount = 16;
                                
                                if(!username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && username.count < wordCount){
                                    names.append(username.trimmingCharacters(in: .whitespacesAndNewlines))
                                    
                                }
                                username = "";
                            }
                        }
                    
                    Spacer()
                    
                    // text
                    Text("(\(wordCount))").opacity(0.25)
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.10), in: RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal, 15)
                
                // toggle button
                Toggle("Remove While Picked", isOn: $shouldRemovePickedName)
                    .padding(.horizontal, 18 )
                    .tint(.accent)
                
                
                Divider()
                Button {
                    
                    if let newName = names.randomElement() {
                        pickedName = newName;
                        if shouldRemovePickedName {
                            names.removeAll {
                                name in name == newName
                            }
                        }
                    }
                    else{
                        pickedName = "";
                    }
                    
                } label: {
                    Text("Pick Random Name")
                        .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .font(.title2.lowercaseSmallCaps())
                
            }
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
