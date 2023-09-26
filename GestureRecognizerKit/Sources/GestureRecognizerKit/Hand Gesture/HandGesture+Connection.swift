/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A `Connection` defines the line between two landmarks.
 The only real purpose for a connection is to draw that line with a gradient.
*/

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

extension HandGesture {
    /// Represents a line between two landmarks.
    struct Connection: Equatable {

        /// The connection's first endpoint.
        private let point1: CGPoint

        /// The connection's second endpoint.
        private let point2: CGPoint

        /// Creates a connection from two points.
        ///
        /// The order of the points isn't important.
        /// - Parameters:
        ///   - one: The location for one end of the connection.
        ///   - two: The location for the other end of the connection.
        init(_ one: CGPoint, _ two: CGPoint) { point1 = one; point2 = two }
    }
}

extension HandGesture {
    /// A series of joint pairs that define the wireframe lines of a pose.
    static let jointPairs: [(joint1: JointName, joint2: JointName)] = [
        // The ring finger's connections.
        (.ringTip, .ringDIP),
        (.ringDIP, .ringPIP),
        (.ringPIP, .ringMCP),

        // The index finger's connections.
        (.indexTip, .indexDIP),
        (.indexDIP, .indexPIP),
        (.indexPIP, .indexMCP),

        // The index finger's connections.
        (.middleTip, .middleDIP),
        (.middleDIP, .middlePIP),
        (.middlePIP, .middleMCP),

        // The little finger's connections.
        (.littleTip, .littleDIP),
        (.littleDIP, .littlePIP),
        (.littlePIP, .littleMCP),
        
        // the thumb's connections
        (.thumbTip, .thumbIP),
        (.thumbIP, .thumbMP),
        (.thumbMP, .thumbCMC),

        // The wrist's connections.
        (.wrist, .ringMCP),
        (.wrist, .indexMCP),
        (.wrist, .middleMCP),
        (.wrist, .littleMCP),
        (.wrist, .thumbCMC)
    ]
}
