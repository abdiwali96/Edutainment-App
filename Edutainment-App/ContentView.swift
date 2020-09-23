//
//  ContentView.swift
//  Edutainment-App
//
//  Created by Abdiwali Abdi on 23/09/2020.
//

import SwiftUI



struct ContentView: View {
    
    @State private var stageSelection : Int = 0
    @State private var ranNum = 0
    @State private var tryAnswer = ""
    @State private var correctAnswer = 0
    @State private var score = 0
      
    var body: some View {
        NavigationView{
            Form {
                HStack {
                    VStack{
                        Stepper("\(stageSelection) Multiplication Table",
                                value: $stageSelection, in: 1...12)
                        
                        Button(action:{
                            //action
                            ButtonClicked()
                            QuestionMake()
                        }) {
                            Text("PLAY")
                            Text("\(correctAnswer)")
                        }
                    }
                }
                
                //This section is question
                Section {
                    VStack{
                        Text("SECTION")
                        Text("\(stageSelection) X \(ranNum)  ?")
                    }
                }
                Section {
                    TextField("ENTER ANSWER: ", text: $tryAnswer, onCommit: AnswerChecker)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                        .keyboardType(.decimalPad)
                }
                Section {
                    Text("SCORE: \(score)")
                }
            }
            .navigationTitle("Edutainment")
        }
            
    }
    func ButtonClicked() {
    ranNum = Int.random(in: 1 ... 5)
    }
    
    func QuestionMake(){
        correctAnswer = stageSelection * ranNum
    }
    
    
    
    
    
    func AnswerChecker() {
        var rn = Int(tryAnswer)
        
        if rn == correctAnswer {
            score += 1
        }else {
            ButtonClicked()
        }
        
    }
    
}


struct GameSettings: View {
    
    @Binding var stageSelection : Int
    @Binding var ranNum : Int
    @Binding private var tryAnswer : String
    @Binding private var correctAnswer : Int
    
    var body: some View {
        Text("TESTING VIEW")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
