//
//  IndivisualCardView.swift
//  Puzzling
//
//  Created by KYUBO A. SHIM on 2023/07/12.
//

import UIKit

import SnapKit
import Then

final class IndivisualCardButtonView: UIView {
    
    private let backgroundImageView = UIImageView()
    private let puzzleBoardLabel = UILabel()
    private let puzzleBoardCountLabel = UILabel()
    private let chevronNextImageView = UIImageView()

    private var puzzleCount: Int = 0 {
        didSet {
            puzzleBoardCountLabel.text = "\(puzzleCount) 판"
        }
    }
    
    private var cardTitle: String!
    
    init(frame: CGRect, cardTitle: String) {
        self.cardTitle = cardTitle
        super.init(frame: frame)
        setDelegate()
        setUI()
        setLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 
extension IndivisualCardButtonView {
    
    private func setDelegate() {}
    
    private func setUI() {
        
        backgroundImageView.do {
            $0.image = Image.indivisualCardBackground
            $0.contentMode = .scaleAspectFill
        }
        
        puzzleBoardLabel.do {
            $0.text = cardTitle
            $0.font = .fontGuide(.heading3_kor)
            $0.textColor = .black000
        }
        
        chevronNextImageView.do {
            let configuration = UIImage.SymbolConfiguration(pointSize: 0, weight: .semibold, scale: .medium)
            $0.image = UIImage(systemName: "chevron.right", withConfiguration: configuration)
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .gray500
        }
        
        puzzleBoardCountLabel.do {
            $0.text = "n 판"
            $0.font = .fontGuide(.heading4_kor)
            $0.textColor = .blue400
            $0.textAlignment = .right
        }
    }
    
    private func setLayout() {
        self.addSubviews(backgroundImageView, puzzleBoardLabel, chevronNextImageView, puzzleBoardCountLabel)
        
        backgroundImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalToSuperview()
        }
        
        puzzleBoardLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
        }
        
        chevronNextImageView.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.trailing.equalToSuperview().inset(22)
            $0.centerY.equalToSuperview()
        }
        
        puzzleBoardCountLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(chevronNextImageView.snp.leading).offset(-20)
            $0.width.lessThanOrEqualTo(50)
        }
    }
}
//
//extension IndivisualCardButtonView {
//    func passCardTitle(title: String) {
//        self.puzzleBoardLabel.text = title
//    }
//}