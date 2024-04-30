import SwiftUI

struct ResultView: View {
    let score: Int
    let totalQuestions: Int
    
    var body: some View {
        ZStack {
            // Background Image
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Display result message based on score
                // Score is greater than or equal to
                if score >= 7 {
                    Text("Congrats! Your score is \(score)/\(totalQuestions)")
                        .padding()
                        .font(.custom("Georgia", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: 375)
                        .offset(y:75)
                    
                // Score is less than 7
                } else {
                    Text("Better luck next time! Your score is \(score)/\(totalQuestions)")
                        .padding()
                        .font(.custom("Georgia", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: 375)
                        .offset(y:75)
                }
                Spacer()
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(score: 7, totalQuestions: 10)
    }
}
