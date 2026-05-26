//
//  PropertyFinderApp.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 11/05/26.
//

import SwiftUI

@main
struct PropertyFinderApp: App {
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) private var scenePhase
    
    init() {
            UINavigationBar.appearance().isHidden = true
        }
    
    var body: some Scene {
        WindowGroup {
            MainRootView()
            //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            //                .environment(\.currentAppPhase, scenePhase)
        }
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .active:
                // 👉 Jab app screen par aayegi
                print("🟢 LIVE TEST: App ACTIVE ho gayi hai!")
            case .background:
                // 👉 Jab app background mein jayegi
                print("🔴 LIVE TEST: App BACKGROUND mein chali gayi!")
            case .inactive:
                // 👉 Transition state
                print("🟡 LIVE TEST: App INACTIVE ho gayi!")
            @unknown default:
                print("❓ Unknown State")
            }
        }
    }
}
    
//    private struct AppPhaseKey: EnvironmentKey {
//        static let defaultValue: ScenePhase = .active
//    }
//
//    extension EnvironmentValues {
//        var currentAppPhase : ScenePhase {
//            get { self[AppPhaseKey.self]}
//            set { self[AppPhaseKey.self] = newValue}
//        }
//    }
    
    
    
