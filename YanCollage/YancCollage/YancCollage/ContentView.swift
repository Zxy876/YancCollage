// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        // 将environmentObject应用到容器上，所有子视图都能自动获取
        ZStack {
            switch viewModel.currentState {
            case .waiting:
                WaitingView()
            case .talking:
                TalkingView()
            case .borrowing(let dialogue):
                BorrowingView(dialogue: dialogue)
            case .returning(let artwork):
                ReturningView(artwork: artwork)
            }
        }
        .environmentObject(viewModel) // 只需要在这里调用一次！
    }
}
