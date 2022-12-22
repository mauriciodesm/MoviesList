import Foundation
import UIKit
import Kingfisher

protocol MovieDetailViewProtocol where Self: UIView {
    func render(with viewData: DetailViewData)
}

final class MovieDetailView: UIView, MovieDetailViewProtocol {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28,
                                       weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var posterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var voteAverageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16,
                                       weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
                           .withAlphaComponent(0.75)
        label.font = UIFont.systemFont(ofSize: 12,
                                       weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightBackground
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(with viewData: DetailViewData) {
        titleLabel.text = viewData.title
        let baseURL = "https://image.tmdb.org/t/p/w500/"
        let urlString = baseURL + viewData.posterPath
        renderThumbImage(for: urlString)
        voteAverageLabel.text = "Classificação dos usuários: \(viewData.voteAverage)"
        overviewLabel.attributedText = NSAttributedString(string: viewData.overview)
                                                                              .withLineSpacing(0.8)
    }
    
    private func renderThumbImage(for urlString: String) {
        let url = URL(string: urlString)
        posterImage.kf.indicatorType = .activity
        posterImage.kf.setImage(with: url)
        posterImage.contentMode = .scaleAspectFit
        posterImage.layer.cornerRadius = 32
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(posterImage)
        addSubview(voteAverageLabel)
        addSubview(overviewLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(32)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        posterImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.height.equalTo(192)
            make.width.equalTo(264)
        }
        
        voteAverageLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImage.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(voteAverageLabel.snp.bottom).offset(32)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
        }
    }
    
}
