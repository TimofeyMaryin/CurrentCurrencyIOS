//
//  SettingsFragment.swift
//  ConverterCurrency
//
//  Created by Mac on 20.02.2024.
//


import Foundation
import SwiftUI


private struct SettingsItem {
    var title: String
    var ic: String
    var onClicK: () -> Void
}

private var allSettingsItem = [
    SettingsItem(title: "Оценить приложение", ic: "star.fill", onClicK: {
        if let url = URL(string: "https://apps.apple.com/ru/app/ConverterCurrency/ru.ios-project.ConverterCurrency") {
            UIApplication.shared.open(url)
        }
    }),
    SettingsItem(title: "Политика конфедициальности", ic: "doc.fill", onClicK: {
        if let url = URL(string: "https://apps.apple.com/ru/app/ConverterCurrency/ru.ios-project.ConverterCurrency") {
               UIApplication.shared.open(url)
            }
    }),
    SettingsItem(title: "Условия использования", ic: "person.fill", onClicK: {
        if let url = URL(string: "https://apps.apple.com/ru/app/ConverterCurrency/ru.ios-project.ConverterCurrency") {
               UIApplication.shared.open(url)
            }
    } ),
    SettingsItem(title: "Связаться с нами", ic: "mail.fill", onClicK: {}),
    SettingsItem(title: "Поделиться", ic: "square.and.arrow.up.fill", onClicK: {})
]


struct SettingsFragment : View {
    @State private var isShowingShareSheet = false

    var body: some View {
        NavigationView {
            
            VStack{
                List(0..<allSettingsItem.count) { item in
                    Button(
                        action: {
                            allSettingsItem[item].onClicK()
                            if item == 4 {
                                isShowingShareSheet = true
                            }
                        }, label: {
                            HStack {
                                Image(systemName: allSettingsItem[item].ic)
                                    .foregroundColor(.blue)
                                Text(allSettingsItem[item].title)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                    })
                    .sheet(isPresented: $isShowingShareSheet) {
                        ShareSheet(activityItems: ["Поделиться своей находкой"]) // Замените "Текст для публикации" на свой собственный контент
                    }

                    .padding([.vertical], 20)
                }
            }
            
            .navigationTitle("Настройки")
        }
    }
}


struct ShareSheet: UIViewControllerRepresentable {
    var activityItems: [Any]
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheet>) {
        // Код обновления контроллера, если требуется
    }
}
