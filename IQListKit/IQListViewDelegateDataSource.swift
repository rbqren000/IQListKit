//
//  IQListViewDelegateDataSource.swift
//  https://github.com/hackiftekhar/IQListKit
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

// MARK: - IQListViewDelegate

@objc public protocol IQListViewProxyDelegate: AnyObject {
    @objc optional func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView)
}

public protocol IQListViewDelegate: UIScrollViewDelegate {

    /// Will give a chance to modify or other configuration of cell if necessary
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - cell: The IQListCell which can be typecased to your cell.
    ///   - indexPath: indexPath in which the cell will display
    func listView(_ listView: IQListView, modifyCell cell: IQListCell, at indexPath: IndexPath)

    /// Cell will about to display
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - cell: The IQListCell which is about to display in the listView
    ///   - indexPath: indexPath in which the cell is about to display
    func listView(_ listView: IQListView, willDisplay cell: IQListCell, at indexPath: IndexPath)

    /// Cell did end displaying
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - cell: The IQListCell which is about to be removed from UI
    ///   - indexPath: indexPath in which the cell is displaying
    func listView(_ listView: IQListView, didEndDisplaying cell: IQListCell, at indexPath: IndexPath)

    /// An item is selected
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - item: the item which is selected. item.type will be the cell type. item.model will be the Model
    ///   - indexPath: indexPath which is selected
    func listView(_ listView: IQListView, didSelect item: IQItem, at indexPath: IndexPath)

    /// An item is deselected
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - item: the item which is deselected. item.type will be the cell type. item.model will be the Model
    ///   - indexPath: indexPath which is deselected
    func listView(_ listView: IQListView, didDeselect item: IQItem, at indexPath: IndexPath)

    /// An item is highlighted
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - item: the item which is highlightel
    ///   - indexPath: indexPath which is selected
    func listView(_ listView: IQListView, didHighlight item: IQItem, at indexPath: IndexPath)

    /// An item is unhighlighted
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - item: the item which is unhighlighted.
    ///   - indexPath: indexPath which is deselected
    func listView(_ listView: IQListView, didUnhighlight item: IQItem, at indexPath: IndexPath)

    /// An item is selected
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - item: the item which is selected. item.type will be the cell type. item.model will be the Model
    ///   - indexPath: indexPath which is selected
    func listView(_ listView: IQListView, performPrimaryAction item: IQItem, at indexPath: IndexPath)

    /// Will give a chance to modify the supplementary view before appearance
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - view: supplementary  view which will be shown
    ///   - section: section of the ListView
    ///   - kind: Kind of section. Either header or footer or customized
    ///   - indexPath: contains section of the ListView
    func listView(_ listView: IQListView, modifySupplementaryElement view: UIView,
                  section: IQSection, kind: String, at indexPath: IndexPath)

    /// Supplementary view will about to display
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - view: supplementary View
    ///   - section: section of the ListView
    ///   - kind: Kind of section. Either header or footer or customized
    ///   - indexPath: section of the ListView
    func listView(_ listView: IQListView, willDisplaySupplementaryElement view: UIView,
                  section: IQSection, kind: String, at indexPath: IndexPath)

    /// Supplementary view did end displaying
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - view: supplementary View
    ///   - section: section of the ListView
    ///   - kind: Kind of section. Either header or footer or customized
    ///   - indexPath: section of the ListView
    func listView(_ listView: IQListView, didEndDisplayingSupplementaryElement view: UIView,
                  section: IQSection, kind: String, at indexPath: IndexPath)

    /// Cell will display context menu
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - configuration: UIContextMenuConfiguration
    ///   - animator: UIContextMenuInteractionAnimating
    ///   - item: IQItem
    ///   - indexPath: indexPath in which the cell is displaying
    func listView(_ listView: IQListView, willDisplayContextMenu configuration: UIContextMenuConfiguration,
                  animator: UIContextMenuInteractionAnimating?, item: IQItem, at indexPath: IndexPath)

    /// Cell will end display context menu
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - configuration: UIContextMenuConfiguration
    ///   - animator: UIContextMenuInteractionAnimating
    ///   - item: IQItem
    ///   - indexPath: indexPath in which the cell is displaying
    func listView(_ listView: IQListView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration,
                  animator: UIContextMenuInteractionAnimating?, item: IQItem, at indexPath: IndexPath)
}

// MARK: - IQListViewDataSource

public protocol IQListViewDataSource: AnyObject {

    /// Return the size of an Item, for tableView the size.height will only be effective
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - item: the item which is asked for it's size. item.type will be the cell type. item.model will be the Model
    ///   - indexPath: indexPath of the item
    func listView(_ listView: IQListView, size item: IQItem, at indexPath: IndexPath) -> CGSize?

