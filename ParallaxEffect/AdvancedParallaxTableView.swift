//
//  AdvancedParallaxTableView.swift
//  ParallaxEffect
//
//  Created by Руслан Акберов on 23.06.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class AdvancedParallaxTableView: UITableView {
    
    var heightHeaderConstraint: NSLayoutConstraint?
    var bottomHeaderConstraint: NSLayoutConstraint?
    
    var heightFooterConstraint: NSLayoutConstraint?
    var bottomFooterConstraint: NSLayoutConstraint?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // image should have aspect fill mode
        // header
        guard let header = tableHeaderView else { return }
        if let imageView = header.subviews.first as? UIImageView {
            heightHeaderConstraint = imageView.constraints.filter {$0.identifier == "height"}.first
            bottomHeaderConstraint = header.constraints.filter {$0.identifier == "bottom"}.first
        }
        let offsetHeader = -contentOffset.y
        heightHeaderConstraint?.constant = max(header.bounds.height, header.bounds.height + offsetHeader)
        bottomHeaderConstraint?.constant = offsetHeader >= 0 ? 0 : offsetHeader / 2
        header.clipsToBounds = offsetHeader <= 0
        
        //footer
        guard let footer = tableFooterView else { return }
        if let imageView = footer.subviews.first as? UIImageView {
            heightFooterConstraint = imageView.constraints.filter {$0.identifier == "heightFooter"}.first
            bottomFooterConstraint = footer.constraints.filter {$0.identifier == "bottomFooter"}.first
        }
        let offsetFooter = -contentOffset.y
        heightFooterConstraint?.constant = max(footer.bounds.height, footer.frame.height + offsetFooter)
//        print(footer.bounds.height, self.frame.height - offsetFooter)
        bottomFooterConstraint?.constant = offsetFooter >= 0 ? 0 : offsetFooter / 2
        footer.clipsToBounds = offsetFooter <= 0
        
    }
    
    
    
    
    
    
}
