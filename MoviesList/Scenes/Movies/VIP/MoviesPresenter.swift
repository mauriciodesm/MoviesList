import Foundation
import UIKit

protocol MoviesPresenterProtocol: AnyObject{
    func present(with moviesResponse: MoviesResponse)
}

final class MoviesPresenter: MoviesPresenterProtocol {
    weak var view: MoviesPresenterDelegate?
    
    func present(with moviesResponse: MoviesResponse) {
        let viewData = viewData(from: moviesResponse)
        view?.render(viewData: viewData)
    }
    
    private func viewData(from moviesResponse: MoviesResponse) -> MoviesViewData{
        .init(movies: moviesViewData(from: moviesResponse.results))
    }
    
    private func moviesViewData(from results: [MoviesResponse.Result]) -> [MoviesViewData.MovieViewData] {
        results.compactMap { result in
            let imageURL = result.posterPath 
            return MoviesViewData.MovieViewData(title: result.title, posterPath: imageURL, releaseDate: result.releaseDate)
        }
    }
}
