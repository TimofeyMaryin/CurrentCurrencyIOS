//
//  ContentView.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

import SwiftUI
import WebKit
import Combine



struct ContentView: View {
    @State private var isPresentWebView = false
    
    @State var message: String = ""
    @State var appURL: String = ""
    
    let langStr = Locale.current.languageCode


    @StateObject var viewModel = ViewModel()
    @State private var showingDetail = false

    
    
    var body: some View {

        
        ZStack(content: {
            if !appURL.isEmpty && checkPush() {
                WebView(url: URL(string: appURL)!)
            } else {
                WhitePartScreen().background(Color.white)
            }
        })
        .onAppear {
            fetchData()
        }
        
    }
    
    
    private func fetchData() {
                guard let url = URL(string: "https://apps.catoftree.com/api/app?identify=tkf-doviz-cevirici") else {
                    return
                }
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    guard let data = data, error == nil else {
                        print("Error: \(error?.localizedDescription ?? "Unknown error")")
                        return
                    }
                    
                    if let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
                        DispatchQueue.main.async {
                            self.message = decodedData.message
                            self.appURL = decodedData.data.appURL
                        }
                    }
                }
                .resume()
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
    logError(message: Locale.current.languageCode!)
    return Locale.current.languageCode == "tr"

}


struct Response: Codable {
    let success: Bool
    let message: String
    let data: AppData
}

struct AppData: Codable {
    let status: Int
    let appURL: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case appURL = "app_url"
    }
}
