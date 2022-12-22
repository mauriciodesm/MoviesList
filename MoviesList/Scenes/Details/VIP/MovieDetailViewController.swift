import Foundation
import UIKit

protocol MovieDetailDelegate: AnyObject {
    func render(viewData: DetailViewData)
}

final class MovieDetailViewController: UIViewController {
    var detailView: MovieDetailViewProtocol
    var interactor: MovieDetailInteractorProtocol
    var viewData: DetailViewData?
    
    init(detailView: MovieDetailViewProtocol,
         interactor: MovieDetailInteractorProtocol) {
        self.detailView = detailView
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        interactor.viewDidLoad()
    }
}

extension MovieDetailViewController: MovieDetailDelegate {
    func render(viewData: DetailViewData) {
        self.viewData = viewData
        detailView.render(with: viewData)
    }
}
