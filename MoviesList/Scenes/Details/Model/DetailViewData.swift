import Foundation

struct DetailViewData: Codable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String
    let overview: String
    let voteAverage: Double
}
