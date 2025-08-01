import UIKit

/// An implementation of the `PagingItem` protocol that stores the
/// index and title of a given item. The index property is needed to
/// make the `PagingItem` comparable.
public struct PagingIndexItem: PagingItem, PagingIndexable, Hashable {
    /// The index of the `PagingItem` instance
    public let index: Int

    /// The title used in the menu cells.
    public let title: String
    
    // The name used in the menu cells original text.
    public let name: String
    
    /// Creates an instance of `PagingIndexItem`
    ///
    /// Parameter index: The index of the `PagingItem`.
    /// Parameter title: The title used in the menu cells.
    public init(index: Int, title: String, originalName: String? = nil) {
        self.index = index
        self.title = title
        self.name = originalName ?? title
    }
    
    public static func <(lhs: PagingIndexItem, rhs: PagingIndexItem) -> Bool {
        return lhs.index < rhs.index
    }
}
