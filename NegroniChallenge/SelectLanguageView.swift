import SwiftUI

struct SelectLanguageView: View {
    let languages = [
        ("italy", "Italian"),
        ("spain", "Spanish"),
        ("france", "French"),
        ("germany", "German"),
        ("china", "Chinese"),
        ("india", "Hindi"),
        ("arabia", "Arabic"),
        ("japan", "Japanese"),
        ("mexico", "Spanish (Mexico)"),
        ("iran", "Persian")
    ]
    
    @State private var selectedLanguage: String? = nil
    @State private var isPressed = false
    @State private var showNextView = false
    @State private var showTopBorder = false

    var body: some View {
        VStack {
            // Top HStack
            HStack {
                ZStack{
                    SpeechBubble(cornerRadius: 20, isBottom: false, pointLocation: 30)
                        .fill(Color.brown.opacity(0.1))
                        .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                    Text("What do you want to learn?")
                        .font(.system(size: 20)).bold()
                        .foregroundStyle(.brown)
                        .padding()
                }.frame(width: 250, height: 100).padding(.leading, 15)
                
                Image("Camarita")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.horizontal, 10)
            }
            .padding(.top, 80)
            
            Spacer()
            
            // Scrollable List with scroll detection
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
                            .font(.system(size: 18))
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
                    }
                }
                .onAppear {
                    // Show the top border when scrolling starts
                    withAnimation {
                        showTopBorder = true
                    }
                }
                .onDisappear {
                    // Hide the top border when scrolling stops
                    withAnimation {
                        showTopBorder = false
                    }
                }
            }
            .background(Color.clear)
            .listStyle(PlainListStyle())
            
            
            Spacer()
            
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
                        .font(.system(size: 18))
                        .foregroundColor(selectedLanguage == nil ? Color(red: 0.75, green: 0.75, blue: 0.75) : Color(red: 0.91, green: 0.87, blue: 0.8))
                        .padding()
                        .offset(y: isPressed ? 5 : 0)
                }
                
            }
            .disabled(selectedLanguage == nil)
            .padding(.horizontal, 18)
            .padding(.bottom, 50)
            .frame(maxWidth: .infinity)
        }
        .background(Color(red: 0.91, green: 0.87, blue: 0.8))
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showNextView) {
            SettingView()
                .presentationDetents([])
        }
    }
}

#Preview {
    SelectLanguageView()
}


