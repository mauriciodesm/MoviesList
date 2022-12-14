import UIKit

final class MoviesFactory {
    static func viewController () -> UIViewController {
        let dataStore = MoviesDataStore()
        let presenter = MoviesPresenter()
        let router = MoviesRouter()
        let worker = MoviesWorker()
        let interactor = MoviesInteractor(dataStore: dataStore,
                                            presenter: presenter,
                                            router: router,
                                            worker: worker)
        let view = MoviesCustomView()
        let viewController = MoviesViewController(customView: view, interactor: interactor)
        let navigationController = UINavigationController(rootViewController: viewController)
        view.setupDelegate(delegate: viewController, dataSource: viewController)
        presenter.view = viewController
        router.navigationController = navigationController
        return navigationController
    }
}
