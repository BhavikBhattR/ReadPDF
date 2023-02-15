//
//  SheetView.swift
//  ReadPDF
//
//  Created by Bhavik Bhatt on 14/02/23.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
         VStack(spacing: 2){
             HStack{
                 Image(systemName: synthasizer.isSpeaking ? "pause.circle" : "play.circle")
                 Text(synthasizer.isSpeaking ? "Pause Listening" : "Resume Listening")
             }
             .foregroundColor(.white)
             .padding()
             .background(RoundedRectangle(cornerRadius: 2).fill(.black))
             .padding()
             HStack{
                 Image(systemName: "xmark.app")
                 Text("Stop Listening")
             }
             .foregroundColor(.white)
             .padding()
             .background(RoundedRectangle(cornerRadius: 2).fill(.black))
             .padding()
             .onTapGesture {
                 
             }
         }
         .presentationDetents([.height(200)])
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
