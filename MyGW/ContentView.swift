//
//  ContentView.swift
//  MyGW
//
//  Created by Neo Frank on 2026/5/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentIndex = 0
    let memories = [
        Memory(imageName: "image1", description: "公園で子どもたちが砂遊びをしています"),
        Memory(imageName: "image2", description: "公園で子どもたちがブランコをしています"),
        Memory(imageName: "image3", description: "公園で子どもたちが木馬に乗っています")]
    var body: some View {
        
        VStack{
            Spacer()
            Text("私のゴールデンウィーク")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            
            Image(memories[currentIndex].imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 500)
            
            Text(memories[currentIndex].description)
                .font(.headline)
                .padding()
            
            VStack{
        
            
        }
        
            HStack{
                Button {
                    if currentIndex > 0 {
                        currentIndex -= 1
                    }
                    
                }label: {
                    Text("前の思い出へ")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
                Button {
                    if currentIndex < memories.count - 1 {
                        currentIndex += 1
                    }
                    
                }label: {
                    Text("次の思い出へ")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}
struct Memory {
    let imageName: String
    let description: String
}
#Preview {
    ContentView()
}
