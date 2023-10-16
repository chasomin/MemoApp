//
//  ViewController.swift
//  MemoApp
//
//  Created by 차소민 on 2023/10/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let memoManager = CoreDataManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setupNaviBar() {
        self.title = "MEMO"
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // 테이블뷰의 선 없애기
//        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "MemoTableViewCell", bundle: nil), forCellReuseIdentifier: "MemoCell")
    }
    

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "MemoCell", sender: nil)
    }
    
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoManager.getMemoListFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as! MemoTableViewCell
        // 셀에 모델(MemoData) 전달
        let memoData = memoManager.getMemoListFromCoreData()
        cell.memoData = memoData[indexPath.row]
        
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MemoCell", sender: indexPath)
    }
    
    // (세그웨이를 실행할때) 실제 데이터 전달 (ToDoData전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MemoCell" {
            let detailVC = segue.destination as! WriteViewController
            
            guard let indexPath = sender as? IndexPath else { return }
            detailVC.memoData = memoManager.getMemoListFromCoreData()[indexPath.row]
        }
    }
    
    // 테이블뷰의 높이를 자동적으로 추청하도록 하는 메서드
    // (ToDo에서 메세지가 길때는 셀의 높이를 더 높게 ==> 셀의 오토레이아웃 설정도 필요)
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

