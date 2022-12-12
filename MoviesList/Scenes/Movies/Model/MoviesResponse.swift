import Foundation

struct MoviesResponse: Codable {
    
    struct DataClass: Codable {
        let results: [Result]
    }
    struct Result: Codable {
        let backdropPath: String
        let title: String
        let originalTitle, overview, posterPath: String
        let popularity: Double
        let releaseDate: String
        let voteAverage: Double
    }

    let data: DataClass
}



