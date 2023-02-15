//
//  ContentView.swift
//  ReadPDF
//
//  Created by Bhavik Bhatt on 13/02/23.
//

import SwiftUI
import PDFKit
import AVFoundation


struct ContentView: View {
    
    let documentURL = Bundle.main.url(forResource: "LatestResume", withExtension: "pdf")
    @State private var pdfContent: String = ""
    @State var synthasizer =  AVSpeechSynthesizer()
    @State private var isSpeaking: Bool = false
    @State private var isAvSpeechSynthesizerActive: Bool = false
    @State private var showSheet: Bool = false
    
    var body: some View {
            VStack(alignment: .leading){
                PDFSwiftUIView(resourceName: "LatestResume")
                VStack(spacing: -25){
                    Button(isAvSpeechSynthesizerActive && !showSheet && isSpeaking ? "Stop/Pause Listening" : "Listen PDF Content") {
                        if !isAvSpeechSynthesizerActive{
                            isAvSpeechSynthesizerActive = true
                            isSpeaking = true
                            textToSpeech()
                            showSheet = true
                        }
                        showSheet = true
                    }
                    .foregroundColor(.white)
                    .hAligned(alignment: .center)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 2).fill(.black))
                    .padding()
                }
                .sheet(isPresented: $showSheet) {
                    VStack(spacing: 2){
                        HStack{
                            if isSpeaking{
                                HStack{
                                    Image(systemName: "pause.circle")
                                    Text("Pause Listening")
                                }
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 2).fill(.black))
                                .padding()
                                .onTapGesture {
                                    isSpeaking.toggle()
                                    synthasizer.pauseSpeaking(at: .immediate)
                                }
                            }else{
                                HStack{
                                    Image(systemName: "play.circle")
                                    Text("Resume Listening")
                                }
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 2).fill(.black))
                                .padding()
                                .onTapGesture {
                                    isSpeaking.toggle()
                                    synthasizer.continueSpeaking()
                                }
                            }
                        }
                        HStack{
                            Image(systemName: "xmark.app")
                            Text("Stop Listening")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 2).fill(.black))
                        .padding()
                        .onTapGesture {
                            synthasizer.stopSpeaking(at: .immediate)
                            isSpeaking = false
                            isAvSpeechSynthesizerActive = false
                            showSheet.toggle()
                        }
                    }
                    .presentationDetents([.height(200)])
                }
                .navigationTitle("Your PDF")
            }
}
    func extractTextFromPDF(){
        guard let documentURL = documentURL else {
            print("didnt get url")
            return
        }

        if let pdf = PDFDocument(url: documentURL) {
            self.pdfContent = pdf.string ?? ""
        }
    }
    
    func textToSpeech(){
        extractTextFromPDF()
        print(self.pdfContent)
        let utterance = AVSpeechUtterance(string: self.pdfContent)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.4
        synthasizer.speak(utterance)
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




