import Foundation

protocol MovieDetailPresenterProtocol: AnyObject {
    func present(with datastore: MovieDetailDataStore)
}

final class MovieDetailPresenter: MovieDetailPresenterProtocol {
    weak var view: MovieDetailDelegate?
    
    func present(with datastore: MovieDetailDataStore) {
      let viewData = viewData(from: datastore)
        view?.render(viewData: viewData)
    }
    
    private func viewData(from results: MovieDetailDataStore) -> DetailViewData {
        .init(id: results.movie.id,
              title: results.movie.title,
              releaseDate: results.movie.releaseDate,
              posterPath: results.movie.posterPath,
              overview: results.movie.overview,
              voteAverage: results.movie.voteAverage)
    }
}

