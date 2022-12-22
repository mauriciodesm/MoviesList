import UIKit

final class MovieDetailFactory {
    static func viewController (movie: MoviesResponse.Result) -> UIViewController {
        let dataStore = MovieDetailDataStore(movie: movie)
        let presenter = MovieDetailPresenter()
        let interactor = MovieDetailInteractor(dataStore: dataStore,
                                               presenter: presenter)
        let view = MovieDetailView()
        let viewController = MovieDetailViewController(detailView: view,
                                                       interactor: interactor)
        presenter.view = viewController
        //let viewController = UIViewController()
        //viewController.view.backgroundColor = .blue
        return viewController
    }
}
