// GameState.swift
// 导入Foundation框架，包含基础数据类型
import Foundation

// 使用enum定义状态，就像C++的enum class，但case更像一个独立的类型
enum GameState {
    // 等待状态：小妍未出现
    case waiting
    // 对话状态：小妍入场对话
    case talking
    // 借出状态：需要玩家选择物品。关联一个字符串（小妍的对话）
    case borrowing(dialogue: String)
    // 归还状态：展示拼贴画。关联一个自定义的Artwork类型
    case returning(artwork: Artwork)
}

// 一个简单的数据模型，代表拼贴画作品（相当于C++的struct）
struct Artwork {
    let imageName: String // 图片资源名称
    let title: String     // 作品标题
    let description: String // 作品描述
}
