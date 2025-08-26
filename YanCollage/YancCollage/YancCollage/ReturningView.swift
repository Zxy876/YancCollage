//
//  ReturningView.swift
//  YancCollage
//
//  Created by zxy的电脑 on 2025/8/26.
//


// ReturningView.swift
import SwiftUI

struct ReturningView: View {
    let artwork: Artwork
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Text("小妍归还了作品")
                .font(.title)
                .foregroundColor(.green)
            
            // 拼贴画展示区域
            VStack {
                Text(artwork.title)
                    .font(.headline)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.gray.opacity(0.2))
                    
                    Text(emojiCollage())
                        .font(.system(size: 60))
                }
                
                Text(artwork.description)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            // 继续按钮
            Button("继续经营") {
                viewModel.completeReturn()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
    
    // 用Emoji组合代表拼贴画
    private func emojiCollage() -> String {
        let emojis = ["🎨", "✂️", "📎", "🧵", "📄"]
        return emojis.randomElement()! + emojis.randomElement()!
    }
}