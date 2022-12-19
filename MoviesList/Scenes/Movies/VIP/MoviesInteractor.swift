import Foundation

protocol MoviesInteractorProtocol: AnyObject{
    func viewDidLoad()
    func didSelect(at index: Int)
}

final class MoviesInteractor: MoviesInteractorProtocol{
    var dataStore: MoviesDataStoreProtocol
    var presenter: MoviesPresenterProtocol
    var router: MoviesRouterProtocol
    var worker: MoviesWorkerProtocol
    
    init(dataStore: MoviesDataStoreProtocol,
         presenter: MoviesPresenterProtocol,
         router: MoviesRouter,
         worker: MoviesWorkerProtocol) {
        self.dataStore = dataStore
        self.presenter = presenter
        self.router = router
        self.worker = worker
    }
    
    func viewDidLoad() {
        worker.fetchMovies().done { [weak self] moviesResponse in
            self?.dataStore.moviesResponse = moviesResponse
            self?.presenter.present(with: moviesResponse)
        }.catch { error in
            print(error)
        }
    }
    
    func didSelect(at index: Int) {
        guard let movie = self.dataStore.moviesResponse?.data.results[index] else { return }
        router.goToDetailScreen(with: movie)
    }
}
