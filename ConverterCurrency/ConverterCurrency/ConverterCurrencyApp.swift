//
//  ConverterCurrencyApp.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

import SwiftUI
import AppsFlyerLib
import UIKit
import os.log
import OneSignalFramework
import Combine


let log = OSLog(subsystem: "ru.ios-project.SimpleConverterCurrency", category: "Error")

func logError(message: String) {
    os_log("%@", log: log, type: .error, message)
}



@main
struct ConverterCurrencyApp: App {
    @State private var data: [Item] = []
    private let url = URL(string: "https://apps.catoftree.com/api/app?identify=trade-trainer")!
    @State private var cancellable: AnyCancellable?


    // @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // var appsFlyerTracker: AppsFlyerLib?
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        

        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    logError(message: "Hello World")
                    
                   fetchData()
                })
        }
    }
    
    private func fetchData() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: [Item].self, decoder: JSONDecoder())
                .replaceError(with: [])
                .receive(on: DispatchQueue.main)
                .assign(to: \.data, on: self)
        
        print(cancellable ?? "Error")
    }
    
}



class AppDelegate: UIResponder, UIApplicationDelegate {
    // Добавьте следующую переменную экземпляра AppsFlyerTracker в класс AppDelegate
    var appsFlyerTracker: AppsFlyerLib?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool{
        
        // Инициализация AppsFlyer с ключом приложения
        appsFlyerTracker = AppsFlyerLib.shared()
        appsFlyerTracker?.appsFlyerDevKey = "FVS24b72a7nVw7ZimgMj5H"
        appsFlyerTracker?.appleAppID = "6478958292"
        appsFlyerTracker?.isDebug = true
        
        logError(message: "application Init Apps")
        
        // Установите AppsFlyer для отслеживания реферреров при установке или после переустановки приложения
        if let url = launchOptions?[.url] as? URL {
            appsFlyerTracker?.handleOpen(url, options: nil)
        }
        
        
        // Remove this method to stop OneSignal Debugging
        OneSignal.Debug.setLogLevel(.LL_VERBOSE)
                
        // OneSignal initialization
       OneSignal.initialize("51176d0d-9e48-4d1d-af22-feae1c359972", withLaunchOptions: launchOptions)

        // requestPermission will show the native iOS notification permission prompt.
        // We recommend removing the following code and instead using an In-App Message to prompt for notification permission
        OneSignal.Notifications.requestPermission({ accepted in
            print("User accepted notifications: \(accepted)")
        }, fallbackToSettings: true)

        // Login your customer with externalId
        // OneSignal.login("EXTERNAL_ID")
                    
        
        return true
    }
    
    // Добавьте следующий метод для обработки входящих URL-схем
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        logError(message: "Apps application")
        appsFlyerTracker?.handleOpen(url, options: options)
        return true
    }

}


struct Item: Codable, Identifiable {
    let id: Int
    let name: String
}
