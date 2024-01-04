import Foundation

public protocol Host {
    var localizedName: String? { get }
}

extension Foundation.Host: Host {}
