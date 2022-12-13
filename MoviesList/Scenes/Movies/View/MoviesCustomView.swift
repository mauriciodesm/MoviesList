import Foundation
import UIKit

protocol MoviesCustomViewProtocol where Self: UIView{
    
}

final class MoviesCustomView: UIView, MoviesCustomViewProtocol {
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Filmes Populares"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    
    private var tableView: UITableView = {
        let tableView = UITableView(frame:  .zero)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MoviesTableViewCell.self)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        self.addSubview(titleLabel)
        self.addSubview(tableView)
    }
    
    private func setUpConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(87)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(42)
            make.leading.trailing.equalToSuperview()
        }
        
    }
}
