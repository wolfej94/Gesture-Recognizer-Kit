/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Defines the app's knowledge of the model's class labels.
*/

extension GestureRecognizer {
    /// Represents the app's knowledge of the Exercise Classifier model's labels.
    enum Label: String, CaseIterable {
        case fingersCrossed = "FIngersCrossed"
        case fistBump = "FistBump"
        case middleFinger = "MiddleFinger"
        case ok = "Ok"
        case peace = "Peace"
        case thumbsUp = "ThumbsUp"
        case wave = "Wave"
        
        var emoji: String {
            switch self {
            case .fingersCrossed:
                return "🤞"
            case .fistBump:
                return "👊"
            case .middleFinger:
                return "🖕"
            case .ok:
                return "👌"
            case .peace:
                return "✌️"
            case .thumbsUp:
                return "👍"
            case .wave:
                return "👋"
            }
        }

        /// Creates a label from a string.
        /// - Parameter label: The name of an action class.
        init(_ string: String) {
            guard let label = Label(rawValue: string) else {
                let typeName = String(reflecting: Label.self)
                fatalError("Add the `\(string)` label to the `\(typeName)` type.")
            }

            self = label
        }
    }
}
