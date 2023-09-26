//
//  ContentViewModel.swift
//  GestureRecognizerTest
//
//  Created by James Wolfe on 26/09/2023.
//

import SwiftUI
import GestureRecognizerKit

class ContentViewModel: ObservableObject {
    
    // MARK: - Variables
    var videoProcessingChain: VideoProcessingChain
    var videoCapture: VideoCapture
    @Published var label: String = "Loading"
    
    // MARK: - Initializers
    init() {
        videoProcessingChain = VideoProcessingChain()

        // Begin receiving frames from the video capture.
        videoCapture = VideoCapture()
        videoProcessingChain.delegate = self
        videoCapture.delegate = self
    }
    
}

extension ContentViewModel: VideoProcessingChainDelegate {
    
    func videoProcessingChain(_ chain: GestureRecognizerKit.VideoProcessingChain, didPredict actionPrediction: GestureRecognizerKit.ActionPrediction, for frames: Int) {
        label = actionPrediction.label
    }
    
}

extension ContentViewModel: VideoCaptureDelegate {
    
    func videoCapture(_ videoCapture: GestureRecognizerKit.VideoCapture, didCreate framePublisher: GestureRecognizerKit.FramePublisher) {
        label = "Loading"
        videoProcessingChain.upstreamFramePublisher = framePublisher
    }
    
}