    /// Return the supplementary view  of section
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - section: section of the ListView
    ///   - kind: section of the ListView. UICollectionView.elementKindSectionHeader
    ///             or UICollectionView.elementKindSectionFooter or something custom type
    ///   - indexPath: section of the ListView
    func listView(_ listView: IQListView, supplementaryElementFor section: IQSection,
                  kind: String, at indexPath: IndexPath) -> UIView?

    /// Return the sectionIndexTitles for tableView
    /// - Parameter listView: The IQListView object
    func sectionIndexTitles(_ listView: IQListView) -> [String]?

    /// Will give a chance to prefetch items before appearance
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - items: items to prefetch data asynchronously
    ///   - indexPaths: indexPaths of the ListView
    func listView(_ listView: IQListView, prefetch items: [IQItem], at indexPaths: [IndexPath])

    /// Cancel prefetch items if not finished
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - items: items to cancel prefetch data
    ///   - indexPaths: indexPaths of the ListView
    func listView(_ listView: IQListView, cancelPrefetch items: [IQItem], at indexPaths: [IndexPath])

    /// Return the size of an Item, for tableView the size.height will only be effective
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - item: the item which is asked for it can move.
    ///   - indexPath: indexPath of the item
    func listView(_ listView: IQListView, canMove item: IQItem, at indexPath: IndexPath) -> Bool

    /// Return the size of an Item, for tableView the size.height will only be effective
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - item: the item which is asked for it can move.
    ///   - indexPath: indexPath of the item
    func listView(_ listView: IQListView, move sourceItem: IQItem,
                  at sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)

    /// Return the size of an Item, for tableView the size.height will only be effective
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - item: the item which is asked for it can move.
    ///   - indexPath: indexPath of the item
    func listView(_ listView: IQListView, canEdit item: IQItem, at indexPath: IndexPath) -> Bool

    /// Return the size of an Item, for tableView the size.height will only be effective
    /// - Parameters:
    ///   - listView: The IQListView object
    ///   - item: the item which is asked for it can move.
    ///   - indexPath: indexPath of the item
    func listView(_ listView: IQListView, commit item: IQItem,
                  style: UITableViewCell.EditingStyle, at indexPath: IndexPath)
}

// MARK: - Combined delegate/datasource
public typealias IQListViewDelegateDataSource = (IQListViewDelegate & IQListViewDataSource)

// MARK: - Default implementations of protocols

public extension IQListViewDelegate {

    func listView(_ listView: IQListView, modifyCell cell: IQListCell, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, willDisplay cell: IQListCell, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, didEndDisplaying cell: IQListCell, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, performPrimaryAction item: IQItem, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, didSelect item: IQItem, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, didDeselect item: IQItem, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, didHighlight item: IQItem, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, didUnhighlight item: IQItem, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, modifySupplementaryElement view: UIView,
                  section: IQSection, kind: String, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, willDisplaySupplementaryElement view: UIView,
                  section: IQSection, kind: String, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, didEndDisplayingSupplementaryElement view: UIView,
                  section: IQSection, kind: String, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, willDisplayContextMenu configuration: UIContextMenuConfiguration,
                  animator: UIContextMenuInteractionAnimating?, item: IQItem, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration,
                  animator: UIContextMenuInteractionAnimating?, item: IQItem, at indexPath: IndexPath) {}
}

public extension IQListViewDataSource {

    func listView(_ listView: IQListView, size item: IQItem, at indexPath: IndexPath) -> CGSize? { return nil }

    func listView(_ listView: IQListView, supplementaryElementFor section: IQSection,
                  kind: String, at indexPath: IndexPath) -> UIView? { return nil }

    func sectionIndexTitles(_ listView: IQListView) -> [String]? { return nil }

    func listView(_ listView: IQListView, prefetch items: [IQItem], at indexPaths: [IndexPath]) {}

    func listView(_ listView: IQListView, cancelPrefetch items: [IQItem], at indexPaths: [IndexPath]) {}

    func listView(_ listView: IQListView, canEdit item: IQItem, at indexPath: IndexPath) -> Bool { return false }

    func listView(_ listView: IQListView, commit item: IQItem,
                  style: UITableViewCell.EditingStyle, at indexPath: IndexPath) {}

    func listView(_ listView: IQListView, canMove item: IQItem, at indexPath: IndexPath) -> Bool { return false }

    func listView(_ listView: IQListView, move sourceItem: IQItem,
                  at sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {}
}
