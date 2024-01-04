import AppKit

public protocol Workspace {
  func open(_ url: URL) -> Bool
}

extension NSWorkspace: Workspace {}
