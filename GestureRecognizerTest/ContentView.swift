//
//  ContentView.swift
//  GestureRecognizerTest
//
//  Created by James Wolfe on 26/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Variables
    @StateObject var viewModel = ContentViewModel()
    
    // MARK: - views
    var body: some View {
        VStack {
            Text(viewModel.label)
        }
        .padding()
        .onAppear {
            viewModel.videoCapture.updateDeviceOrientation()
        }
    }
}

#Preview {
    ContentView()
}
