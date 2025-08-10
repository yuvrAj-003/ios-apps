import SwiftUI


struct SettingsView: View {
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoints: Int
    @Binding var maxPoints: Int


    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            Divider()
            
            Picker("Win condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins").tag(true)
                Text("Lowest Score Wins").tag(false)
                
            }
            
            
            Picker("Starting points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
            
            Picker("Max Points", selection: $maxPoints) {
                Text("40 max points")
                    .tag(40)
                Text("80 max points")
                    .tag(80)
                Text("100 max points")
                    .tag(100)
            }
            
        }
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 30))
        .padding();
    }
}

#Preview {
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startingPoints = 10
    @Previewable @State var maxPoints = 40
    SettingsView(doesHighestScoreWin: $doesHighestScoreWin, startingPoints: $startingPoints, maxPoints: $maxPoints)
}
