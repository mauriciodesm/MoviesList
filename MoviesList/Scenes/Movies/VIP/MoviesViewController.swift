import Foundation
import UIKit

protocol MoviesPresenterDelegate: AnyObject{
    func render()
}

final class MoviesViewController: UIViewController {
    var customView: MoviesCustomViewProtocol
    var interactor: MoviesInteractorProtocol
    
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
        interactor.viewDidLoad()
    }
    
    
}
    
extension MoviesViewController: MoviesPresenterDelegate {
    func render() {
    }
}
