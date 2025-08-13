//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by YUVRAJ SINGH  on 10/08/25.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
