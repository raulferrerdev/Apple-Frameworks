//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by RaulF on 28/7/21.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworGridViewModel()
    
    var body: some View {
        if viewModel.isGridView {
            NavigationView{
                ScrollView {
                    LazyVGrid(columns: viewModel.columns) {
                        ForEach(MockData.frameworks) { framework in
                            FrameworkTitleView(framework: framework)
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                        }
                    }
                }
                .navigationTitle("🍎 Frameworks")
                .toolbar {
                    Button {
                        viewModel.toggleGridView()
                    } label: {
                        Image(systemName: "square.grid.3x3")
                            .foregroundColor(Color(.label))
                            .imageScale(.large)
                            .frame(width: 44, height: 44)
                    }
                }
                .sheet(isPresented: $viewModel.isShowingDetailView) {
                    FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                                        isShowingDetailView: $viewModel.isShowingDetailView,
                                        isGridView: $viewModel.isGridView)
                }
            }
            .accentColor(Color(.label))
        } else {
            NavigationView{
                List {
                    ForEach(MockData.frameworks) { framework in
                        NavigationLink(destination: FrameworkDetailView(framework: framework,
                                                                        isShowingDetailView: $viewModel.isShowingDetailView,
                                                                        isGridView: $viewModel.isGridView)) {
                            FrameworkTitleCell(framework: framework)
                        }
                    }
                }
                .navigationTitle("🍎 Frameworks")
                .toolbar {
                    Button {
                        viewModel.toggleGridView()
                    } label: {
                        Image(systemName: "square.grid.3x3")
                            .foregroundColor(Color(.label))
                            .imageScale(.large)
                            .frame(width: 44, height: 44)
                    }
                }
            }
            .accentColor(Color(.label))
        }
        
        /*
         NavigationView{

         ScrollView {
         LazyVGrid(columns: viewModel.columns) {
         ForEach(MockData.frameworks) { framework in
         FrameworkTitleView(framework: framework)
         .onTapGesture {
         viewModel.selectedFramework = framework
         }
         }
         }
         }
         .navigationTitle("🍎 Frameworks")
         .sheet(isPresented: $viewModel.isShowingDetailView) {
         FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
         isShowingDetailView: $viewModel.isShowingDetailView)
         }
         }
         .accentColor(Color(.label))

         */
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
            
    }
}
