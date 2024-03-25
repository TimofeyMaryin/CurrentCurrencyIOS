//
//  AdditionalFragment.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//

import Foundation
import SwiftUI
import Combine
import UniformTypeIdentifiers
import MobileCoreServices


struct AdditionalFragmetModel {
    var image: String
    var pricePerOneDollad: Float
    var currencyIcon: String
    var currencyShortName: String
}

struct AdditionalFragment : View {
    var model: AdditionalFragmetModel
    @State var textField = ""
    
    @State var showToast = false
    
    let width: CGFloat = 85
    
    var body: some View {
        NavigationView(
            content: {
                VStack {
                    HStack(
                        content: {
                            Spacer()
                            Text(model.currencyShortName)
                                .foregroundColor(.black.opacity(0.7))
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                            
                            if textField.count != 0 {
                                Text(textField)
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
                        Text("\((Float(textField) ?? 0.0) * model.pricePerOneDollad)")
                        Spacer().frame(width: width)
                    })
                    
                    HStack(content: {
                        AdditionalFragmentButton(
                            value: "1",
                            onClick: {
                                if isMaxValue(value: textField) {
                                    textField += "1"
                                }
                                
                            }
                        )
                        AdditionalFragmentButton(
                            value: "2",
                            onClick: {
                                if isMaxValue(value: textField) {
                                    textField += "2"
                                }
                                
                            }
                        )
                        AdditionalFragmentButton(
                            value: "3",
                            onClick: {
                                if isMaxValue(value: textField) {
                                    textField += "3"
                                }
                                
                            }
                        )
                    })
                    HStack(content: {
                        AdditionalFragmentButton(
                            value: "4",
                            onClick: {
                                if isMaxValue(value: textField) {
                                    textField += "4"
                                }
                                
                            }
                        )
                        AdditionalFragmentButton(
                            value: "5",
                            onClick: {
                                if isMaxValue(value: textField) {
                                    textField += "5"
                                }
                                
                            }
                        )
                        AdditionalFragmentButton(
                            value: "6",
                            onClick: {
                                if isMaxValue(value: textField) {
                                    textField += "6"
                                }
                            }
                        )
                    })
                    HStack(content: {
                        AdditionalFragmentButton(
                            value: "7",
                            onClick: {
                                if isMaxValue(value: textField) {
                                    textField += "7"
                                }
                                
                            }
                        )
                        AdditionalFragmentButton(
                            value: "8",
                            onClick: {
                                if isMaxValue(value: textField) {
                                    textField += "8"
                                }
                                
                            }
                        )
                        AdditionalFragmentButton(
                            value: "9",
                            onClick: {
                                if isMaxValue(value: textField) {
                                    textField += "9"
                                }
                                
                            }
                        )
                    })
                    HStack(content: {
                        AdditionalFragmentButton(
                            value: "<-",
                            onClick: {
                                if !textField.isEmpty {
                                    textField.removeLast()
                                }
                                
                            }
                        )
                        
                        AdditionalFragmentButton(
                            value: "0",
                            onClick: {
                                if !textField.isEmpty && isMaxValue(value: textField){
                                    textField += "0"
                                }
                                
                            }
                        )
                        
                        AdditionalFragmentButton(
                            value: "Cop",
                            onClick: {
                                withAnimation {
                                    showToast.toggle()
                                }
                                UIPasteboard.general.string = "\((Float(textField) ?? 0.0) * model.pricePerOneDollad)"
                                
                            }
                        )
                    })
                }
            }
        )
        .toast(toastView: Toast(dataModel: ToastDataModel(title: "Panoya opied", image: "checkmark"), show: $showToast), show: $showToast)

    }
}

private func setValue(valuee: String) -> Float  {
    return if (valuee.isEmpty) { 0 } else { valuee.floatValue }
}


private func calculateCurrency(value: String, currencyPrice: Float) -> Float  {
    
    return setValue(valuee: value) * currencyPrice
}

private func isMaxValue(value: String) -> Bool {
    if value.count <= 8 {
        return true
    } else {
        return false
    }
}




extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

struct AdditionalFragmentButton : View {
    var value: String
    var onClick: () -> Void
    
    var body: some View {
        Text(value)
            .frame(width: 70, height: 70)
            .background(Color.green.opacity(0.6))
            .clipShape(Circle())
            .onTapGesture {
                onClick()
            }
            .padding(10)
    }
}
