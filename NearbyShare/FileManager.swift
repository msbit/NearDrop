import Foundation

protocol FileManager {
  func attributesOfItem(atPath path: String) throws -> [FileAttributeKey: Any]

  func createFile(
    atPath path: String,
    contents data: Data?,
    attributes attr: [FileAttributeKey: Any]?
  ) -> Bool

  func fileExists(atPath path: String) -> Bool

  func removeItem(at URL: URL) throws

  func url(
    for directory: Foundation.FileManager.SearchPathDirectory,
    in domain: Foundation.FileManager.SearchPathDomainMask,
    appropriateFor url: URL?,
    create shouldCreate: Bool
  ) throws -> URL
}

extension Foundation.FileManager: FileManager {}
