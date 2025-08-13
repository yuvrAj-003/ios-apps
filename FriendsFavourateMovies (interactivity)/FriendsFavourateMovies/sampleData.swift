//
//  sampleData.swift
//  FriendsFavourateMovies
//
//  Created by YUVRAJ SINGH  on 11/08/25.
//

import Foundation

import SwiftData

@MainActor
class SampleData {
    
    static let shared = SampleData();
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var friend: Friend {
        Friend.sampleData.first!;
    }
    
    var movie: Movie {
        Movie.sampleData.first!
    }
    
    init() {
        let schema = Schema([
            Friend.self,
            Movie.self
        ])
        
        
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true);
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
            try context.save()
        }
        catch {
            fatalError("Couldn't create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        for movie in Movie.sampleData {
            context.insert(movie)
        }
    }
    
    
    
}
