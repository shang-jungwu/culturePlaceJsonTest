//
//  TableViewCell.swift
//  hotelJsonTest
//
//  Created by 吳宗祐 on 2023/6/14.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
