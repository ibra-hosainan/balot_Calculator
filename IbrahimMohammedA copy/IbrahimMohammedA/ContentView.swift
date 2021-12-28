//
//  ContentView.swift
//  IbrahimMohammedA
//
//  Created by Abrahim MOHAMMED on 04/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State var timeRemaining = 0
      let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   
    @State var show = false
    
    @State var showAlert = false
  
    @State var deleteAleart = false
    @State var updateAleart = false
   
    @State var message = ""
    
   
    
    
    
    
    // The stract in othear file
    @State var snabchutValue : [snabchut] = [snabchut(input: 0, prevsRsult: 0, result: 0)]
  
    
    // The stract two in othear file
    @State var snabchutValue2 : [snabchut2] = [
        snabchut2(input2: 0, prevsRsult2: 0, result2: 0)
        
    ]
   
    @State var update : [Int] = []
    
   
    
    
    @State var TextFieldlLift = ""
       
    @State var TextFieldlRight = ""
  
    
    @State var counter = 0
    @State var counter2 = 0
    
    @State var isFirst: Bool = false
    @State var isFirst2: Bool = false
    
    @State var isReturned : Bool = false
    
    
    
    @State var time = 0
    
    @State var minutes = 0

    
    
    var body: some View {
        
ZStack(alignment: .bottomTrailing){
            VStack{
                VStack{
                Rectangle()
                    .frame(width: 300, height: 50)
                    
                        Rectangle()
                            .frame(width: 100, height: 50)
                            .foregroundColor(.blue)
                            .overlay(
                                VStack{
                                    Text("\(minutes): \(timeRemaining)")
                                                .onReceive(timer) { _ in
                                                    if timeRemaining >= 0 {
                                                        timeRemaining += 1
                                                        if timeRemaining == 60{
                                                            minutes+=1
                                                            timeRemaining = 0
                                                        
                                                        }
                                                    }
                                                }
                                    
                                }
                                
                            )
                        
                HStack{
                    VStack{
                        Text("لنا")
                        TextField("لنا", text: $TextFieldlLift)
                            .multilineTextAlignment(.center)
                    }
                    
                    Button {
                    
                     
                        if TextFieldlLift != "" {
                            if (counter==0){
     
                                  snabchutValue[counter].input = Int(TextFieldlLift) ?? 0
                                snabchutValue[counter].result = 0 + snabchutValue[counter].input
                                TextFieldlLift = ""

                                counter+=1
                                isFirst = true
                         } else {
                                
                                snabchutValue.append(snabchut(input:Int(TextFieldlLift) ?? 0 , prevsRsult: snabchutValue[counter-1].result, result: 0))
                                
                              snabchutValue[counter].result = snabchutValue[counter].prevsRsult + snabchutValue[counter].input
                                TextFieldlLift = ""
                                counter+=1
                                isFirst = false
                                
                                
                            }
                            
                            print(snabchutValue.count ,  " : " , counter)
                            
                            
                        }
                        else {

                            if (counter==0){
                                snabchutValue[counter].input =  0
                                snabchutValue[counter].result = 0
                                TextFieldlLift = ""
                                counter+=1
                                isFirst = true
                            }else{
                                snabchutValue.append(snabchut(input:Int(0) , prevsRsult: snabchutValue[counter-1].result, result: 0))

                                snabchutValue[counter].result = snabchutValue[counter].prevsRsult + snabchutValue[counter].input
                                TextFieldlLift = ""
                                counter+=1
                                isFirst = false


                            }
                        }
                        snabchutValue.forEach { snabchut in
                            print(snabchut.input , " : " , snabchut.prevsRsult," : " , snabchut.result  )
                        }
                        

                        gg()
//                        if TextFieldlRight != "" {
//                            if (counter2==0){
//                                snabchutValue2[counter2].input2 = Int(TextFieldlRight) ?? 0
//                                snabchutValue2[counter2].result2 = 0 + snabchutValue2[counter2].input2
//                                TextFieldlRight = ""
//                                counter2+=1
//                                isFirst2 = true
//                            }else{
//                                snabchutValue2.append(snabchut2(input2:Int(TextFieldlRight) ?? 0 , prevsRsult2: snabchutValue2[counter2-1].result2, result2: 0)  )
//
//                                snabchutValue2[counter2].result2 = snabchutValue2[counter2].prevsRsult2 + snabchutValue2[counter2].input2
//                                TextFieldlRight = ""
//                                counter2+=1
//                                isFirst2 = false
//                            }
//
//                        }else {
//
//                            if (counter2==0){
//                                snabchutValue2[counter2].input2 =  0
//                                snabchutValue2[counter2].result2 = 0
//                                TextFieldlRight = ""
//                                counter2+=1
//                                isFirst2 = true
//                            }else{
//                                snabchutValue2.append(snabchut2(input2:Int(0)  , prevsRsult2: snabchutValue2[counter2-1].result2, result2: 0)  )
//
//                                snabchutValue2[counter2].result2 = snabchutValue2[counter2].prevsRsult2 + snabchutValue2[counter2].input2
//                                TextFieldlRight = ""
//                                counter2+=1
//                                isFirst2 = false
//                            }
//
//                        }
                        
                        
                    } label: {
                        Text("سجل")
                    }.alert(isPresented: $showAlert){
                        Alert(title: Text("Mabrook"), message: Text("You win the game"), dismissButton: .cancel())
                    }
                    
                    
                    
                    VStack{
                        
                        Text("لهم")
                        TextField("لهم", text: $TextFieldlRight)
                            .multilineTextAlignment(.center)
                            .padding(.trailing,10)
                        
                    }
                    
                }
                

                ZStack{

                    HStack{


                        List{

                            
                            ForEach(0..<snabchutValue.count, id : \.self){ i in


                                if i==0 && isFirst{
                                    

                                    if snabchutValue[i].input == 0 && isFirst   {
                                       Text("0")
                                        
                                    }else{

//                                        Text("\(snabchutValue[i].input)\n\(snabchutValue[i].prevsRsult)\n----\n\(snabchutValue[i].result)")

                                       Text("\(snabchutValue[i].input)")
                                        
                                    }

                                    
                                }else if  i>0 && isFirst==false   {
                                   
                                    if snabchutValue[i].input == 0    {
                                       
                                        Text("\(snabchutValue[i].input)\n\(snabchutValue[i].prevsRsult)\n----\n\(snabchutValue[i].result)")
                                        
                                    }
                                    else {
                                    
                                
                                        Text("\(snabchutValue[i].prevsRsult)\n\(snabchutValue[i].input) \n----\n\(snabchutValue[i].result)")
                                    }
                                    

                                }
                                
                                
                                else if snabchutValue[i].result == 152 {

                             
                                   Text("مبروك")
                                    
                               
                             // showAlert.toggle()
                                    
                                }
                                
                                
                                
                            }
                            
                            
                            
                         //
                            
                        }
                        
                        
                        Spacer()
                        
                        
                        List{
                            
                            
                            ForEach(0..<snabchutValue2.count, id : \.self){ i in
                              
                                if i==0 && isFirst2 {
                                    
                                    
                                    if snabchutValue2[i].input2 == 0 && isFirst2  {
                                      
                                    Text("0")
                                        
                                    }else{
                                        
                                       
                                        
                                      Text("\(snabchutValue2[i].input2)")
                                        
                                    }
                                    
                                }else if  i>0 && isFirst2==false {
                                    
                                    if snabchutValue2[i].input2 == 0 {
                                        Text("\(snabchutValue2[i].input2)\n\(snabchutValue2[i].prevsRsult2)\n----\n\(snabchutValue2[i].result2)")
                                        
                                    }
                                    else{
                                        
                                        Text("\(snabchutValue2[i].prevsRsult2)\n\(snabchutValue2[i].input2) \n----\n\(snabchutValue2[i].result2)")
                                    }
                                    
                                    
                                }
                                
                                else if snabchutValue2[i].result2 >= 152 {
                                    Text("mbrok ")
                                    
                                }
                                
                                
                            }
                            
                            
                        }
                        
                        
                    }
                    if show == true{
                        Rectangle()
                            .frame(width: 200, height: 150, alignment: .center)
                        //  .foregroundColor(.blue)
                            .overlay(
                                VStack{
                                    HStack{
                                        Button {
                                            show.toggle()
                                        } label: {
                                            Image(systemName: "x.circle")
                                        }
                                        Spacer()
                                    }
                                    //  Spacer()
                                    Button {
                                        deleteAleart.toggle()
//
                                      
                                        
                                    } label: {
                                        Text("لعبه جديده")
                                            .frame(width: 88, height: 20)
                                            .background(Color.gray)
                                    }.alert(isPresented: $deleteAleart){
                                        Alert(title: Text("Warninig"), message: Text("Sure?"), primaryButton: .cancel(), secondaryButton: .default(Text("Ok")){
                                            snabchutValue.removeAll()
                                            
                                           snabchutValue.append( snabchut(input: 0, prevsRsult: 0, result: 0))
                                           counter = 0
                                            isFirst = false
                                            
                                            
                                            snabchutValue2.removeAll()
                                            isFirst2 = false
                                            counter2 = 0
                                            snabchutValue2.append( snabchut2(input2: 0, prevsRsult2: 0, result2: 0))
                                           
                                            show = false
                                        })
                                    }
                                    Button {
//
                                        
                                   

                                        updateAleart.toggle()

                                      
                                      
                                        
                                    } label: {
                                        Text("تراجع")
                                            .frame(width: 88, height: 20)
                                            .background(Color.gray)
                                      
                                    }.alert(isPresented: $updateAleart){
                                        Alert(title: Text(""), message: Text("هل تريد التراجع؟"), primaryButton: .cancel(), secondaryButton: .default(Text("Ok")){
                                             
                                            
                                            
                                            
                                            if snabchutValue.count == 2 {
                                                
                                                print("1 reming")
                                                
                                                print("count \(snabchutValue.count)")
                                                var temp  =  snabchutValue[1]
                                                temp.input = 0
                                                temp.result = temp.prevsRsult
                                                
                                                snabchutValue.removeLast()
                                                
                                                print(temp)
                                                
                                                snabchutValue.append(temp)
//                                                counter=1
                                                isFirst = true
                                                isReturned = true
                                                print(counter)
                                                print("count \(snabchutValue.count)")
                                                
                                                
                                            }else{
                                                snabchutValue.removeLast()
                                            counter-=1

//                                                snabchutValue2.removeLast()
                                            }
                                         

                                            
                                            
                                            
                                            
                                            
                                            if snabchutValue2.count == 2 {
                                                
                                                print("1 reming")
                                                
                                                print("count \(snabchutValue2.count)")
                                                var temp  =  snabchutValue2[1]
                                                temp.input2 = 0
                                                temp.result2 = temp.prevsRsult2
                                                
                                                snabchutValue2.removeLast()
                                                
                                                print(temp)
                                                
                                                snabchutValue2.append(temp)
//                                                counter=1
                                                isFirst2 = true
                                                isReturned = true
                                                print(counter)
                                                print("count \(snabchutValue2.count)")
                                                
                                                
                                            }else{
                                                snabchutValue2.removeLast()
                                            counter2-=1

//                                                snabchutValue2.removeLast()
                                            }
                                         
                                            
                                            
                                            
                                            
                                            
                                            
                                            
//

                                          
                                            
                                        })
                                    }
                                    Spacer()
                                }
                            )
                    }
                    
                    
                }
                    
            }
                
                
           
            
        }
            Button {
                show.toggle()
            } label: {
                Image(systemName: "gear")
            }
    
    }
}


    func gg(){
        if TextFieldlRight != "" {
            if (counter2==0){
                snabchutValue2[counter2].input2 = Int(TextFieldlRight) ?? 0
                snabchutValue2[counter2].result2 = 0 + snabchutValue2[counter2].input2
                TextFieldlRight = ""
                counter2+=1
                isFirst2 = true
            }else{
                snabchutValue2.append(snabchut2(input2:Int(TextFieldlRight) ?? 0 , prevsRsult2: snabchutValue2[counter2-1].result2, result2: 0)  )

                snabchutValue2[counter2].result2 = snabchutValue2[counter2].prevsRsult2 + snabchutValue2[counter2].input2
                TextFieldlRight = ""
                counter2+=1
                isFirst2 = false
            }

        }else {

            if (counter2==0){
                snabchutValue2[counter2].input2 =  0
                snabchutValue2[counter2].result2 = 0
                TextFieldlRight = ""
                counter2+=1
                isFirst2 = true
            }else{
                snabchutValue2.append(snabchut2(input2:Int(0)  , prevsRsult2: snabchutValue2[counter2-1].result2, result2: 0)  )

                snabchutValue2[counter2].result2 = snabchutValue2[counter2].prevsRsult2 + snabchutValue2[counter2].input2
                TextFieldlRight = ""
                counter2+=1
                isFirst2 = false
            }
            
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
