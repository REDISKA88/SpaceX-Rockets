import Foundation

typealias Launches = [SpaceXLaunches]

// MARK: - LaunchesXElement
struct SpaceXLaunches: Codable {
    let rocket: Rocket?
    let success: Bool?
    let name: String?
    let id: String?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case rocket, success
        case name
        case id
        case date = "date_utc"
    }
}

enum Rocket: String, Codable {
    case falconOne = "5e9d0d95eda69955f709d1eb"
    case falconNine = "5e9d0d95eda69973a809d1ec"
    case falconHeavy = "5e9d0d95eda69974db09d1ed"
    case starship = "5e9d0d96eda699382d09d1ee"
}

