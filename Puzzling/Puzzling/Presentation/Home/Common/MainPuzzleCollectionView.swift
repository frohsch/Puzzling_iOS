//
//  MainPuzzleCollectionView.swift
//  Puzzling
//
//  Created by KYUBO A. SHIM on 2023/07/16.
//

import UIKit

import SnapKit
import Then

final class MainPuzzleCollectionView: UIView {

    private lazy var puzzleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setFlowLayout())
    private var modelData: [ModelProtocol?] = []
    private var dashboardType: DashboardType

    private let cellHeight: CGFloat = UIScreen.main.bounds.height / 9.2
    private let cellWidth: CGFloat = UIScreen.main.bounds.width / 5.86
    
    init(frame: CGRect, dashboardType: DashboardType) {
        self.dashboardType = dashboardType
        super.init(frame: frame)
        setDelegate()
        setUI()
        setLayout()
        setRegister()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainPuzzleCollectionView {
    
    private func setDelegate() {
        puzzleCollectionView.dataSource = self
        puzzleCollectionView.delegate = self
    }
    
    private func setUI() {
        self.backgroundColor = .clear
        puzzleCollectionView.do {
            $0.isScrollEnabled = true
            $0.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
        }
    }
    
    private func setLayout() {
        self.addSubviews(puzzleCollectionView)
        
        puzzleCollectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.verticalEdges.equalToSuperview().inset(5)
        }
    }
    
    private func setRegister() {
        puzzleCollectionView.register(MainPuzzleCollectionViewCell.self, forCellWithReuseIdentifier: dashboardType.identifier)
    }
}

extension MainPuzzleCollectionView {
    private func setFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        return layout
    }
}

extension MainPuzzleCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch dashboardType {
        case .indivisual:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dashboardType.identifier, for: indexPath) as? MainPuzzleCollectionViewCell else {
                return UICollectionViewCell() }
            guard let model = modelData as? [IndivisualPuzzleStatusModel?] else { return UICollectionViewCell() }
            cell.setDataBind(data: model[indexPath.item], index: indexPath.item)
            return cell
        case .team:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dashboardType.identifier, for: indexPath) as? MainPuzzleCollectionViewCell else {
                return UICollectionViewCell() }
            guard let model = modelData as? [TeamPuzzleStatusModel?] else { return UICollectionViewCell() }
            cell.setDataBind(data: model[indexPath.item], index: indexPath.item)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MainPuzzleCollectionViewCell else { return }        
    }
}

extension MainPuzzleCollectionView {
    func passPuzzleData(data: [ModelProtocol?]) {
        if data.isEmpty {
            self.modelData = Array(repeating: nil, count: 15)
        }
        
        let restOfDataCount = 15 - data.count
        if restOfDataCount == 0 {
            self.modelData = data
            return
        }
        
        self.modelData = data + Array(repeating: nil, count: restOfDataCount)
    }
}
