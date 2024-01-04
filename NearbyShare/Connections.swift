import Network

public protocol Connections {
    func to(_ to: NWEndpoint, using: NWParameters) -> Connection
}

struct LiveConnections: Connections {
    func to(_ to: NWEndpoint, using: NWParameters) -> Connection {
        return NWConnection(to: to, using: using)
    }
}
