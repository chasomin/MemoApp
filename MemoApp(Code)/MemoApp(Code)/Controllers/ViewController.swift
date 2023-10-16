//
//  ViewController.swift
//  MemoApp(Code)
//
//  Created by 차소민 on 2023/10/16.
//

import UIKit

class ViewController: UIViewController {

    private let tableView = UITableView()

    let memoManager = CoreDataManager.shared

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupTableView()
        setupTableViewConstraints()
    }
    
    
    // 화면에 다시 진입할때마다 다시 테이블뷰 그리기 (업데이트 등 제대로 표시)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.reloadData()
    }
    
    // 네이게이션바 설정
    func setupNaviBar() {
        self.title = "MEMO"
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 네비게이션바 우측에 Plus 버튼 만들기
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        plusButton.tintColor = .black
        navigationItem.rightBarButtonItem = plusButton
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        // 셀의 등록과정 ⭐️ (코드로 구현)
        tableView.register(MemoCell.self, forCellReuseIdentifier: "MemoCell")
    }
    
    // 테이블뷰 자체의 오토레이아웃
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    

    
    // 네비바 상단 플러스 버튼 눌렸을때
    @objc func plusButtonTapped() {
        let detailVC = WriteViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}




extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoManager.getMemoListFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MemoCell
        
        // (테이블뷰 그리기 위한) 셀에 모델(ToDoData) 전달
        let memoData = memoManager.getMemoListFromCoreData()
        cell.memoData = memoData[indexPath.row]
       
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = WriteViewController()
        let selectedMemo = memoManager.getMemoListFromCoreData()[indexPath.row]
        detailVC.memoData = selectedMemo

        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // 테이블뷰의 높이를 자동적으로 추청하도록 하는 메서드
    // (ToDo에서 메세지가 길때는 셀의 높이를 더 높게 ==> 셀의 오토레이아웃 설정도 필요)
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
