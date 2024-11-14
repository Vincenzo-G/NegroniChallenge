import SwiftUI

struct SettingView: View {
    let settings = ["Kitchen", "Bedroom", "Bathroom", "Classroom"]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ZStack{
                        SpeechBubble(cornerRadius: 20, isBottom: false, pointLocation: 30)
                            .fill(Color.brown.opacity(0.1))
                            .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                        Text("Where do you want to go?")
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
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                    ForEach(settings, id: \.self) { setting in
                        
                        NavigationLink(destination: CameraView()) {
                            SettingCardView(setting: setting)
                        }
                        
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                Spacer()
            }
            .background(Color(red: 0.91, green: 0.87, blue: 0.8))
            .ignoresSafeArea()
            
        }.navigationBarBackButtonHidden(true)
    }
}


struct SettingCardView: View {
    let setting: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                .frame(height: 140)
            
            VStack {
                Text(setting)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                HStack {
                    ForEach(0..<3) { _ in
                        Image(systemName: "star")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.yellow.opacity(1))
                            .font(.system(size: 20))
                        
                    }
                }
                .padding(.top, 10)
            }
        }
        .padding()
    }
}

#Preview {
    SettingView()
}
