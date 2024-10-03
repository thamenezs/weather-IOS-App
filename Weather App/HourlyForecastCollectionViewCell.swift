//
//  HourlyForecastCollectionViewCell.swift
//  Weather App
//
//  Created by Espezzialy Souza on 02/10/24.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HourlyForecast"
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [hourLabel, iconImageView,temperatureLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 20
        stackView.layer.borderColor = UIColor.gray?.cgColor //borda so aceita cgcolor
        return stackView
    }()
    
    private lazy var hourLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "13:00"
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25°C"
        label.textColor = UIColor.contrastColor
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setUpView()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        contentView.addSubview(stackView)
        
    }
    private func setConstraints(){
        stackView.setConstraintsToParentView(contentView)
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
}
