import Network
import XCTest

import NearbyShare

final class NearbyShareTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let manager = NearbyConnectionManager(
            fileHandles: MockFileHandles(),
            fileManager: MockFileManager(),
            listener: MockListener(),
            netServices: MockNetServices(),
            workspace: MockWorkspace()
        )

        manager.becomeVisible()

        manager.submitUserConsent(transferID: "", accept: false)

        manager.startDeviceDiscovery()

        manager.stopDeviceDiscovery()

        manager.addShareExtensionDelegate(MockShareExtensionDelegate())

        manager.removeShareExtensionDelegate(MockShareExtensionDelegate())

        manager.cancelOutgoingTransfer(id: "")

        manager.startOutgoingTransfer(deviceID: "", delegate: MockShareExtensionDelegate(), urls: [])
    }
}

class MockFileHandles: FileHandles {
    func forWritingTo(_ url: URL) throws -> FileHandle {
        throw MockError()
    }
}

class MockFileManager: NearbyShare.FileManager {
    func attributesOfItem(atPath path: String) throws -> [FileAttributeKey: Any] {
        throw MockError()
    }

    func createFile(
        atPath path: String,
        contents data: Data?,
        attributes attr: [FileAttributeKey: Any]?
    ) -> Bool {
        return false
    }

    func fileExists(atPath path: String) -> Bool {
        return false
    }

    func removeItem(at URL: URL) throws {
        throw MockError()
    }

    func url(
        for directory: Foundation.FileManager.SearchPathDirectory,
        in domain: Foundation.FileManager.SearchPathDomainMask,
        appropriateFor url: URL?,
        create shouldCreate: Bool
    ) throws -> URL {
        throw MockError()
    }
}

class MockNetServices: NetServices {
    func domain(
        _ domain: String,
        type: String,
        name: String,
        port: Int32
    ) -> NetService? {
        return .none
    }
}

class MockListener: Listener {
    var newConnectionHandler: ((_ connection: NWConnection) -> Void)? {
        get {
            return .none
        }
        set {}
    }
    var port: NWEndpoint.Port? {
        get {
            return .none
        }
    }
    var stateUpdateHandler: ((_ newState: NWListener.State) -> Void)? {
        get {
            return .none
        }
        set {}
    }

    func start(queue: DispatchQueue) {}
}

class MockWorkspace: Workspace {
    func open(_ url: URL) -> Bool {
        return false
    }
}

class MockShareExtensionDelegate: ShareExtensionDelegate {
  func addDevice(device: RemoteDeviceInfo) {}

  func removeDevice(id: String) {}

  func connectionWasEstablished(pinCode: String) {}

  func connectionFailed(with error: Error) {}

  func transferAccepted() {}

  func transferProgress(progress: Double) {}

  func transferFinished() {}
}

class MockError: Error {}
