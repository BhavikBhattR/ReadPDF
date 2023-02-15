//
//  MainView.swift
//  ReadPDF
//
//  Created by Bhavik Bhatt on 14/02/23.
//

import SwiftUI

struct MainView: View {
    @State private var showPDF: Bool = false
    var body: some View {
            VStack(spacing: 0){
                Image(systemName: "doc.circle.fill")
                    .font(.system(size: 54))
                
                Text("Open")
                    .foregroundColor(.white)
                    .padding(.vertical, 3)
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 2).fill(.black))
                    
            }
            .onTapGesture {
                showPDF.toggle()
            }
            .navigationDestination(isPresented: $showPDF) {
                ContentView()
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}




