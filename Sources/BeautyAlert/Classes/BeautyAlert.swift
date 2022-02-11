import UIKit

public enum ShadowStyle {
    case leftBottom
    case rightBottom
    case leftTop
    case rightTop
    
    var size: CGSize {
        switch self {
        case .leftBottom:
            return CGSize(width: -5, height: 5)
        case .rightBottom:
            return CGSize(width: 5, height: 5)
        case .leftTop:
            return CGSize(width: -5, height: -5)
        case .rightTop:
            return CGSize(width: -5, height: 5)
        }
    }
}

public enum ButtonStyle {
    case confirm
    case cancel
}

open class BeautyAlert: UIViewController {
    private var contentView = UIView()
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private var messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 4
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    private var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    private var confirmButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return button
    }()
    
    private var cancelButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return button
    }()
    
    private var cancelAction: (() -> ())?
    private var confirmAction: (() -> ())?
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view.backgroundColor = .gray.withAlphaComponent(0.5)
        configUI()
        setPresentModalStyle()
        tapBehindView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setContentAttribute(
        title: String? = nil,
        titleColor: UIColor = .black,
        message: String? = nil,
        messageColor: UIColor = .black,
        backgroundColor: UIColor = .white
    ) {
        titleLabel.text = title
        titleLabel.textColor = titleColor
        messageLabel.text = message
        messageLabel.textColor = messageColor
        contentView.backgroundColor = backgroundColor
    }
    
    public func addButton(
        title: String,
        titleColor: UIColor,
        backgroundColor: UIColor,
        style: ButtonStyle,
        action: (() -> ())?
    ) {
        switch style {
        case .confirm:
            self.buttonStackView.addArrangedSubview(confirmButton)
            confirmAction = action
            confirmButton.setTitle(title, for: .normal)
            confirmButton.setTitleColor(titleColor, for: .normal)
            confirmButton.backgroundColor = backgroundColor
            confirmButton.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
        case .cancel:
            self.buttonStackView.addArrangedSubview(cancelButton)
            cancelAction = action
            cancelButton.setTitle(title, for: .normal)
            cancelButton.setTitleColor(titleColor, for: .normal)
            cancelButton.backgroundColor = backgroundColor
            cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        }
    }
    
    @objc private func didTapConfirmButton() {
        confirmAction?()
    }
    
    @objc private func didTapCancelButton() {
        cancelAction?()
    }
    
    public func setContentShadowDirection(style: ShadowStyle) {
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = style.size        
    }
    
    private func configUI() {
        contentView.layer.masksToBounds = false
        contentView.layer.cornerRadius = 10
        
        view.addSubview(contentView)
        contentView.addSubview(contentStackView)
        
        [titleLabel, messageLabel, buttonStackView].forEach {
            contentStackView.addArrangedSubview($0)
        }
      
        if #available(iOS 11.0, *) {
            contentStackView.setCustomSpacing(15, after: messageLabel)
        }
        
        [contentView, contentStackView].forEach {
            $0?.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.8),
            
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    private func tapBehindView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToDismiss))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapToDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setPresentModalStyle() {
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
}

extension BeautyAlert: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let location = touch.location(in: self.view)
        let contentViewXRange = (contentView.frame.minX...contentView.frame.maxX)
        let contentViewYRange = (contentView.frame.minY...contentView.frame.maxY)
        
        if contentViewXRange.contains(location.x) && contentViewYRange.contains(location.y) {
            return false
        }
        
        return true
    }
}
