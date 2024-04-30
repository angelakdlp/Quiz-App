import SwiftUI

struct QuizView: View {
    let questions: [Question]
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var quizCompleted = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("Image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack (spacing: 30) {
                    // Display current question number
                    Text("Question \(currentQuestionIndex + 1) of \(questions.count)")
                        .padding()
                        .font(.custom("Georgia", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    // Display current question
                    Text(questions[currentQuestionIndex].question)
                        .padding(.horizontal)
                        .font(.custom("Georgia", size: 25))
                        .foregroundColor(.white)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: 375)
                    Spacer()
                    // Display options as buttons
                    ForEach(0..<questions[currentQuestionIndex].options.count) { index in
                        Button(action: {
                            self.checkAnswer(selectedOption: self.questions[self.currentQuestionIndex].options[index])
                        }) {
                            Text(self.questions[self.currentQuestionIndex].options[index])
                                .padding()
                                .font(.custom("Georgia", size: 25))
                                .frame(maxWidth: 300)
                                .background(Color(red: 229/255, green: 162/255, blue: 180/255))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .padding(.horizontal)
                        }
                        .offset(y: 100)
                    }
                    Spacer()
                    // Display current score
                    Text("Score: \(score)")
                        .padding()
                        .font(.custom("Georgia", size: 20))
                        .foregroundColor(.white)
                        .offset(y: 20)
                    
                    NavigationLink(destination: ResultView(score: score, totalQuestions: questions.count), isActive: $quizCompleted) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func checkAnswer(selectedOption: String) {
        // Check if the selected option is correct
        if selectedOption == questions[currentQuestionIndex].correctAnswer {
            score += 1
        }
        goToNextQuestion()
    }
    
    private func goToNextQuestion() {
        // Move to the next question or show result if all questions are answered
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            quizCompleted = true
        }
    }
}
