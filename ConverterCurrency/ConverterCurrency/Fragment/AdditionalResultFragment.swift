//
//  AdditionalResultFragment.swift
//  ConverterCurrency
//
//  Created by Mac on 16.03.2024.
//

import Foundation
import SwiftUI


struct AdditionalResultFragment : View {
    var value: String
    var model: AdditionalFragmetModel
    
    @State var showToast = false


    var body: some View {
        
        NavigationView(content: {
            
            let workRes = (Float(value) ?? 0) * Float(model.pricePerOneDollad)
            let finalRes = String(format: "%.3f", workRes)
            
            VStack(content: {
                VStack(content: {
                    // let _ print("hello
                    Spacer()
                        .frame(height: 10)
                    Text("\(value) USD = \(finalRes) \(model.currencyShortName)")
                        .fontWeight(.bold)
                        .font(.callout)
                        .foregroundColor(.black)
                    
                    Text("-4.5% o ay için")
                    
                    Image(systemName: "doc.on.doc")
                        .frame(width: 50, height: 50)
                        .onTapGesture {
                            withAnimation {
                                showToast.toggle()
                            }
                            UIPasteboard.general.string = "\(model.pricePerOneDollad * (Float(value) ?? 0))"
                        }
                        
                })
                    .frame(width: 350, height: 100)
                    .background(Color.green.opacity(0.8))
                    .cornerRadius(10)
                
                
                Image("gr")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 500, height: 500)
                
                Spacer()
            })
            
        })
        .navigationBarBackButtonHidden(true)
        .toast(toastView: Toast(dataModel: ToastDataModel(title: "Panoya opied", image: "checkmark"), show: $showToast), show: $showToast)
    }
}
