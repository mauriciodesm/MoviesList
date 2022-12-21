import Foundation

struct MoviesViewData {
    struct MovieViewData{
        let title: String
        let posterPath: String
        let releaseDate: String
    }
    
    let movies: [MovieViewData]
}
