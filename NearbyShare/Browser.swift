import Network

public protocol Browser {
    var browseResultsChangedHandler: ((_ newResults: Set<NWBrowser.Result>, _ changes: Set<NWBrowser.Result.Change>) -> Void)? { get set }

    func cancel()
    func start(queue: DispatchQueue)
}

extension NWBrowser: Browser {}
