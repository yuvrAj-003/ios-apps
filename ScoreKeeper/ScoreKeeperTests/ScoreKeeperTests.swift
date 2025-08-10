//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by YUVRAJ SINGH  on 05/08/25.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {

    @Test("Reset player score")
    func resetScores() async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 5),
        ])
        scoreboard.resetScores(to: 0)
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        
        for player in scoreboard.players {
            #expect(player.score == 0);
        }
        
    }
    
    
    @Test("Highest score wins")
        func highestScoreWins() {
            let scoreboard = Scoreboard(
                players: [
                    Player(name: "Elisha", score: 0),
                    Player(name: "Andre", score: 4),
                ],
                state: .gameOver,
                doesHighestScoreWin: true
            )
            let winners = scoreboard.winners
            #expect(winners == [Player(name: "Andre", score: 4)])
        }
    
    @Test("Lowest score wins")
        func lowestScoreWins() {
            let scoreboard = Scoreboard(
                players: [
                    Player(name: "Elisha", score: 0),
                    Player(name: "Andre", score: 4),
                ],
                state: .gameOver,
                doesHighestScoreWin: false
            )
            let winners = scoreboard.winners
            #expect(winners == [Player(name: "Elisha", score: 0)])
        }

}
