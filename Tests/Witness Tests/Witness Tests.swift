import Testing

@testable import Witness

extension Witness {
    @Suite
    struct `Witness markers accept conformances through both protocol spellings` {
        @Suite struct `Witness marker conformances admit stored operations and require no members` {}
        @Suite struct `The macro facing Witness alias accepts marker conformances` {}
    }
}

extension Witness.`Witness markers accept conformances through both protocol spellings`.`Witness marker conformances admit stored operations and require no members` {
    @Test
    func `namespace exists and can be used for type containment`() {
        func acceptWitnessProtocol<T: Witness.`Protocol`>(_ type: T.Type) {}

        struct Fixture: Witness.`Protocol` {
            var operation: @Sendable () -> Void
        }

        acceptWitnessProtocol(Fixture.self)
    }

    @Test
    func `Witness.Protocol is a pure marker protocol with no requirements`() {
        struct Fixture: Witness.`Protocol` {}

        let _: any Witness.`Protocol` = Fixture()
    }
}

extension Witness.`Witness markers accept conformances through both protocol spellings`.`The macro facing Witness alias accepts marker conformances` {
    @Test
    func `__WitnessProtocol typealias exists for macro use`() {
        func accept<T: __WitnessProtocol>(_ type: T.Type) {}
        struct Fixture: __WitnessProtocol {}
        accept(Fixture.self)
    }
}
