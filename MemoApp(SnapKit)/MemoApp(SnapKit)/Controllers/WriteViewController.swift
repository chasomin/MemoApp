//
//  WriteViewController.swift
//  MemoApp(SnapKit)
//
//  Created by 차소민 on 2023/10/16.
//

import UIKit

class WriteViewController: UIViewController {
    
    private let detailView = WriteView()
    
    override func loadView() {
        self.view = detailView
    }
    let memoManager = CoreDataManager.shared

    var memoData: MemoData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureUI()
    }
    
    func setup() {
        detailView.contentTextView.delegate = self

        navigationController?.navigationBar.prefersLargeTitles = false
        
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }

    func configureUI() {
        // 기존데이터가 있을때
        if let memoData = self.memoData {
            self.title = "메모 수정하기"
            
            guard let text = memoData.memoContent else { return }
            detailView.contentTextView.text = text
            
            detailView.contentTextView.textColor = .black
            detailView.saveButton.setTitle("UPDATE", for: .normal)
            detailView.contentTextView.becomeFirstResponder()
            
        // 기존데이터가 없을때
        } else {
            self.title = "새로운 메모 생성하기"
            
            detailView.contentTextView.text = "텍스트를 여기에 입력하세요."
            detailView.contentTextView.textColor = .lightGray
        }
    }
    
    @objc func saveButtonTapped(_ sender: UIButton) {
        // 기존데이터가 있을때 ===> 기존 데이터 업데이트
        if let memoData = self.memoData {
            // 텍스트뷰에 저장되어 있는 메세지
            memoData.memoContent = detailView.contentTextView.text
            memoManager.updateMemo(newMemoData: memoData) {
                print("업데이트 완료")
                // 다시 전화면으로 돌아가기
                self.navigationController?.popViewController(animated: true)
            }
            
        // 기존데이터가 없을때 ===> 새로운 데이터 생성
        } else {
            let memoText = detailView.contentTextView.text
            memoManager.saveMemoData(memoText: memoText) {
                print("저장완료")
                // 다시 전화면으로 돌아가기
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension WriteViewController: UITextViewDelegate {
    // 입력을 시작할때
    // (텍스트뷰는 플레이스홀더가 따로 있지 않아서, 플레이스 홀더처럼 동작하도록 직접 구현)
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "텍스트를 여기에 입력하세요." {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    // 입력이 끝났을때
    func textViewDidEndEditing(_ textView: UITextView) {
        // 비어있으면 다시 플레이스 홀더처럼 입력하기 위해서 조건 확인
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "텍스트를 여기에 입력하세요."
            textView.textColor = .lightGray
        }
    }
}
