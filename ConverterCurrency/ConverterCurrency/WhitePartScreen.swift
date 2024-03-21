//
//  WhitePartScreen.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

// 5 стран
//  США - Доллар
// Венгрия - форинт
// Гонконг - гонконгский доллар
// Израиль - Шекель
// Китай - Юань
// Символ Лиры - ₺

import Foundation
import SwiftUI

struct WhitePartScreen : View {
    
    var body: some View {
        
        TabView {
            FirstFragment()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Ana")
                    }
                }
            SecondFragment()
                .tabItem {
                    VStack {
                        Image(systemName: "dollarsign.arrow.circlepath")
                        Text("Dönüştürücü")
                    }
                }
            
        }
        
    }
}
