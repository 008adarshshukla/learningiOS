//
//  UOHomeView.swift
//  learningiOS
//
//  Created by Adarsh Shukla on 11/02/24.
//

import SwiftUI
import SafariServices

struct UOHomeView: View {
    @State private var showWebView: Bool = false
    var body: some View {
        VStack(spacing: 16) {
            Text("Hello, World!")
            Button("Browse") {
                showWebView = true
            }
            .buttonStyle(.borderedProminent)
        }
        .fullScreenCover(isPresented: $showWebView, content: {
            SafariWebView(url: URL(string: "https://sarunw.com")!)
                .ignoresSafeArea()
        })
    }
}

#Preview {
    UOHomeView()
        .preferredColorScheme(.dark)
}


//MARK: Using SafariView Controller
struct SafariWebView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let viewController = SFSafariViewController(url: url)
        viewController.dismissButtonStyle = .close //Dismiss Button type
        viewController.preferredBarTintColor = .cyan // bar color can be modified based on app theme
        viewController.preferredControlTintColor = .red //color of all the controls
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}

/*
 Since SFSafariViewController come pre-equipped with a navigation bar, using NavigationLink create a double navigation bar. So it should be used in full screen
 */


