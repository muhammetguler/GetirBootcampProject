import UIKit

protocol OrderViewProtocol:AnyObject {
    func setLabelPrice(_ price:String)
}

class OrderView: UIView {
    
    var orderPresenter:OrderViewPresenter? {
        didSet {
            orderPresenter?.load()
        }
    }

    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Siparişi Tamamla", for: .normal)
        button.titleLabel?.font = UIFont(name: "Open Sans", size: 14)
        button.backgroundColor = UIColor(red: 93/255, green: 62/255, blue: 188/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10 // This is an arbitrary value; replace with your design's value
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return button
    }()

    private let priceLabel: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10 // Adjust the cornerRadius as needed
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private let priceTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Open Sans", size: 20)
        label.textColor = UIColor(red: 93/255, green: 62/255, blue: 188/255, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        
        addSubview(actionButton)
        
        // Modify the priceLabel setup to add priceTextLabel
        priceLabel.addSubview(priceTextLabel)
        NSLayoutConstraint.activate([
            priceTextLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            priceTextLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            priceTextLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: 12),
            priceTextLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: -12)
        ])
        
        addSubview(priceLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            // Button constraints
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            actionButton.topAnchor.constraint(equalTo: topAnchor),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Price label view constraints
            priceLabel.leadingAnchor.constraint(equalTo: actionButton.trailingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: topAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            priceLabel.widthAnchor.constraint(equalToConstant: 116) // Width from Hug (116px)
        ])
    }
}

extension OrderView:OrderViewProtocol {
    func setLabelPrice(_ price: String) {
        self.priceTextLabel.text = "₺\(price)"
    }

}
