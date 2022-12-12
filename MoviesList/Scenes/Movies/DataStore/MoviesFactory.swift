import UIKit

final class MoviesFactory {
    static func viewController () -> UIViewController {
        let presenter = MoviesPresenter()
        let interactor = MoviesInteractor(presenter: presenter)
        let view = MoviesCustomView()
        let viewController = MoviesViewController(customView: view, interactor: interactor)
        let navigationController = UINavigationController(rootViewController: viewController)
        presenter.view = viewController as? any MoviesPresenterProtocol
        return navigationController
    }
}
