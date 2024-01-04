import Foundation

public protocol NetServices {
    func domain(
        _ domain: String,
        type: String,
        name: String,
        port: Int32
    ) -> NetService?
}

struct LiveNetServices: NetServices {
    func domain(
        _ domain: String,
        type: String,
        name: String,
        port: Int32
    ) -> NetService? {
        return NetService(
            domain: domain,
            type: type,
            name: name,
            port: port
        )
    }
}
