//
//  MainViewModel.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

import Foundation
import MapKit
import SwiftUI

class ViewModel : ObservableObject {
    
}

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @State var selected = false
    }
}

