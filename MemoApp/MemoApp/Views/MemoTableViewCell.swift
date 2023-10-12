//
//  MemoTableViewCell.swift
//  MemoApp
//
//  Created by 차소민 on 2023/10/10.
//

import UIKit

class MemoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var memoContentLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var memoData: MemoData? {
        didSet {
            configureUIwithData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    func configureUIwithData() {
        memoContentLabel.text = memoData?.memoContent
        dateLabel.text = memoData?.dateString
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
