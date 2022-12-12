import Foundation
import UIKit

protocol MoviesPresenterProtocol: AnyObject{
    func present(with moviesResponse: MoviesResponse)
}

final class MoviesPresenter: MoviesPresenterProtocol {
    weak var view: MoviesPresenterProtocol?
    
    func present(with moviesResponse: MoviesResponse) {
    }
    
    private func viewData(from moviesResponse: MoviesResponse) -> MoviesViewData{
        .init(movies: moviesViewData(from: moviesResponse.data.results))
    }
    
    private func moviesViewData(from results: [MoviesResponse.Result]) -> [MoviesViewData.MovieViewData] {
        results.compactMap { result in
            let imageURL = result.posterPath
            return MoviesViewData.MovieViewData(title: result.title, posterPath: imageURL, releaseDate: result.releaseDate)
        }
    }
}
