import Foundation

protocol MovieDetailInteractorProtocol: AnyObject {
    func viewDidLoad()
}

final class MovieDetailInteractor: MovieDetailInteractorProtocol {
    var dataStore: MovieDetailDataStoreProtocol
    
    init(dataStore: MovieDetailDataStoreProtocol){
        self.dataStore = dataStore
    }
    
    func viewDidLoad() {
    }
}
