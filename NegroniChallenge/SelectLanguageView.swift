import SwiftUI

struct SelectLanguageView: View {
    let languages = [
        ("italy", "Italian"),
        ("spain", "Spanish"),
        ("france", "French"),
        ("germany", "German")]
    /*        ("china", "Chinese"),
     ("india", "Hindi"),
     ("arabia", "Arabic"),
     ("japan", "Japanese"),
     ("mexico", "Spanish (Mexico)"),
     ("iran", "Persian")
     ]*/
    
    @State private var selectedLanguage: String? = nil
    @State private var isPressed = false
    @State private var showNextView = false
    @State private var revealProgress: CGFloat = 0
    @EnvironmentObject private var progressTracker: ProgressTracker
    
    var body: some View {
        VStack {
            HStack {
                ZStack{
                    SpeechBubble(cornerRadius: 20, isBottom: false, pointLocation: 30)
                        .fill(Color.white.opacity(0.7))
                        .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                    Text("What do you want to learn?")
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
            .padding(.bottom, 20)
            
            Spacer()
            
            List {
                ForEach(languages, id: \.0) { (imageName, language) in
                    let isSelected = selectedLanguage == language
                    
                    HStack {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 46)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(isSelected ? Color.blue : Color.brown.opacity(0.5), lineWidth: isSelected ? 4 : 2)
                            )
                        
                        Text(language)
                            .font(.custom("SourGummy-Medium", size: 24))
                            .textCase(.uppercase)
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                            .font(.headline)
                            .foregroundColor(isSelected ? .blue : .brown)
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                    .padding(.vertical, 5)
                    .onTapGesture {
                        selectedLanguage = isSelected ? nil : language
                        progressTracker.selectedLanguage = language
                    }
                }
            }
            .background(Color.clear)
            .listStyle(PlainListStyle())
            Spacer()
            Divider()
            // Confirm Button
            Button(action: {
                if selectedLanguage != nil {
                    isPressed.toggle()
                    showNextView = true
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(selectedLanguage == nil ? Color(red: 0.40, green: 0.40, blue: 0.40) : Color(red: 0.33, green: 0.30, blue: 0.25))
                        .frame(width: .infinity, height: 50)
                        .padding(.horizontal, 2)
                        .offset(y: isPressed ? 3 : 3) // Move up when pressed
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(selectedLanguage == nil ? Color.gray : Color.brown)
                        .frame(width: .infinity, height: 50)
                        .padding(.horizontal, 2)
                        .offset(y: isPressed ? 3 : 0) // Move down when pressed
                    
                    
                    Text("CONFIRM")
                        .font(.custom("SourGummy-Medium", size: 24))
                        .textCase(.uppercase)
                        .foregroundColor(selectedLanguage == nil ? Color(red: 0.75, green: 0.75, blue: 0.75) : .customBrown)
                        .padding()
                        .offset(y: isPressed ? 5 : 0)
                }
                
            }
            .disabled(selectedLanguage == nil)
            .padding(.horizontal, 18)
            .padding(.bottom, 50)
            .frame(maxWidth: .infinity)
        }
        .background(.customBrown)
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showNextView) {
            SettingView()
        }
    }
}

#Preview {
    SelectLanguageView().environmentObject(ProgressTracker())

}


