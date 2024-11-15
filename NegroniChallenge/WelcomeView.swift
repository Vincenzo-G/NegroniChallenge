import SwiftUI

struct WelcomeView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isPressed = false
    @State private var index = 0
    @State private var showNextView = false
    @State private var revealProgress: CGFloat = 0
    
    private let texts : [String] = ["Hi! I'm Camarito!","I'm your friend for this adventure!", "I'm your friend for this adventure!"]
    
    var body: some View {
        VStack {
            // Top HStack
            Spacer()
            
            VStack {
                ZStack {
                    SpeechBubble(cornerRadius: 20, isBottom: true, pointLocation: 80)
                        .fill(Color.white.opacity(0.7))
                        .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                    
                    Text(texts[index])
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
                }
                .frame(width: 280, height: 120)
                
                Image("Camarita")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170, height: 170)
                    .padding(.horizontal, 10)
            }
            .padding(.top, 80)
            .padding(.bottom, 20)
            
            Spacer()
            
            Divider()
            
            // Confirm Button
            Button(action: {
                        isPressed.toggle()
                        index += 1
                        isPressed.toggle()
                if(index == 2){
                    showNextView = true
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 0.40, green: 0.40, blue: 0.40))
                        .frame(width: .infinity, height: 50)
                        .padding(.horizontal, 2)
                        .offset(y: isPressed ? 3 : 3) // Move up when pressed
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.brown)
                        .frame(width: .infinity, height: 50)
                        .padding(.horizontal, 2)
                        .offset(y: isPressed ? 3 : 0) // Move down when pressed
                    
                    Text("CONTINUE")
                        .font(.custom("SourGummy-Medium", size: 24))
                        .textCase(.uppercase)
                        .foregroundColor(Color(.customBrown))
                        .padding()
                        .offset(y: isPressed ? 5 : 0)
                }
                
            }
            .padding(.horizontal, 18)
            .padding(.bottom, 50)
            .frame(maxWidth: .infinity)
        }
        .background((.customBrown))
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showNextView) {
            SelectLanguageView()
        }
    }
}

#Preview {
    WelcomeView().environmentObject(ProgressTracker())
}
