import Network

public protocol Browsers {
    func forDescriptor(
        _ descriptor: NWBrowser.Descriptor,
        using parameters: NWParameters
    ) -> Browser?
}

struct LiveBrowsers: Browsers {
    func forDescriptor(_ descriptor: NWBrowser.Descriptor, using parameters: NWParameters) -> Browser? {
        return NWBrowser(
            for: descriptor,
            using: parameters
        )
    }
}
