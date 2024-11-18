import SwiftUI

struct SettingView: View {
    let settings = ["Kitchen", "Bedroom", "Bathroom", "Classroom"]
    @EnvironmentObject private var progressTracker: ProgressTracker
    @State private var revealProgress: CGFloat = 0
    let emojis: [String: String] = [
        "Kitchen": "🍳",
        "Bedroom": "🛏️",
        "Bathroom": "🚽",
        "Classroom": "📚"
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.customBrown)
                VStack {
                    HStack {
                        ZStack{
                            SpeechBubble(cornerRadius: 20, isBottom: false, pointLocation: 30)
                                .fill(Color.white.opacity(0.7))
                                .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                            Text("Where do you want to go?")
                                .font(.custom("SourGummy-Medium", size: 24))
                                .textCase(.uppercase)
                                .foregroundStyle(.brown)
                                .mask(
                                    Rectangle()
                                        .scaleEffect(x: revealProgress, y: 1, anchor: .leading)
                                )
                                .animation(.easeOut(duration: 0.5), value: revealProgress)
                                .onAppear {
                                    revealProgress = 1
                                }
                                .padding()
                        }.frame(width: 250, height: 100).padding(.leading, 15)
                        
                        Image("Camarita")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding(.horizontal, 10)
                    }
                    .padding(.top, 80)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                        ForEach(settings, id: \.self) { setting in
                            
                            NavigationLink(destination: CameraView(levelObjects: progressTracker.getCurrentObjectNames(for: setting)!, currentSetting: setting)) {
                                SettingCardView(setting: setting, emoji: emojis[setting] ?? "")
                                
                            }
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                        Spacer()
                    }
                    Spacer()
                }
            }.ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct SettingCardView: View {
    let setting: String
    @EnvironmentObject private var progressTracker: ProgressTracker
    let emoji: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                .fill(Color.black.opacity(0.05))
                .frame(height: 180)
            
            VStack {
                Text(setting)
                    .font(.custom("SourGummy-Medium", size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(.black.opacity(0.8))
                
                Text(emoji)
                    .font(.system(size: 50))
                    .padding(5)
                
                /*
                 HStack {
                 ForEach(0..<3) { _ in
                 Image(systemName: "star.fill")
                 .foregroundStyle(.yellow)
                 .font(.system(size: 20))
                 
                 }
                 }
                 */
                
                ZStack  {
                    ProgressView(value: progressTracker.getPercentage(for: setting)
                    )
                    .padding(.horizontal)
                    .tint(Color.brown)
                    .padding(.top, 10)
                    
                    
                    Circle()
                        .frame(width: 10)
                        .offset(x: -45,y:5)
                        .foregroundStyle(.brown)
                    
                    
                    Circle()
                        .frame(width: 10)
                        .offset(x: -15,y:5)
                        .foregroundStyle(.brown)
                    
                    Circle()
                        .frame(width: 10)
                        .offset(x: 15,y:5)
                        .foregroundStyle(.brown)
                    
                    Circle()
                        .frame(width: 10)
                        .offset(x: 45,y:5)
                        .foregroundStyle(.brown)
                    
                }
                
            }
        }
        .padding()
    }
}


#Preview {
    SettingView()
        .environmentObject(ProgressTracker())
}
