# Hand Gesture Detection Package

The Hand Gesture Detection Package is a library for iOS that enables you to initialize an object capable of using your device's camera to detect a variety of hand gestures. It is built upon the concepts and techniques outlined in the [Apple tutorial](https://developer.apple.com/documentation/createml/detecting_human_actions_in_a_live_video_feed) that focuses on detecting human actions in live video feeds, such as exercises. However, this package specifically extends the capability to recognize and classify hand gestures, making it a powerful tool for developing applications with gesture-based interactions.

## Features

- Detects a range of hand gestures, including:
  - 👊 (Fist)
  - 👍 (Thumbs Up)
  - 🤞 (Crossed Fingers)
  - ✌️ (Peace Sign)
  - 👌 (OK Sign)
  - 👋 (Wave)
  - 🖕 (Middle Finger)

- Utilizes the device's camera to capture live video feed for real-time gesture detection.
- High-performance and accuracy, thanks to the underlying machine learning model.
- Easily integrated into your iOS applications, offering gesture-based interactions to enhance user experiences.

## Getting Started

### Prerequisites

Before you can start using the Hand Gesture Detection Package, ensure that you have the following prerequisites in place:

- Development environment for iOS app development set up.
- Familiarity with mobile app development using Swift.
- Access to the device's camera for video feed capture.

### Installation

1. **Install Package**: To use the Hand Gesture Detection Package in your Swift project, add it as a dependency using the Swift Package Manager. Add the following URL to your `Package.swift` file's `dependencies` array:

```
.package(url: "https://github.com/wolfej94/gesture-recognizer-kit.git", from: "1.0.0"),
```

2. **Import Package**: In your code, import the package to make use of its gesture detection capabilities.

3. **Initialize Gesture Detection Object Using the ViewModel**: Create an instance of the gesture detection object within your SwiftUI view using the `ContentViewModel` provided. Configure it as needed within your SwiftUI view, and start capturing video feed for gesture detection.

   ```swift
     import SwiftUI
     import GestureRecognizerKit // Import the package
  
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

   struct ContentView: View {
       @ObservedObject var viewModel = ContentViewModel() // Initialize the view model

       var body: some View {
           // Your SwiftUI view content here
           Text(viewModel.label)
               .onAppear {
                   // Configure and start gesture detection
                   viewModel.videoProcessingChain.delegate = viewModel
                   viewModel.videoCapture.delegate = viewModel
                   viewModel.videoCapture.startCapturing()
               }
       }
   }
   ```

   In this example, we initialize the `ContentViewModel` within your SwiftUI view and configure the gesture detection components. Ensure that you have appropriate SwiftUI views to display the captured video feed and handle gesture events as desired.

## Contributing

We welcome contributions from the community to improve and expand the functionality of the Hand Gesture Detection Package. If you have suggestions, bug reports, or feature requests, please feel free to open issues or submit pull requests on our [GitHub repository](https://github.com/wolfej94/gesture-recognizer-kit).

## License

This project is licensed under the [MIT License](https://github.com/wolfej94/Gesture-Recognizer-Kit/blob/main/LICENSE) - see the [LICENSE.md](https://github.com/wolfej94/Gesture-Recognizer-Kit/blob/main/LICENSE) file for details.

## Contact

If you have any questions or need further assistance, please don't hesitate to reach out:

- Email: [james.wolfe94@outlook.com](mailto:james.wolfe94@outlook.com)
- GitHub: [wolfej94](https://github.com/wolfej94)

Thank you for using the Hand Gesture Detection Package, and we look forward to seeing the innovative applications you create with it!
