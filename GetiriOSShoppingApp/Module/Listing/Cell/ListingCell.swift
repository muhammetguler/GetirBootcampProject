//
//  ListingCell.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 11.04.2024.
//

import UIKit


protocol ListingCellProtocol {
//    func setProductImage(_ imageData: Data)
//    func setProductPriceText(_ text: String)
//    func setProductName(_ text: String)
//    func setProductAttribute(_ text: String)
    func setViews(_ product:Product)
    func setLayerColor(color:UIColor)
}

class ListingCell: UICollectionViewCell {
    
    static let identifier = "ProductCell"
    
    var stepperView:StepperView = StepperView()
    
    var listingPresenterCell:ListingPresenterCellProtocol? {
        didSet {
            listingPresenterCell?.load() // after being initialized, load func will be called.
        }
    }
    
    var productImage:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        //imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor(red: 242.0/255, green: 240.0/255, blue: 250.0/255, alpha: 1.0).cgColor
        imageView.layer.borderWidth = 1.0
        return imageView
    }()
    
    var productPriceText:UILabel = {
        let label = UILabel()
        if let customFont = UIFont(name: "OpenSans-Bold", size: 14) {
            label.font = customFont
        }        
        //label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textColor = UIColor(red: 93.0/255, green: 62.0/255, blue: 188.0/255, alpha: 1)
        label.sizeToFit()
        return label
    }()
    
    var productName:UILabel = {
        let label = UILabel()
        if let customFont = UIFont(name: "OpenSans-Bold", size: 12) {
               label.font = customFont
        }
        //label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textColor = UIColor(red: 25.0/255, green: 25.0/255, blue: 25.0/255, alpha: 1)
        label.lineBreakMode = .byTruncatingMiddle
        label.numberOfLines = 1 // Ensure it's set to 1 to work with truncation
        return label
    }()
    
    var productAttribute:UILabel = {
        let label = UILabel()
        if let customFont = UIFont(name: "OpenSans-Bold", size: 12) {
               label.font = customFont
        }
        //label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textColor = UIColor(red: 105.0/255, green: 116.0/255, blue: 136.0/255, alpha: 1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1 // Ensure it's set to 1 to work with truncation
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        
        // Add subviews to the contentView
        contentView.addSubview(productImage)
        contentView.addSubview(productPriceText)
        contentView.addSubview(productName)
        //contentView.addSubview(addButton)
        contentView.addSubview(stepperView)
        contentView.addSubview(productAttribute)

        // Layout subviews
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productPriceText.translatesAutoresizingMaskIntoConstraints = false
        productName.translatesAutoresizingMaskIntoConstraints = false
        productAttribute.translatesAutoresizingMaskIntoConstraints = false
        //addButton.translatesAutoresizingMaskIntoConstraints = false
        stepperView.translatesAutoresizingMaskIntoConstraints = false

//        if let productDescription = self.productDescription {
//            contentView.addSubview(productDescription)
//            productDescription.translatesAutoresizingMaskIntoConstraints = false
//        }
        
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImage.heightAnchor.constraint(equalTo: productImage.widthAnchor),
      
            stepperView.topAnchor.constraint(equalTo: productImage.topAnchor, constant: -8),
            stepperView.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            
            productPriceText.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
            productPriceText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            productName.topAnchor.constraint(equalTo: productPriceText.bottomAnchor),
            productName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            productAttribute.topAnchor.constraint(equalTo: productName.bottomAnchor),
            productAttribute.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productAttribute.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])

    }
}

extension ListingCell:ListingCellProtocol {
    func setLayerColor(color: UIColor) {
        self.productImage.layer.borderColor = color.cgColor
    }
    
    func setViews(_ product: Product) {
        
        self.productImage.image = UIImage(data: product.imageData ?? Data())
        self.productPriceText.text = product.priceText
        self.productName.text = product.name
        self.productAttribute.text = product.attribute ?? product.shortDescription ?? ""
        
        let stepperPresent = StepperPresenter(view: self.stepperView, product: product)
        stepperPresent.delegate = self.listingPresenterCell as! ListingPresenterCell
        stepperView.stepperPresenter = stepperPresent
    }


}




