import Parchment
import UIKit

// This is the simplest use case of using Parchment. We just create a
// bunch of view controllers, and pass them into our paging view
// controller. FixedPagingViewController is a subclass of
// PagingViewController that makes it much easier to get started with
// Parchment when you only have a fixed array of view controllers. It
// will create a data source for us and set up the paging items to
// display the view controllers title.
class BasicViewController: UIViewController {
    private lazy var purchaseButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "crown")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 36).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(onPurchaseTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.contentMode = .center
        button.tintColor = .darkGray
        button.widthAnchor.constraint(equalToConstant: 36).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
                
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [purchaseButton, searchButton])
        
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewControllers = [
            ContentViewController(index: 0),
            ContentViewController(index: 1),
            ContentViewController(index: 2),
            ContentViewController(index: 3),
        ]

        let pagingViewController = PagingViewController(viewControllers: viewControllers, rightView: buttonsStackView)

        pagingViewController.indicatorOptions = .visible(height: 2, width: 26, zIndex: Int.max, spacing: .zero, insets: .zero)
        // Make sure you add the PagingViewController as a child view
        // controller and constrain it to the edges of the view.
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
    }
    
    @objc private func onPurchaseTapped() {
        self.purchaseButton.isHidden = true
    }
}
