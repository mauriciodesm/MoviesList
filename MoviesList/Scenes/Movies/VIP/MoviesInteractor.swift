import Foundation

protocol MoviesInteractorProtocol: AnyObject{
    func viewDidLoad()
}

final class MoviesInteractor: MoviesInteractorProtocol{
    var presenter: MoviesPresenterProtocol
    var worker: MoviesWorkerProtocol
    
    init(presenter: MoviesPresenterProtocol,
         worker: MoviesWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func viewDidLoad() {
        worker.fetchHeroes().done { [weak self] moviesResponse in
            self?.presenter.present(with: moviesResponse)
        }.catch { error in
            print(error)
        }
    }
    
}
