// WaitingView.swift
import SwiftUI

struct WaitingView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            // 1. 背景 - 营造小卖部氛围
            Color(.systemBrown).opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // 2. 标题 - 设置场景
                Text("阿哲的小卖部")
                    .font(.largeTitle)
                    .foregroundColor(.brown)
                
                // 3. 进度显示 - 让玩家看到成长
                VStack {
                    Text("对小妍的理解")
                        .font(.headline)
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 200, height: 20)
                            .foregroundColor(.gray.opacity(0.3))
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: CGFloat(viewModel.understanding) / 3 * 200,
                                   height: 20)
                            .foregroundColor(.blue)
                    }
                    Text("\(viewModel.understanding)/3")
                }
                
                // 4. 核心交互按钮 - 明确的视觉引导
                Button(action: {
                    withAnimation(.spring(response: 0.3)) {
                        viewModel.cleanShelf()
                    }
                }) {
                    VStack {
                        Image(systemName: "sparkles") // 系统图标
                            .font(.largeTitle)
                        Text("清理货架")
                            .font(.title2)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                }
                
                // 5. 环境装饰 - 增加沉浸感
                Text("货架上似乎有些灰尘...")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}//
//   WaitingView.swift
//  YancCollage
//
//  Created by zxy的电脑 on 2025/8/26.
//

