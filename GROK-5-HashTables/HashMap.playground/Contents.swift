// MARK: - Hash Table Imp

struct HashMap<T> {

	var bucketArray: [LinkedList<T>]
	private var _size: Int

	init(size: Int = 1000) {
		_size = size
		bucketArray = Array.init(repeating: .empty, count: size)
	}

	mutating func add(_ key: String, value: T) {
		let i = abs(djb2Hash(key) % _size)

		guard case .node = bucketArray[i] else {
			bucketArray[i] = .node(
				key: key,
				value: value,
				next: bucketArray[i]
			)
			return
		}

		bucketArray[i].push(value: value, for: key)

	}

	mutating func removeValue(for key: String) -> T? {
		let i = abs(djb2Hash(key) % _size)

		guard case .node = bucketArray[i] else {
			return nil
		}

		let x: T? = nil

		return x
	}

	func value(for key: String) -> T? {
		let i = abs(djb2Hash(key) % _size)

		guard case let .node(_key, _value, _next) = bucketArray[i] else {
			return nil
		}

		if key == _key {
			return _value
		} else {
			return _next.value(for: key)
		}
	}

	subscript(key: String) -> T? {
		get {
			return value(for: key)
		}

		set(newValue) {
			switch newValue {
			case .some(let value):
				add(key, value: value)
			case .none:
				removeValue(for: key)
			}
		}
	}
}


var a = HashMap<Int>.init()
a.add("Tomato", value: 44)
a.add("Oranges", value: 50)

print(a)

