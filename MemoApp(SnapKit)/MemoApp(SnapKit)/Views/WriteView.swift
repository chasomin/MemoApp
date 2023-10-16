//
//  WriteView.swift
//  MemoApp(SnapKit)
//
//  Created by 차소민 on 2023/10/16.
//

import UIKit
import SnapKit

class WriteView: UIView {

    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = true
        textView.isSelectable = true
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("SAVE", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true

        return button
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {

        self.addSubview(contentTextView)
        
        // 기존 코드
        //        NSLayoutConstraint.activate([
        //            contentTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        //            contentTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        //            contentTextView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
        //            contentTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        //            contentTextView.heightAnchor.constraint(equalToConstant: 353)
        //        ])
        
        // SnapKit
        contentTextView.snp.makeConstraints { make in
            make.leading.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self).offset(-20)
            make.centerX.equalTo(self)
            make.height.equalTo(353)
        }

        self.addSubview(saveButton)
        
        // 기존 코드
        //        NSLayoutConstraint.activate([
        //            saveButton.widthAnchor.constraint(equalToConstant: 150),
        //            saveButton.heightAnchor.constraint(equalToConstant: 50),
        //            saveButton.topAnchor.constraint(equalTo: contentTextView.bottomAnchor, constant: 20),
        //            saveButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        //
        //        ])
        
        // SnapKit
        saveButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.top.equalTo(contentTextView.snp.bottom).offset(20)
            make.centerX.equalTo(self)
        }
     

    }
}
