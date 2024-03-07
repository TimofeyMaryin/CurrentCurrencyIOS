//
//  AppDelegate.swift
//  ConverterCurrency
//
//  Created by Mac on 22.02.2024.
//

import Foundation
import UIKit
import AppsFlyerLib


class AppDelegate: UIResponder, UIApplicationDelegate {
    // Добавьте следующую переменную экземпляра AppsFlyerTracker в класс AppDelegate
    var appsFlyerTracker: AppsFlyerLib?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool{
        
        // Инициализация AppsFlyer с ключом приложения
        appsFlyerTracker = AppsFlyerLib.shared()
        appsFlyerTracker?.appsFlyerDevKey = "FVS24b72a7nVw7ZimgMj5H"
        appsFlyerTracker?.appleAppID = "YOUR_APPLE_APP_ID"
        
        // Установите AppsFlyer для отслеживания реферреров при установке или после переустановки приложения
        if let url = launchOptions?[.url] as? URL {
            appsFlyerTracker?.handleOpen(url, options: nil)
        }
        
        return true
    }
    
    // Добавьте следующий метод для обработки входящих URL-схем
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        appsFlyerTracker?.handleOpen(url, options: options)
        return true
    }

}
