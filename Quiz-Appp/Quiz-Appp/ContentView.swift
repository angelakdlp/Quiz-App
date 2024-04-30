import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("Image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Title
                    Text("Steven Universe")
                        .font(.custom("Georgia", size: 40))
                        .padding()
                        .foregroundColor(.white)
                        .offset(y:-150)
                        .fontWeight(.bold)
                    // Subtitle
                    Text("Quiz!!")
                        .font(.custom("Georgia", size: 40))
                        .padding()
                        .foregroundColor(.white)
                        .offset(y:-175)
                        .fontWeight(.bold)

                    
                    NavigationLink(destination: QuizView(questions: quizQuestions)) {
                        // Begin Button
                        Text("Begin")
                            .font(.custom("Georgia", size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 250)
                            .background(Color(red: 229/255, green: 162/255, blue: 180/255))
                            .cornerRadius(15)
                            .padding()
                            .offset(y: 50)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
