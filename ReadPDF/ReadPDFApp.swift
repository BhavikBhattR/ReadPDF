//
//  ReadPDFApp.swift
//  ReadPDF
//
//  Created by Bhavik Bhatt on 13/02/23.
//

import SwiftUI

@main
struct ReadPDFApp: App {
    
    init(){
        UINavigationBar.appearance().barStyle = UIBarStyle.default
        UINavigationBar.appearance().tintColor = UIColor.black
        
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                MainView()
                    .preferredColorScheme(.light)
            }
            .tint(.black)
        }
    }
}
