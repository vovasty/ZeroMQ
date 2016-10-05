import XCTest
@testable import ZeroMQ

class ZeroMQTests: XCTestCase {
    func testPushPull() throws {
        var called = false
        let context = try Context()

        let inbound = try context.socket(.pull)
        try inbound.bind("tcp://127.0.0.1:5555")

        let outbound = try context.socket(.push)
        try outbound.connect("tcp://127.0.0.1:5555")

        XCTAssert(try outbound.sendString("Hello World!"))
        XCTAssert(try outbound.sendString("Bye!"))

        while let data = try inbound.receiveString() , data != "Bye!" {
            called = true
            XCTAssert(data == "Hello World!")
        }
        
        XCTAssert(called)
    }
}

extension ZeroMQTests {
    static var allTests: [(String, (ZeroMQTests) -> () throws -> Void)] {
        return [
           ("testPushPull", testPushPull),
        ]
    }
}
