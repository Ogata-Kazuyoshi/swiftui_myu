//
//  SafariView.swift
//  Apple-Frameworks
//
//  Created by user on 2023/12/17.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable{
    let url: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
