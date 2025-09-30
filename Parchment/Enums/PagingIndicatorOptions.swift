import UIKit

public enum PagingIndicatorOptions {
    case hidden
    case visible(
        height: CGFloat,
        width: CGFloat? = nil,
        zIndex: Int = 1,
        spacing: UIEdgeInsets = .zero,
        insets: UIEdgeInsets = .zero
    )
}
