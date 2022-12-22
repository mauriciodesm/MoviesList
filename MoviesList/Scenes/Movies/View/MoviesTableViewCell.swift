import UIKit
import SnapKit
import Kingfisher

class MoviesTableViewCell: UITableViewCell {
    private lazy var moviePoster: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: "FFFFFF")
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: "FFFFFF")?
                           .withAlphaComponent(0.75)
        label.font = UIFont.systemFont(ofSize: 14,
                                         weight: .regular)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        [moviePoster, secondaryStackView].forEach { view in
            stack.addArrangedSubview(view)
        }
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 16
        return stack
    }()
    
    private lazy var secondaryStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        [titleLabel, releaseDateLabel].forEach { view in
            stack.addArrangedSubview(view)
        }
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        contentView.addSubview(stackView)
        backgroundColor = .clear
    }
    
    private func setUpConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
        }
        
        moviePoster.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(120)
        }
    }
    
    func render(viewData: MoviesViewData.MovieViewData) {
        titleLabel.text = viewData.title
        releaseDateLabel.text = "Lançamento: \(viewData.releaseDate.formatDate())"
        let baseURL = "https://image.tmdb.org/t/p/w500/"
        let urlString = baseURL + viewData.posterPath
        renderThumbImage(for: urlString)
    }
    
    private func renderThumbImage(for urlString: String) {
        let url = URL(string: urlString)
        moviePoster.kf.indicatorType = .activity
        moviePoster.kf.setImage(with: url)
        moviePoster.contentMode = .scaleAspectFit
        moviePoster.layer.cornerRadius = 18
    }
}
