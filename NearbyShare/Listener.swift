import Network

protocol Listener {
  var newConnectionHandler: ((_ connection: NWConnection) -> Void)? { get set }
  var port: NWEndpoint.Port? { get }
  var stateUpdateHandler: ((_ newState: NWListener.State) -> Void)? { get set }

  func start(queue: DispatchQueue)
}

extension NWListener: Listener {}
