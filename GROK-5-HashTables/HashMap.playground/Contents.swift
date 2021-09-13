// MARK: - Hash Table Imp

/// Implements the Hash Map backed with a linked list
/// - Important:
///   - `removeValue(forKey)` now is implemented nominally
struct HashMap<T> {

	/// LinkedList array that provides the bucket containment of the elements
	var bucketArray: [LinkedList<T>]

	/// Maximum capacity
	private var _size: Int

	/// Instantiates the copy of the map
	/// - Parameter size: Map size (default value is 1000)
	init(size: Int = 1000) {
		_size = size
		bucketArray = Array.init(repeating: .empty, count: size)
	}
}

// MARK: - CRUD

extension HashMap {

	/// Adds the value to the hash map
	/// - Parameters:
	///   - key: The string value that will represent the key of the element
	///   - value: The value of the element
	mutating func add(_ key: String, value: T) {
		let i = abs(djb2Hash(key) % _size)

		/// If the node at index is empty, create a new node
		guard case .node = bucketArray[i] else {
			bucketArray[i] = .node(
				key: key,
				value: value,
				next: bucketArray[i]
			)
			return
		}

		/// Or push the value in a collision case
		bucketArray[i].push(value: value, for: key)
	}

	/// Removes the value for the given key
	/// - Parameter key: The string value that will represent the key of the element
	/// - Returns: Value to be removed
	/// - Warning: This is not implemented
	mutating func removeValue(for key: String) -> T? {
		let i = abs(djb2Hash(key) % _size)

		/// If there's not value for the key, return `nil`
		guard case .node = bucketArray[i] else {
			return nil
		}

		let x: T? = nil

		/// Return the value
		return x
	}
}

// MARK: - Subscripting

extension HashMap {

	/// Retrieves the value for the goven key
	/// - Parameter key: The string value that will represent the key of the element
	/// - Returns: The value if any
	func value(for key: String) -> T? {
		let i = abs(djb2Hash(key) % _size)

		/// If there's not value for the key, return `nil`
		guard case let .node(_key, _value, _next) = bucketArray[i] else {
			return nil
		}

		/// If the keys matched
		if key == _key {

			/// Retrun the result
			return _value
		} else {

			/// Or recursively search for the next node
			return _next.value(for: key)
		}
	}

	/// Implements the ability to get or `nillify` the value
	subscript(key: String) -> T? {

		/// Return the value if any
		get {
			return value(for: key)
		}

		/// Depending on the new value either set or remove the collection's element
		set(newValue) {
			switch newValue {

			/// Add value
			case .some(let value):
				add(key, value: value)
			case .none:
				removeValue(for: key)
			}
		}
	}
}
