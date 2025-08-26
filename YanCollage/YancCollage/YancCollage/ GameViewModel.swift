// GameViewModel.swift
// 导入SwiftUI框架，包含ObservableObject等
import SwiftUI

// 声明这个类为可观察对象（类似响应式的核心），当它的@Published属性改变时，会通知UI更新
class GameViewModel: ObservableObject {
    
    // @Published 是SwiftUI特有的装饰器
    // 相当于：当这个值改变时，自动通知所有观察它的UI刷新
    // 类似C++中，你手动发出一个信号，但这里是自动的
    @Published var currentState: GameState = .waiting
    @Published var understanding: Int = 0
    
    // 常量定义，状态转换的阈值
    let understandingThreshold: Int = 3
    
    // 库存物品数组
    var inventory: [String] = ["胶水", "彩纸", "旧邮票", "糖纸"]
    
    // MARK: - 状态转换方法 (Public Interface)
    // 这些方法相当于类的公共成员函数，供UI调用
    
    // 行为：清理货架
    func cleanShelf() {
        // 1. 使用guard进行状态守卫，确保只在.waiting状态下执行
        // 相当于 if (currentState != GameState::Waiting) return;
        guard case .waiting = currentState else { return }
        
        // 2. 执行逻辑：随机增加理解度
        understanding += Int.random(in: 1...2) // 随机加1或2分
        print("清理货架！当前理解度: \(understanding)")
        
        // 3. 检查状态转换条件
        if understanding >= understandingThreshold {
            // 转换到对话状态
            currentState = .talking
            print("状态切换: waiting -> talking")
        }
    }
    
    // 行为：开始对话（通常由动画或计时器触发）
    func startDialogue() {
        // 确保当前在对话状态
        if case .talking = currentState {
            // 转换到借出状态，并携带一句对话
            currentState = .borrowing(dialogue: "今天...我想做点关于回忆的东西...")
            print("状态切换: talking -> borrowing")
        }
    }
    
    // 行为：玩家选择了一个物品
    func didSelectItem(_ item: String) {
        // 使用guard确保在借出状态，并提取出关联的对话
        
        guard case .borrowing(let dialogue) = currentState else { return }
        
        print("借出了物品: \(item) (小妍说: \(dialogue))")
        
        // 模拟根据物品生成拼贴画
        let newArtwork = Artwork(
            imageName: "collage_\(item)",
            title: "关于\(item)的记忆",
            description: "这是用小卖部的\(item)创作的拼贴画，充满了温暖的感觉。"
        )
        
        // 增加理解度
        understanding += 2
        
        // 转换到归还状态，并携带拼贴画数据
        currentState = .returning(artwork: newArtwork)
        print("状态切换: borrowing -> returning")
    }
    
    // 行为：完成归还，回到等待状态
    func completeReturn() {
        guard case .returning = currentState else { return }
        currentState = .waiting
        print("状态切换: returning -> waiting")
        print("--- 一个循环结束，等待下一次交互 ---\n")
    }
}
