//
//  CounterView.swift
//  TCA-Counter
//
//  Created by 윤병일 on 2023/06/02.
//

import SwiftUI
import ComposableArchitecture

// 도메인 + 상태
struct CounterState : Equatable {
    var count = 0
}

// 도메인 + 액션
enum CounterAction : Equatable {
    case addCount // 카운트를 더하는 액션
    case subtractCount // 카운트를 빼는 액션
}

struct CounterEnvironment {
    
}

// action이 들어왔을때 state(상태) 를 내뱉는다.
let counterReducer = AnyReducer<CounterState, CounterAction, CounterEnvironment> { state, action, environment in
    
    // 들어온 액션에 따라 상태를 변경
    switch action {
    case .addCount :
        state.count += 1
        return EffectTask.none
    case .subtractCount :
        state.count -= 1
        return EffectTask.none
    }
}

struct CounterView: View {
    
    let store : Store<CounterState, CounterAction>
    
    var body: some View {
        // 스토어를 받고 할수있도록 하는 옵저버블이 되는 아이
        WithViewStore(self.store) { viewStore in
            VStack {
                Text("\(viewStore.state.count)")
                
                HStack {
                    Button("더하기", action: { viewStore.send(.addCount)})
                    Button("빼기", action: {viewStore.send(.subtractCount)})
                }
            }   
        }
    }
}

//struct CounterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CounterView()
//    }
//}
