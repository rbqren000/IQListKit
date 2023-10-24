//
//  IQModelableCell.swift
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

// MARK: - Main Modelable Cell Protocol

@MainActor
public protocol IQModelableCell: IQModelModifiable, IQViewSizeProvider,
                                 IQCellActionsProvider where Self: IQListCell {

    /// Dynamic model which should be implemented in cells confirming the IQModelableCell
    associatedtype Model: Hashable & Sendable

    /// model variable which will be used to configure the cell contents
    var model: Model? { get set }
}

// MARK: - Default implementations of confirmed protocols

public extension IQModelableCell {

    func setModel(_ model: AnyHashable) {
        self.model = model as? Model
    }
}

@MainActor
public extension IQModelableCell {

    static func estimatedSize(for model: AnyHashable, listView: IQListView) -> CGSize? {
        return size(for: model, listView: listView)
    }

    static func size(for model: AnyHashable, listView: IQListView) -> CGSize? {
        return nil
    }

    static func indentationLevel(for model: AnyHashable, listView: IQListView) -> Int {
        return 0
    }
}

@MainActor
public extension IQCellActionsProvider {

    func leadingSwipeActions() -> [UIContextualAction]? { return nil }

    func trailingSwipeActions() -> [UIContextualAction]? { return nil }

    func contextMenuConfiguration() -> UIContextMenuConfiguration? { return nil }

    func contextMenuPreviewView(configuration: UIContextMenuConfiguration) -> UIView? { return nil }

    func performPreviewAction(configuration: UIContextMenuConfiguration,
                              animator: UIContextMenuInteractionCommitAnimating) {}
}
