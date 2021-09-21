public enum LinkedList<T> {
	case empty
	indirect case node(key: String, value: T, next: LinkedList<T>)

	init() { self = .empty }
}

extension LinkedList {

	public mutating func push(value: T, for key: String) {
		self = .node(key: key, value: value, next: self)
	}

	public mutating func removeValue(for key: String) {
		var a = value(for: key)
		a = .none
	}

	public mutating func pop() -> T? {
		switch self {
		case let .node(_, value, next):
			self = next
			return value
		case .empty:
			return nil
		}
	}

	public func peek() -> T? {
		switch self {
		case let .node(_, value, _):
			return value
		case .empty:
			return nil
		}
	}

	public func value(for key: String) -> T? {
		var _value: T? = .none

		switch node(for: key) {
		case .some(let value):
			if case let .node(_, __value, _) = value {
				_value = __value
			}
		default:
			break
		}

		return _value
	}

	private func node(for key: String) -> LinkedList? {
		guard case .node = self else {
			return nil
		}

		var _self = self
		var result: LinkedList? = .none

		while case let .node(__key, _, __next) = _self {
			if __key == key {
				result = _self
				break
			} else {
				_self = __next
			}
		}

		return result
	}
}
