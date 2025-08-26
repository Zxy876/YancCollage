//
//  BorrowingView.swift
//  YancCollage
//
//  Created by zxy的电脑 on 2025/8/26.
//


// BorrowingView.swift
import SwiftUI

struct BorrowingView: View {
    @EnvironmentObject var viewModel: GameViewModel
    let dialogue: String
    
    var body: some View {
        VStack(spacing: 20) {
            // 显示小妍的请求
            VStack {
                Text("小妍说：")
                    .font(.headline)
                Text(dialogue)
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding()
            
            // 物品选择网格
            Text("选择借出的物品：")
                .font(.headline)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                ForEach(viewModel.inventory, id: \.self) { item in
                    Button(action: {
                        viewModel.didSelectItem(item)
                    }) {
                        VStack {
                            Text(emojiForItem(item))
                                .font(.system(size: 40))
                            Text(item)
                                .font(.caption)
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(15)
                    }
                }
            }
            .padding()
        }
    }
    
    // 为物品返回对应的Emoji
    private func emojiForItem(_ item: String) -> String {
        let emojiMap: [String: String] = [
            "胶水": "🧴",
            "彩纸": "🎨", 
            "旧邮票": "📨",
            "糖纸": "🍬"
        ]
        return emojiMap[item] ?? "📦"
    }
}