//
//  ContentView.swift
//  Edutainment-App
//
//  Created by Abdiwali Abdi on 23/09/2020.
//

import SwiftUI


struct GameSettings: View {
    var body: some View {
        Text("TESTING VIEW")
    }
}


struct ContentView: View {
    
    @State private var stageSelection : Int = 0
    @State private var ranNum = 0
    
    @State private var correctAnswer = 0
      
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
                    Text("ANSWER")
                }
                Section {
                    Text("SCORE")
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
        
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
