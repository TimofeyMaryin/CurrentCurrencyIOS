//
//  SelectCurrencyCard.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//


import Foundation
import SwiftUI

struct SelectCurrencyModel : Identifiable {
    let id = UUID()
    let name: String
    let img: String
}

struct SelectCurrencyCard : View {
    var model: CurrencyModel
    var selected: Bool
    var onClick: () -> Void

    
    var body: some View {
        Button(
            action: {
                onClick()
            }, label: {
                HStack(
                    alignment: .center
                ) {
                    Image(model.currencyImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .cornerRadius(10)
                        .shadow(color: .black, radius: 3)
                    Text(model.currencyFullName)
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 1)
//                    if (selected) {
//                        Image(systemName: "checkmark")
//                            .foregroundColor(.red)
//                            .frame(width: 40, height: 40)
//                    }
                    
                }
                .padding([.vertical], 10)
                .padding([.horizontal], 20)
        })
        .padding([.vertical], 10)
        .background(selected ? Color.gray.opacity(0.4) : Color.white)
        
        
    }
}


//struct SelectCurrencyCard : View {
//    var model: SelectCurrencyModel
//    var selected: Bool
//    var onClick: () -> Void
//
//    
//    var body: some View {
//        Button(
//            action: {
//                onClick()
//            }, label: {
//                HStack(
//                    alignment: .center
//                ) {
//                    Image(model.img)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 40, height: 40)
//                        .cornerRadius(10)
//                        .shadow(color: .black, radius: 3)
//                    Text(model.name)
//                        .font(.title3)
//                        .fontWeight(.regular)
//                        .foregroundColor(.black)
//                    
//                    Spacer(minLength: 1)
//                    if (selected) {
//                        Image(systemName: "checkmark")
//                            .foregroundColor(.red)
//                            .frame(width: 40, height: 40)
//                    }
//                    
//                }
//                .padding([.vertical], 10)
//                .padding([.horizontal], 20)
//        })
//        .padding([.vertical], 10)
//        
//        
//    }
//}
//

