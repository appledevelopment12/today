//
//  AddedToSiteCollectionViewCell.swift
//  today
//
//  Created by Rajeev on 04/10/23.
//

import UIKit

class AddedToSiteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 24
    }
    
}
