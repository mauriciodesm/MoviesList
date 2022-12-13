import Foundation

protocol MoviesInteractorProtocol: AnyObject{
    func viewDidLoad()
}

final class MoviesInteractor: MoviesInteractorProtocol{
    var dataStore: MoviesDataStoreProtocol
    var presenter: MoviesPresenterProtocol
    var router: MoviesRouter
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
        worker.fetchHeroes().done { [weak self] moviesResponse in
            self?.dataStore.moviesResponse = moviesResponse
            self?.presenter.present(with: moviesResponse)
        }.catch { error in
            print(error)
        }
    }
    
}
