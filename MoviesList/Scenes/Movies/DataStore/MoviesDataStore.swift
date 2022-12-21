import Foundation

protocol MoviesDataStoreProtocol {
    var moviesResponse: MoviesResponse? { get set }
}

final class MoviesDataStore: MoviesDataStoreProtocol {
    var moviesResponse: MoviesResponse?
}
