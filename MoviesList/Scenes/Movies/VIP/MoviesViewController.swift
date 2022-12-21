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
        super.viewDidLoad()
        view.setBackground()
        interactor.viewDidLoad()
    }    
}
    
extension MoviesViewController: MoviesPresenterDelegate {
    func render(viewData: MoviesViewData) {
        self.viewData = viewData
        customView.reloadData()
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieViewData = self.viewData?.movies[indexPath.row],
              let cell = tableView.dequeue(cell: MoviesTableViewCell.self) else {
            return UITableViewCell()
        }
        cell.render(viewData: movieViewData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewData?.movies.count ?? 0
    }
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.didSelect(at: indexPath.row)
    }
}
