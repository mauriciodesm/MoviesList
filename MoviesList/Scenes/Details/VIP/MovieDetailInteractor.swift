import Foundation

protocol MovieDetailInteractorProtocol: AnyObject {
    func viewDidLoad()
}

final class MovieDetailInteractor: MovieDetailInteractorProtocol {
    var dataStore: MovieDetailDataStore
    var presenter: MovieDetailPresenterProtocol
    
    init(dataStore: MovieDetailDataStore,
         presenter: MovieDetailPresenterProtocol) {
        self.dataStore = dataStore
        self.presenter = presenter
    }
    
    func viewDidLoad() {
        self.presenter.present(with: self.dataStore)
    }
}
