import Foundation
import UIKit

protocol MoviesPresenterDelegate: AnyObject {
    func render(viewData: MoviesViewData)
}

final class MoviesViewController: UIViewController {
    var customView: MoviesCustomViewProtocol
    var interactor: MoviesInteractorProtocol
    var viewData: MoviesViewData?
    
    init(customView: MoviesCustomViewProtocol,
         interactor: MoviesInteractorProtocol) {
        self.customView = customView
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        self.view?.backgroundColor = UIColor(hex: "#1E1E1E")
        interactor.viewDidLoad()
    }
    
    
}
    
extension MoviesViewController: MoviesPresenterDelegate {
    func render(viewData: MoviesViewData) {
    }
}
