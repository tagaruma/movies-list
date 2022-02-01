//
//  Bindable.swift
//  HusqvarnaTest
//
//  Created by Ruslan Garifulin on 2022-02-01.
//

import Foundation

class Bindable<Value> {
    private var observations: [(Value) -> Bool] = []
    private var lastValue: Value?

    init(_ value: Value? = nil) {
        lastValue = value
    }

    func update(with value: Value) {
        lastValue = value
        observations = observations.filter { $0(value) }
    }
}

extension Bindable {
    func bind<O: AnyObject, T>(
        _ sourceKeyPath: KeyPath<Value, T>,
        to object: O,
        _ objectKeyPath: ReferenceWritableKeyPath<O, T>
    ) {
        addObservation(for: object) { object, observed in
            let value = observed[keyPath: sourceKeyPath]
            object[keyPath: objectKeyPath] = value
        }
    }

    func bind<O: AnyObject, T>(
        _ sourceKeyPath: KeyPath<Value, T>,
        to object: O,
        _ objectKeyPath: ReferenceWritableKeyPath<O, T?>
    ) {
        addObservation(for: object) { object, observed in
            let value = observed[keyPath: sourceKeyPath]
            object[keyPath: objectKeyPath] = value
        }
    }
}

private extension Bindable {
    func addObservation<O: AnyObject>(for object: O, handler: @escaping (O, Value) -> Void) {
        lastValue.map { handler(object, $0) }

        observations.append { [weak object] value in
            guard let object = object else { return false }

            handler(object, value)
            return true
        }
    }
}
