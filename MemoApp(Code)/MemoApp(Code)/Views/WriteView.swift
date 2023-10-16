//
//  WriteView.swift
//  MemoApp(Code)
//
//  Created by 차소민 on 2023/10/16.
//

import UIKit

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

//    private lazy var stackView: UIStackView = {
//        let stview = UIStackView(arrangedSubviews: [contentTextView, saveButton])
//        stview.spacing = 20
//        stview.axis = .vertical
//        stview.distribution = .fill
//        stview.alignment = .fill
//        stview.translatesAutoresizingMaskIntoConstraints = false
//        return stview
//    }()
//    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
//        self.addSubview(stackView)
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
//            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
////            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//        ])
        
                self.addSubview(contentTextView)

        NSLayoutConstraint.activate([
            contentTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            contentTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            contentTextView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            contentTextView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20),
            contentTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentTextView.heightAnchor.constraint(equalToConstant: 353)
        ])

        self.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.widthAnchor.constraint(equalToConstant: 150),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.topAnchor.constraint(equalTo: contentTextView.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)

        ])
     

    }
}
