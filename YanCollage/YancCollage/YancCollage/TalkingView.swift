//
//  TalkingView.swift
//  YancCollage
//
//  Created by zxy的电脑 on 2025/8/26.
//


// TalkingView.swift
import SwiftUI

struct TalkingView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            // 半透明背景，聚焦对话
            Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // 角色标识（先用Emoji代替）
                Text("🧒")
                    .font(.system(size: 60))
                
                // 对话气泡
                VStack {
                    Text("小妍")
                        .font(.headline)
                        .foregroundColor(.purple)
                    Text("那个...请问...")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                
                // 继续按钮
                Button("听听她想说什么") {
                    withAnimation {
                        viewModel.startDialogue()
                    }
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .padding()
        }
    }
}