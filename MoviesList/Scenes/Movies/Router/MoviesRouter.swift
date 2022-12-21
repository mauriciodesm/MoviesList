import Foundation
import UIKit

protocol MoviesRouterProtocol {
    func goToDetailScreen(with movie: MoviesResponse.Result)
}

final class MoviesRouter: MoviesRouterProtocol{
    weak var navigationController: UINavigationController?
    
    func goToDetailScreen(with movie: MoviesResponse.Result) {
        let viewController = MovieDetailFactory.viewController(movie: movie)
        navigationController?.pushViewController(viewController, animated: true)
    }
   
}

/*dadada*/
