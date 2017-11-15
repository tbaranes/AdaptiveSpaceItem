// AdaptiveSpaceItem.swift
//
// Copyright (c) 2016 Tom Baranes 
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import Cocoa

public class AdaptiveSpaceItem: NSToolbarItem {

    // MARK: - Life cycle

    public override func awakeFromNib() {
        super.awakeFromNib()
        let adaptiveSpaceItemView = AdaptiveSpaceItemView(frame: NSRect(origin: CGPoint.zero, size: CGSize(width: 1, height: 1)))
        adaptiveSpaceItemView.adaptiveSpaceItem = self
        view = adaptiveSpaceItemView

        label = ""
    }

    // MARK: - Public methods

    public func updateWidth() {
        minSize = minSize()
        maxSize = maxSize()
    }

    // MARK: - Private methods

    private func minSize() -> NSSize {
        let items = toolbar?.items
        let index = items?.index(of: self)
        guard let unwrappedIndex = index, let unwrappedItems = items,
            let superviewFrame = view?.superview?.frame, superviewFrame.origin.x > 0 else {
                return minSize
        }

        guard  unwrappedItems.count > unwrappedIndex + 1 else {
            return minSize
        }

        let nextItem = unwrappedItems[unwrappedIndex + 1]
        guard let nextItemView = nextItem.view,
            let nextItemSuperview =  nextItemView.superview,
            let toolbarFrame = nextItemSuperview.superview?.frame else {
                return minSize
        }

        let nextFrame = nextItemSuperview.frame
        var space = (toolbarFrame.width - nextFrame.width) / CGFloat(2.0) - superviewFrame.origin.x
        space = space >= 0.0 ? space : 0
        return NSSize(width: space, height: minSize.height)
    }

    private func maxSize() -> NSSize {
        return NSSize(width: minSize().width, height: maxSize.height)
    }
}

class AdaptiveSpaceItemView: NSView {

    // MARK: - Properties

    var adaptiveSpaceItem: AdaptiveSpaceItem?

    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        adaptiveSpaceItem?.updateWidth()
    }

    override func viewDidMoveToWindow() {
        NotificationCenter.default.addObserver(self, selector: #selector(windowDidResize), name: NSWindow.didResizeNotification, object: self.window)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Notifications

    @objc func windowDidResize() {
        adaptiveSpaceItem?.updateWidth()
    }

}
