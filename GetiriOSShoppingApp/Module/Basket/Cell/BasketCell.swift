//
//  NewViewController.swift
//  DesignDeneme
//
//  Created by Muhammet Guler on 24.04.2024.
//

import UIKit

protocol BasketCellProtocol:AnyObject {
//    func setProductImage(_ imageData: Data)
//    func setProductPriceText(_ text: String)
//    func setProductName(_ text: String)
//    func setProductAttribute(_ text: String)
    func setViews(_ product:Product)
    func setLayerColor(color:UIColor)
}

class BasketCell: UICollectionViewCell {
    
    static let identifier = "BasketCell"
    
    var stepperView:StepperView = StepperView(isVertical: false, sizeOption: .small)
    
    var basketPresenterCell:BasketPresenterCellProtocol? {
        didSet {
            basketPresenterCell?.load() // after being initialized, load func will be called.
        }
    }

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(red: 242/255, green: 240/255, blue: 250/255, alpha: 1).cgColor
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Semibold", size: 12)
        label.textColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let attributeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Semibold", size: 12)
        label.textColor = UIColor(red: 105/255, green: 116/255, blue: 136/255, alpha: 1)
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelView: UIView = {
        let view = UIView()
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "OpenSans-Bold", size: 14)
        label.textColor = UIColor(red: 93/255, green: 62/255, blue: 188/255, alpha: 1)
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceView: UIView = {
        let view = UIView()
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bigContainerView: UIView = {
        let view = UIView()
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        // Add subviews to labelView
        labelView.addSubview(productNameLabel)
        labelView.addSubview(attributeLabel)
        
        // Add subview to priceView
        priceView.addSubview(priceLabel)
        
        // Add subviews to containerView
        containerView.addSubview(labelView)
        containerView.addSubview(priceView)
        
        // Add subviews to bigContainerView
        bigContainerView.addSubview(imageView)
        bigContainerView.addSubview(containerView)
        bigContainerView.addSubview(stepperView)
        
        // Add bigContainerView to contentView
        contentView.addSubview(bigContainerView)
        
        bigContainerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        labelView.translatesAutoresizingMaskIntoConstraints = false
        priceView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stepperView.translatesAutoresizingMaskIntoConstraints = false
        
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        attributeLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        bigContainerView.translatesAutoresizingMaskIntoConstraints = false
        bigContainerView.translatesAutoresizingMaskIntoConstraints = false
        bigContainerView.translatesAutoresizingMaskIntoConstraints = false

        applyConstraints()
        
    }
    
    private func applyConstraints() {
        // BigContainerView constraints
        NSLayoutConstraint.activate([
            bigContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bigContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bigContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bigContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
            
        // ImageView constraints
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: bigContainerView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: bigContainerView.topAnchor),
            imageView.heightAnchor.constraint(equalTo: bigContainerView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),

        ])
            
        // LabelView constraints
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            labelView.topAnchor.constraint(equalTo: containerView.topAnchor),
            // height will be determined by the intrinsic content

        ])
        
        // ProductNameLabel constraints
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: labelView.topAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            productNameLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor)
        ])
        
        // AttributeLabel constraints
        NSLayoutConstraint.activate([
            attributeLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 4),
            attributeLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            attributeLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
            attributeLabel.bottomAnchor.constraint(equalTo: labelView.bottomAnchor) // Ensure labelView wraps content
        ])
        
        // PriceView constraints
        NSLayoutConstraint.activate([
            priceView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            priceView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 4),
            priceView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            // height is determined by instrinsic size
            priceView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        // PriceLabel constraints
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: priceView.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: priceView.trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: priceView.bottomAnchor) // Ensure priceView wraps content
        ])
        
        // ContainerView constraints
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: stepperView.leadingAnchor, constant: -12),
            //containerView.topAnchor.constraint(equalTo: bigContainerView.topAnchor, constant: 8.5),
            //containerView.bottomAnchor.constraint(equalTo: bigContainerView.bottomAnchor, constant: -8.5),
            containerView.centerYAnchor.constraint(equalTo: bigContainerView.centerYAnchor)
            // height is determined by intrinsic size
            
        ])
        
        // StepperView constraints
        NSLayoutConstraint.activate([
            stepperView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            stepperView.trailingAnchor.constraint(equalTo: bigContainerView.trailingAnchor),

            //stepperView.widthAnchor.constraint(equalToConstant: 94) // Assume width based on UI design
        ])
      }
}

extension BasketCell:BasketCellProtocol {
    func setLayerColor(color: UIColor) {
        self.imageView.layer.borderColor = color.cgColor
    }
    
    func setViews(_ product: Product) {
        self.imageView.image = UIImage(data: product.imageData ?? Data())
        self.priceLabel.text = product.priceText
        self.productNameLabel.text = product.name
        self.attributeLabel.text = product.attribute ?? product.shortDescription ?? ""
        
        let stepperPresent = StepperPresenter(view: self.stepperView, product: product)
        stepperPresent.delegate = self.basketPresenterCell as! BasketPresenterCell
        stepperView.stepperPresenter = stepperPresent
    }

}
    
    // Use this function to configure the cell with actual data

