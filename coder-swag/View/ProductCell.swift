//
//  ProductCell.swift
//  coder-swag
//
//  Created by Apostolos Chalkias on 18/08/2017.
//  Copyright © 2017 Apostolos Chalkias. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
     @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    
    func updateViews(product: Product) {
        imageView.image =  UIImage(named: product.imageName)
        productTitle.text = product.title
        productPrice.text = product.price
    }
    
}
