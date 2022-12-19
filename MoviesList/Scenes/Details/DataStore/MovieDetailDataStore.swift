import Foundation

protocol MovieDetailDataStoreProtocol {
    var movie: MoviesResponse.Result { get }
}

final class MovieDetailDataStore: MovieDetailDataStoreProtocol {
    var movie: MoviesResponse.Result
    
    init(movie: MoviesResponse.Result) {
        self.movie = movie
    }
}
