//
//  ParallaxTableView.swift
//  ParallaxEffect
//
//  Created by Руслан Акберов on 23.06.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class ParallaxTableView: UITableView {
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let header = tableHeaderView else { return }
        let offset = -contentOffset.y
        heightConstraint.constant = max(header.bounds.height, header.bounds.height + offset)
        // image should have aspect fill mode
    }
    
}
