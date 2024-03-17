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
    
    
    var body: some View {
        NavigationView(
            content: {
                VStack {
                    HStack(
                        content: {
                            Text(model.currencyShortName)
                                .foregroundColor(.black.opacity(0.7))
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                            
                            Text(textField)
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                    )
                    
                    HStack(content: {
                        AdditionalFragmentButton(
                            value: "1",
                            onClick: { textField += "1" }
                        )
                        AdditionalFragmentButton(
                            value: "2",
                            onClick: { textField += "2" }
                        )
                        AdditionalFragmentButton(
                            value: "3",
                            onClick: { textField += "3" }
                        )
                    })
                    HStack(content: {
                        AdditionalFragmentButton(
                            value: "4",
                            onClick: { textField += "4" }
                        )
                        AdditionalFragmentButton(
                            value: "5",
                            onClick: { textField += "5" }
                        )
                        AdditionalFragmentButton(
                            value: "6",
                            onClick: { textField += "6" }
                        )
                    })
                    HStack(content: {
                        AdditionalFragmentButton(
                            value: "7",
                            onClick: { textField += "7" }
                        )
                        AdditionalFragmentButton(
                            value: "8",
                            onClick: { textField += "8" }
                        )
                        AdditionalFragmentButton(
                            value: "9",
                            onClick: { textField += "9" }
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
                                if !textField.isEmpty {
                                    textField += "0"
                                }
                                
                            }
                        )
                        
                        AdditionalFragmentButton(
                            value: "Del",
                            onClick: {
                                if !textField.isEmpty {
                                    textField = ""
                                }
                                
                            }
                        )
                    })
                    
                    NavigationLink {
                        if !textField.isEmpty {
                            AdditionalResultFragment(value: textField, model: model)
                        }
                        
                    } label: {
                        Text("Continue")
                            .foregroundColor(Color.black)
                            .frame(width: 140, height: 60)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
            }
        )

    }
}

private func setValue(valuee: String) -> Float  {
    return if (valuee.isEmpty) { 0 } else { valuee.floatValue }
}


private func calculateCurrency(value: String, currencyPrice: Float) -> Float  {
    
    return setValue(valuee: value) * currencyPrice
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
