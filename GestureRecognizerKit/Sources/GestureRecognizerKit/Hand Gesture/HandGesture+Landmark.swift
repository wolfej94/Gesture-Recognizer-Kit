/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A `Landmark` is the name and location of a point on a human body, including:
 - Left shoulder
 - Right eye
 - Nose
*/

import Vision

extension HandGesture {
    typealias JointName = VNHumanHandPoseObservation.JointName

    /// The name and location of a point of interest on a human body.
    ///
    /// Each landmark defines its location in an image and the name of the body
    /// joint it represents, such as nose, left eye, right knee, and so on.
    struct Landmark {
        /// The minimum `VNRecognizedPoint` confidence for a valid `Landmark`.
        private static let threshold: Float = 0.2

        /// The name of the landmark.
        ///
        /// For example, "left shoulder", "right knee", "nose", and so on.
        let name: JointName

        /// The location of the landmark in normalized coordinates.
        let location: CGPoint

        /// Creates a landmark from a point.
        /// - Parameter point: A point in a human body pose observation.
        init?(_ point: VNRecognizedPoint) {
            // Only create a landmark from a point that satisfies the minimum
            // confidence.
            guard point.confidence >= HandGesture.Landmark.threshold else {
                return nil
            }

            name = JointName(rawValue: point.identifier)
            location = point.location
        }
        
    }
}
