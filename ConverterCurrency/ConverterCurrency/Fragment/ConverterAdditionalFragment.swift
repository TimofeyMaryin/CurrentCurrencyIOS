//
//  ConverterAdditionalFragment.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct ConverterAdditionalFragment : View {

    
    var model1: CurrencyModel?
    var model2: CurrencyModel?
    
    var body: some View {
        if model1 == nil || model2 == nil {
            Text("Lütfen Formu Eksiksiz Doldurunuz")
        } else {
            __Content(model1: model1!, model2: model2!)
        }
        
    }
}


private struct __Content : View {
    
    var model1: CurrencyModel
    var model2: CurrencyModel
    
    @State var value = ""
    @State var __test = false
    @State var showToast = false
    
    let width: CGFloat = 85
    
    
    
    let columns: [GridItem] = [
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16)
    ]
 
    var body: some View {
        
        VStack {
            HStack(
                content: {
                    Spacer()
                    Text(model1.currencyNameShort)
                        .foregroundColor(.black.opacity(0.7))
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    if value.count != 0 {
                        Text(value)
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    } else {
                        Text("0")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    
                    Spacer().frame(width: width)
                }
            )
            HStack(content: {
                Spacer()
                Text("Converted: ")
                Text("\((Float(value) ?? 0.0) / model1.currencyCurrencyPerDollad * model2.currencyCurrencyPerDollad)")
                    .fontWeight(.semibold)
                Text(" \(model2.currencyNameShort)")
                Spacer().frame(width: width)
            })
            // --

            HStack(content: {
                AdditionalFragmentButton(
                    value: "1",
                    onClick: { value += "1" }
                )
                AdditionalFragmentButton(
                    value: "2",
                    onClick: { value += "2" }
                )
                AdditionalFragmentButton(
                    value: "3",
                    onClick: { value += "3" }
                )
            })
            HStack(content: {
                AdditionalFragmentButton(
                    value: "4",
                    onClick: { value += "4" }
                )
                AdditionalFragmentButton(
                    value: "5",
                    onClick: { value += "5" }
                )
                AdditionalFragmentButton(
                    value: "6",
                    onClick: { value += "6" }
                )
            })
            HStack(content: {
                AdditionalFragmentButton(
                    value: "7",
                    onClick: { value += "7" }
                )
                AdditionalFragmentButton(
                    value: "8",
                    onClick: { value += "8" }
                )
                AdditionalFragmentButton(
                    value: "9",
                    onClick: { value += "9" }
                )
            })
            HStack(content: {
                AdditionalFragmentButton(
                    value: "<-",
                    onClick: {
                        if !value.isEmpty {
                            value.removeLast()
                        }
                        
                    }
                )
                
                AdditionalFragmentButton(
                    value: "0",
                    onClick: {
                        if !value.isEmpty {
                            value += "0"
                        }
                        
                    }
                )
                
                AdditionalFragmentButton(
                    value: "Cop",
                    onClick: {
                        withAnimation {
                            showToast.toggle()
                        }
                        UIPasteboard.general.string = "\((Float(value) ?? 0.0) / model1.currencyCurrencyPerDollad * model2.currencyCurrencyPerDollad)"
                        
                    }
                )
            })
        }.toast(toastView: Toast(dataModel: ToastDataModel(title: "Panoya opied", image: "checkmark"), show: $showToast), show: $showToast)
    
    }
    
}

private struct __Header: View {
    var countValue: String
    var currency: Float
    @State var showToast = false
    var _opacity = 0

    init(countValue: String, currency: Float, showToast: Bool = false) {
        self.countValue = countValue
        self.currency = currency
        self.showToast = showToast
        _opacity = if countValue.isEmpty { 0 } else { 1 }
    }
    
    
    var body: some View {
        VStack {
            Text("\(countValue)")
                .font(.title)
                .padding([.horizontal], 40)
                .padding([.vertical], 10)
                .foregroundColor(.white.opacity(Double(_opacity)))
                .background(Color.blue.opacity(Double(_opacity)))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .frame(minWidth: 400)
            Spacer()
                .frame(height: 20)
            Text("Converted: \(currency * (Float(countValue) ?? 0))")
                .font(.body)
                .padding(20)
                .foregroundColor(.white.opacity(Double(_opacity)))
                .background(Color.blue.opacity(Double(_opacity)))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        }
        .onTapGesture {
            UIPasteboard.general.string = "\(currency * (Float(countValue) ?? 0))"
            print("\(currency * (Float(countValue) ?? 0))")
            withAnimation {
                showToast.toggle()
            }
        }
        .toast(toastView: Toast(dataModel: ToastDataModel(title: "Panoya opied", image: "checkmark"), show: $showToast), show: $showToast)
        
    }
    
}

