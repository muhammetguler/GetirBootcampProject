//
//  StepperView.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 20.04.2024.
//

import Foundation
import UIKit

enum StepperSizeOption { // For horizantal
    case small
    case medium
    case large
    case custom(width: CGFloat, height: CGFloat)

    var dimensions: (width: CGFloat, height: CGFloat) {
        switch self {
        case .small:
            return (width: 96, height: 32)
        case .medium:
            return (width: 144, height: 48)
        case .large:
            return (width: 192, height: 64)
        case .custom(let width, let height):
            return (width: width, height: height)
        }
    }
}

protocol StepperViewProtocol:AnyObject {
    func setTrashButton(hidden: Bool)
    func setItemCountLabel(hidden: Bool)
    func setItemCountLabel(_ itemCount:Int)
    // func updatePlusButtonCorners(_ corners: CACornerMask)
    func setBackgroundColor(_ color:UIColor)
    func setIcons(image:UIImage)
}

class StepperView: UIView {

    // MARK: - Properties
    var stepperPresenter:StepperPresenterProtocol? {
        didSet {
            //stepperPresenter?.updateVisibility()
            stepperPresenter?.load()
        }
    }
    
    var isVertical:Bool = true {
        didSet {
            updateConstraintsForOrientation()
        }
    }
    
    private var sizeOption: StepperSizeOption = .medium {
        didSet {
            updateConstraintsForOrientation()
        }
    }
    
    private var widthConstraint: NSLayoutConstraint!
    private var heightConstraint: NSLayoutConstraint!
    
    private lazy var horizantalConstraints:[NSLayoutConstraint] = {
  
        return [
            self.heightAnchor.constraint(equalToConstant: 48),
            self.widthAnchor.constraint(greaterThanOrEqualToConstant: 144),
            // Set the height of the StepperView to be at least 96

            trashButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            trashButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            trashButton.heightAnchor.constraint(equalTo: self.heightAnchor),
            trashButton.widthAnchor.constraint(equalTo: trashButton.heightAnchor),
            
            itemCountLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            itemCountLabel.leadingAnchor.constraint(equalTo: trashButton.trailingAnchor),
            itemCountLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
            itemCountLabel.widthAnchor.constraint(equalTo: itemCountLabel.heightAnchor),
            
            plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusButton.leadingAnchor.constraint(equalTo: itemCountLabel.trailingAnchor),
            plusButton.heightAnchor.constraint(equalTo: self.heightAnchor),
            plusButton.widthAnchor.constraint(equalTo: plusButton.heightAnchor),
        
        ]
    }()
    
    private lazy var verticalConstraints:[NSLayoutConstraint] = {
  
        return [
            self.widthAnchor.constraint(equalToConstant: 32),
            // Set the height of the StepperView to be at least 96
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: 96),

            plusButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            plusButton.topAnchor.constraint(equalTo: self.topAnchor),
            plusButton.widthAnchor.constraint(equalTo: self.widthAnchor),
            plusButton.heightAnchor.constraint(equalTo: plusButton.widthAnchor),
            
            itemCountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            itemCountLabel.topAnchor.constraint(equalTo: plusButton.bottomAnchor),
            itemCountLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            itemCountLabel.heightAnchor.constraint(equalToConstant: 32),
            
            trashButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            trashButton.topAnchor.constraint(equalTo: itemCountLabel.bottomAnchor),
            trashButton.widthAnchor.constraint(equalTo: self.widthAnchor),
            trashButton.heightAnchor.constraint(equalTo: trashButton.widthAnchor),
        
        ]
    }()
    
    

    // MARK: - UI Components
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        let image = UIImage(named: "plus")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(red: 93.0/255, green: 62.0/255, blue: 188.0/255, alpha: 1.0)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
//        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let trashButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        let image = UIImage(named: "trash")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(red: 93.0/255, green: 62.0/255, blue: 188.0/255, alpha: 1.0)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
//        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner] // Top right corner, Top left corner respectively
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let itemCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 93/255.0, green: 62/255.0, blue: 188/255.0, alpha: 1.0) // Using RGBA color
        if let customFont = UIFont(name: "OpenSans-Bold", size: 12) {
            label.font = customFont
        }
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    // MARK: - Initialization
    
    init(frame: CGRect = .zero, isVertical:Bool = true, sizeOption: StepperSizeOption = .medium) {
        super.init(frame: frame)
        self.isVertical = isVertical
        self.sizeOption = sizeOption
        configureView()
        setupViews()
        setupConstraints()

    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        setupConstraints()
    }
    
    private func updateConstraintsForOrientation() {
        setupConstraints()
        setNeedsUpdateConstraints()
    }
    
    private func setupConstraints() {
        // First, deactivate existing constraints
        if isVertical {
            NSLayoutConstraint.activate(verticalConstraints)
        } else {
            if let widthConstraint = widthConstraint {
                widthConstraint.isActive = false
            }
            if let heightConstraint = heightConstraint {
                heightConstraint.isActive = false
            }
            NSLayoutConstraint.deactivate(horizantalConstraints + verticalConstraints)

            // Setup new constraints based on orientation
            NSLayoutConstraint.activate(horizantalConstraints)

            // Apply new size constraints from the enum
            let dimensions = sizeOption.dimensions
            widthConstraint = widthAnchor.constraint(equalToConstant: dimensions.width)
            heightConstraint = heightAnchor.constraint(equalToConstant: dimensions.height)
            
            widthConstraint?.isActive = true
            heightConstraint?.isActive = true
        }
        

    }
    
    // MARK: - Configurations
    
    private func configureView() {
        // Set the corner radius for the top left corner
        backgroundColor = .clear
        layer.cornerRadius = 8
        
        // Set the shadow properties
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 3
        layer.masksToBounds = false
    }

    // MARK: - Setup
    
    private func setupViews() {
        addSubview(plusButton)
        addSubview(trashButton)
        addSubview(itemCountLabel)
        
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        trashButton.addTarget(self, action: #selector(trashButtonTapped), for: .touchUpInside)
        

    }
    
    // MARK: - Actions
    @objc private func plusButtonTapped() {
        self.stepperPresenter?.plusButtonTapped()
    }
    
    @objc private func trashButtonTapped() {
        self.stepperPresenter?.trashButtonTapped()
    }
}

extension StepperView:StepperViewProtocol {
    func setBackgroundColor(_ color: UIColor) {
        self.backgroundColor = color
    }
    
    func setItemCountLabel(_ itemCount: Int) {
        self.itemCountLabel.text = "\(itemCount)"
    }
    
    func setTrashButton(hidden: Bool) {
        trashButton.isHidden = hidden
    }
    
    func setItemCountLabel(hidden: Bool) {
        itemCountLabel.isHidden = hidden
    }
    
    func setIcons(image:UIImage) {
        trashButton.setImage(image, for: .normal)
    }

}
