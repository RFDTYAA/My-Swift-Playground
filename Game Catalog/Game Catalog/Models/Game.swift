import Foundation

struct Game: Identifiable, Codable {
    let id: Int
    let name: String
    let released: String?
    let rating: Double
    let background_image: String?
    let description_raw: String?

    enum CodingKeys: String, CodingKey {
        case id, name, released, rating
        case background_image = "background_image"
        case description_raw = "description_raw"
    }
}
