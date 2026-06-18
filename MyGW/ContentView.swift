//
//  ContentView.swift
//  MyGW
//
//  Created by Neo Frank on 2026/5/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentIndex = 0
    @State var slideFromRight = true
    @State var isZoomed = false
    let memories = [
        Memory(imageName: "image1", description: "公園で子どもたちが砂遊びをしています"),
        Memory(imageName: "image2", description: "公園で子どもたちがブランコをしています"),
        Memory(imageName: "image3", description: "公園で子どもたちが木馬に乗っています")]
    var body: some View {
        
        VStack{
            Text("26cm0121 陳炳晟")
                               .font(.subheadline)
                               .foregroundStyle(.black.opacity(0.8))
                               .padding(.top, 12)
                               .padding(.leading, 16)
                               .frame(maxWidth: .infinity,  alignment: .topLeading)
            Spacer()
            Text("私のゴールデンウィーク")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            
            Image(memories[currentIndex].imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 500)
                .cornerRadius(20)
                .shadow(radius: 10)
                .id(currentIndex)
                .transition(
                    .asymmetric(
                        insertion: .move(edge: slideFromRight ? .trailing : .leading),
                        removal: .move(edge: slideFromRight ? .leading : .trailing)
                    )
                )
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width < -50 && currentIndex < memories.count - 1 {
                                slideFromRight = true
                                withAnimation(.easeInOut) {
                                    currentIndex += 1
                                }
                            } else if value.translation.width > 50 && currentIndex > 0 {
                                slideFromRight = false
                                withAnimation(.easeInOut) {
                                    currentIndex -= 1
                                }
                            }
                        }
                )
            
            VStack(spacing: 12) {
                Text("\(currentIndex + 1) / \(memories.count)")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(.secondary)

                Text(memories[currentIndex].description)
                    .font(.system(size: 21, weight: .medium))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 16)
            }
            .padding(.top, 8)
            .padding(.bottom, 14)
        
            HStack(spacing: 16) {
                Button {
                    if currentIndex > 0 {
                        slideFromRight = false
                        isZoomed = false
                        withAnimation(.easeInOut) {
                            currentIndex -= 1
                        }
                    }
                    
                }label: {
                    Text("前の思い出へ")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 150, height: 48)
                        .background(currentIndex == 0 ? .gray : .blue)
                        .cornerRadius(14)
                }
                .disabled(currentIndex == 0)
                Button {
                    if currentIndex < memories.count - 1 {
                        slideFromRight = true
                        isZoomed = false
                        withAnimation(.easeInOut) {
                            currentIndex += 1
                        }
                    }
                    
                }label: {
                    Text("次の思い出へ")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 150, height: 48)
                        .background(currentIndex == memories.count - 1 ? .gray : .blue)
                        .cornerRadius(14)
                }
                .disabled(currentIndex == memories.count - 1)
                
            }
            .padding(.bottom, 24)
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
