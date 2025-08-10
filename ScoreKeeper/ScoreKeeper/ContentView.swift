//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by YUVRAJ SINGH  on 05/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var maxPoints: Int = 40;
    @State private var startingPoints: Int = 0;
    @State private var scoreboard = Scoreboard();
    
    var body: some View {
        
        VStack {
            
            
            // label
            Text("Score Keeper")
                .font(.largeTitle.lowercaseSmallCaps())
                .bold()
                .padding(.top, 10)
            
            if(scoreboard.state == .setup){
                SettingsView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $startingPoints, maxPoints: $maxPoints)
            }
            
            
            VStack (alignment: .leading){
                
                // grid
                Grid {
                    
                    GridRow {
                        Text("Player")
                            .gridColumnAlignment(.leading)
                        Text("Score")
                    }
                    .font(.headline)
                    
                    
                    ForEach($scoreboard.players) {
                        $player in
                        
                        GridRow {
                            
                            HStack {
                                
                                if(scoreboard.winners.contains(player)){
                                    Image(systemName: "crown.fill")
                                        .foregroundStyle(.yellow)
                                }
                                
                                TextField("Name" , text: $player.name)
                                
                            }
                            Text("\(player.score)");
                            Stepper("\(player.score)", value: $player.score, in: 0...maxPoints) { _ in
                                
                                if(player.score == maxPoints){
                                    
                                    if(scoreboard.state == .playing){
                                        scoreboard.state = .gameOver
                                    }
                                    
                                }
                                                                
                            }.labelsHidden()
                                
                        }
                    }
                }
                .padding(.vertical, 2)
                
                
                // buttons
                
                if(scoreboard.state == .setup){
                    HStack {
                        Button("Add Players", systemImage: "plus") {
                                scoreboard.players.append(Player(name: "", score: 0));
                            }
                            
                        
                        
                        Spacer();
                        
                        Button("Remove Players", systemImage: "minus") {
                            if(scoreboard.players.count > 1){
                                scoreboard.players.removeLast();
                            }
                        }
                    }
                }
                
                
                Spacer();
                
                HStack {
                    Spacer();
                    switch scoreboard.state {
                        
                    case .setup:
                        Button("Start Game", systemImage: "play.fill") {
                            scoreboard.state = .playing
                            scoreboard.resetScores(to: startingPoints)
                        }
                    case .playing:
                        Button("Stop Game", systemImage: "stop") {
                            scoreboard.state = .gameOver
                        }
                    case .gameOver:
                        Button("Reset Game", systemImage: "arrow.counterclockwise") {
                            scoreboard.state = .setup
                            scoreboard.resetScores(to: startingPoints)
                        }
                    }
                    
                    Spacer();
                }
                
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .tint(.blue)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
