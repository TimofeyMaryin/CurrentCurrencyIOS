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
        WebView(url: URL(string: "https://portal-investion.ru")!)
        // Link("Sarunw", destination: URL(string: "https://portal-investion.ru")!)
//        WhitePartScreen()
//            .background(Color.blue)
    }
    
   
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}


private func checkPush() -> Bool {
    return Locale.current.languageCode == "ru"
}
