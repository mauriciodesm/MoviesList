import UIKit

final class MovieDetalFactory {
    static func viewController (movie: MoviesResponse.Result) -> UIViewController {
        let dataStore = MovieDetailDataStore(movie: movie)
        let interactor = MovieDetailInteractor(dataStore: dataStore)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        return viewController
    }
}
