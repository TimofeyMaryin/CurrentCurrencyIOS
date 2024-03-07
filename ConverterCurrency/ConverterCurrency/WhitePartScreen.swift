//
//  WhitePartScreen.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

import Foundation
import SwiftUI

struct WhitePartScreen : View {
    var body: some View {
        TabView {
            FirstFragment()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Главная")
                    }
                }
            SecondFragment()
                .tabItem {
                    VStack {
                        Image(systemName: "dollarsign.arrow.circlepath")
                        Text("Конвертер")
                    }
                }
            SettingsFragment()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Настройки")
                    }
                }
        }
        
    }
}
