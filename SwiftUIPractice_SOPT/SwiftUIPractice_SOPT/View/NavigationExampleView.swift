//
//  NavigationExampleView.swift
//  SwiftUIPractice_SOPT
//
//  Created by 최주리 on 11/30/24.
//

import SwiftUI

struct NavigationExampleView: View {
    enum Destination: Hashable {
        case detail
        case setting
        case profile

        var title: String {
            switch self {
            case .detail:
                "detail"
            case .setting:
                "setting"
            case .profile:
                "profile"
            }
        }
    }
    
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                //NavigationLink로 이동
                NavigationLink(Destination.profile.title, value: Destination.profile)
                //버튼 액션으로 이동
                Button(Destination.setting.title) {
                    path.append(Destination.setting)
                }
                //여러 화면을 이동
                Button("Go to Setting then Detail") {
                    path.append(Destination.setting)
                    path.append(Destination.detail)
                }
            }
            .navigationTitle("메인")
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .detail:
                    DetailView(path: $path)
                case .setting:
                    Text("Setting View")
                case .profile:
                    Text("Profile View")
                }
            }
        }
    }
}

#Preview {
    NavigationExampleView()
}
