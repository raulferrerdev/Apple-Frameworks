//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by RaulF on 28/7/21.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @Binding var isGridView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            if isGridView {
                XDismissButton(isShowingDetailView: $isShowingDetailView)
            }
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn more")
            }
            .sheet(isPresented: $isShowingSafariView, content: {
                SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
            })
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework,
                            isShowingDetailView: .constant(false), isGridView: .constant(true))
            .preferredColorScheme(.dark)
    }
}
