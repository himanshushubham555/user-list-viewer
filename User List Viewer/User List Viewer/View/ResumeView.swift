//
//  ResumeView.swift
//  User List Viewer
//
//  Created by Himanshu on 01/07/25.
//

import SwiftUI
import PDFKit

struct ResumeView: View {
    var body: some View {
        VStack {
            if let url = Bundle.main.url(forResource: "HimanshuResume", withExtension: "pdf"),
               let pdfDocument = PDFDocument(url: url) {
                PDFKitView(document: pdfDocument)
            } else {
                Text("Resume not found.")
                    .foregroundColor(.red)
            }
        }
    }
}

struct PDFKitView: UIViewRepresentable {
    let document: PDFDocument

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = document
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}

