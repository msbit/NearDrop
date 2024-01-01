import Foundation
import Network

protocol Connection {
  var stateUpdateHandler: ((_ state: NWConnection.State) -> Void)? { get set }

  func receive(
    minimumIncompleteLength: Int,
    maximumLength: Int,
    completion: @escaping (
      _ content: Data?, _ contentContext: NWConnection.ContentContext?, _ isComplete: Bool,
      _ error: NWError?
    ) -> Void
  )

  func send(
    content: Data?,
    contentContext: NWConnection.ContentContext,
    isComplete: Bool,
    completion: NWConnection.SendCompletion
  )

  func start(queue: DispatchQueue)
}

extension NWConnection: Connection {}
