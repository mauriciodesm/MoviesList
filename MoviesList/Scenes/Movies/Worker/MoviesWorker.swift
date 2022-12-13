import Foundation
import Alamofire
import PromiseKit

protocol MoviesWorkerProtocol {
    func fetchHeroes() -> Promise<MoviesResponse>
}

final class MoviesWorker: MoviesWorkerProtocol {
    func fetchHeroes() -> PromiseKit.Promise<MoviesResponse> {
        let apiKey = "8b07b22776f9a0f7a0f3b7d5299d9db7"
        let parameters: [String: Any] = ["api_key": apiKey,
                                         "language": "pt-BR"]
        return Promise<MoviesResponse> { seal in
            AF.request("https://api.themoviedb.org/3/trending/movie/week",
                        method: .get,
                        parameters: parameters,
                        encoding: URLEncoding(destination: .queryString))
                .validate(statusCode: 200..<300)
                .response { response in
                    switch response.result{
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
