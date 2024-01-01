import Foundation

protocol FileHandles {
  func forWritingTo(_ url: URL) throws -> FileHandle
}

struct LiveFileHandles: FileHandles {
  func forWritingTo(_ url: URL) throws -> FileHandle {
    return try FileHandle(forWritingTo: url)
  }
}
