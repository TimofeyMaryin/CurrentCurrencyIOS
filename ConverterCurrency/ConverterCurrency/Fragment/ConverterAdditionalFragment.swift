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
    var currency: [Float]
    
    var body: some View {
        if currency.count != 3 {
            Text("Lütfen Formu Eksiksiz Doldurunuz")
        } else {
            __Content(currency: currency[1])
        }
        
    }
}


private struct __Content : View {
    var currency: Float
    @State var value = ""
    @State var __test = false
    @State var showToast = false
    let columns: [GridItem] = [
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16)
    ]
 
    var body: some View {
        
        VStack {
            HStack(content: {
                Spacer()
                if value.isEmpty {
                    Text("0")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                } else {
                    Text(value)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                Spacer()
                    .frame(width: 50)
                
            })
            HStack(content: {
                Spacer()
                Text("Converted: \(currency * (Float(value) ?? 0))")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .font(.title2)
                Spacer()
                    .frame(width: 50)
            })
            
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
                        UIPasteboard.general.string = "\(currency * (Float(value) ?? 0))"
                        
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


//ScrollView {
//    LazyVGrid(
//        columns: columns,
//        alignment: .center,
//        content: {
//            Section(
//                header: __Header(countValue: value, currency: currency)
//            ) {
//                ForEach(1..<10) { index in
//                    Button(
//                        action: {
//                            if value.count <= 8 {
//                                value += String(index)
//                            }
//                        },
//                        label: {
//                            Text("\(index)")
//                                .padding(40)
//                                .foregroundColor(.white)
//                                .background(Color.blue)
//                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
//                            }
//                    )
//                }
//            }
//        }
//    )
//    LazyVGrid(
//        columns: [
//            GridItem(.fixed(100), spacing: 16),
//            GridItem(.fixed(100), spacing: 16),
//            GridItem(.fixed(100), spacing: 16)
//        ],
//        alignment: .center,
//        content: {
//            Section {
//                Button(
//                    action: {
//                        if value.count <= 8 {
//                            value += "0"
//                        }
//                    },
//                    label: {
//                        Text("0")
//                            .padding([.vertical], 40)
//                            .padding([.horizontal], 40)
//                            .foregroundColor(.white)
//                            .background(Color.blue)
//                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
//                        }
//                )
//                
//                Button(
//                    action: {
//                        if !value.isEmpty {
//                            value.removeLast()
//                        }
//                    },
//                    label: {
//                        Image(systemName: "delete.left.fill")
//                            .padding(40)
//                            .foregroundColor(.white)
//                            .background(Color.blue)
//                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
//                        }
//                )
//                
//                Button(
//                    action: {
//                        withAnimation {
//                            showToast.toggle()
//                        }
//                        UIPasteboard.general.string = "\(currency * (Float(value) ?? 0))"
//                    },
//                    label: {
//                        Image(systemName: "doc.on.doc.fill")
//                            .padding(40)
//                            .foregroundColor(.white)
//                            .background(Color.blue)
//                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
//                        }
//                )
//            }
//            
//        }
//    )
//}
//.toast(toastView: Toast(dataModel: ToastDataModel(title: "Panoya Kopyalandı", image: "checkmark"), show: $showToast), show: $showToast)

