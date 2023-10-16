//
//  MemoCell.swift
//  MemoApp(SnapKit)
//
//  Created by 차소민 on 2023/10/16.
//

import UIKit
import SnapKit

final class MemoCell: UITableViewCell {

    let memoContentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [memoContentLabel, dateLabel])
        stview.spacing = 10
        stview.axis = .vertical
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    var memoData: MemoData? {
        didSet {
            configureUIwithData()
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        self.addSubview(stackView)
        
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
//            ])
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    }
    
    // (투두) 데이터를 가지고 적절한 UI 표시하기
    func configureUIwithData() {
        memoContentLabel.text = memoData?.memoContent
        dateLabel.text = memoData?.dateString
        
    }
    
}

