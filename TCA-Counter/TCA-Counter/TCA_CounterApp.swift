//
//  TCA_CounterApp.swift
//  TCA-Counter
//
//  Created by 윤병일 on 2023/06/02.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_CounterApp: App {
    
    let counterStore = Store(initialState: CounterState(), reducer: counterReducer, environment: CounterEnvironment())
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: counterStore)
        }
    }
}
