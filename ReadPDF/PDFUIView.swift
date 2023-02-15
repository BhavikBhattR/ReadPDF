//
//  PDFUIView.swift
//  ReadPDF
//
//  Created by Bhavik Bhatt on 14/02/23.
//

import AVFoundation
import SwiftUI
import PDFKit

struct PDFKitView: UIViewRepresentable {

    let pdfDocument: PDFDocument

    init(showing pdfDoc: PDFDocument) {
        self.pdfDocument = pdfDoc
    }

    //you could also have inits that take a URL or Data

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ pdfView: PDFView, context: Context) {
        pdfView.document = pdfDocument
    }
}

struct PDFUIView: View {

    let pdfDoc: PDFDocument

    init(resourceName: String) {
        let url = Bundle.main.url(forResource: "LatestResume", withExtension: "pdf")!
        pdfDoc = PDFDocument(url: url)!
    }

    var body: some View {
        PDFKitView(showing: pdfDoc)
    }
}

struct PDFSwiftUIView: View{
    let resourceName: String
    let documentURL = Bundle.main.url(forResource: "LatestResume", withExtension: "pdf")
    @State private var pdfContent: String = ""
    @State private var showPdfText: Bool = false
    init(resourceName: String){
        self.resourceName = resourceName
    }
    var body: some View{
        NavigationStack{
            VStack{
                PDFUIView(resourceName: resourceName)
                    .hAligned(alignment: .center)
                    .vAligned(alignment: .center)
            }
        }
    }
}

struct PDFUIView_Previews: PreviewProvider {
    static var previews: some View {
        PDFSwiftUIView(resourceName: "LatestResume")
    }
}
