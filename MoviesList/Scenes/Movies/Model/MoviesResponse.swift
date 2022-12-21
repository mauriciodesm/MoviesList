import Foundation

struct MoviesResponse: Codable {
    let results: [Result]
    
    struct Result: Codable {
        let id: Int
        let title: String
        let releaseDate: String
        let posterPath: String
        let overview: String
        let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case overview
        case voteAverage = "vote_average"
    }
  }
}
