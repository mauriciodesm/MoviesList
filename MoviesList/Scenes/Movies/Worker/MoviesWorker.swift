import Foundation
import Alamofire
import PromiseKit

protocol MoviesWorkerProtocol {
    func fetchMovies() -> Promise<MoviesResponse>
}


final class MoviesWorker: MoviesWorkerProtocol {
    func fetchMovies() -> Promise<MoviesResponse> {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=8b07b22776f9a0f7a0f3b7d5299d9db7&language=pt-BR&page=1"
        return Promise<MoviesResponse> { seal in
            AF.request(url,
                       method: .get)
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                case .success(let data):
                    guard let data,
                          let object = try? JSONDecoder().decode(MoviesResponse.self, from: data) else { return }
                    seal.fulfill(object)
                    
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
    
}
