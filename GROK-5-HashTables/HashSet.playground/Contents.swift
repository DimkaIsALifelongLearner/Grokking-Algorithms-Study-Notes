// MARK: - Hash Set Imp

/// Unordered hash naively implemented via Swift Dictionary
struct HashSet<T: Hashable> {

	/// Dictionary holding the values, unordered
	/// This collection is chosen as it has hash function
	/// `Bool` value is a placeholder
	var bucketArray = Dictionary<T, Bool>()
}

/// Adds some of the CRUD operations
extension HashSet {


	/// Adds element to the collection
	/// - Parameter element: Some type that can be hashed
	mutating func insert(_ element: T) {
		bucketArray[element] = true
	}

	/// Removes element from the collection
	/// - Parameter element: Some type that can be hashed
	mutating func remove(_ element: T) {
		bucketArray[element] = nil
	}

	/// Removes all elements from the collection
	mutating func removeAll() {
		bucketArray.removeAll()
	}
}

/// Adds the ability to peek and transform the collection
extension HashSet {

	/// Checks whether the collections contains value
	/// - Parameter element: Element of the collection
	/// - Returns: `true` if the collection has the element
	func contains(_ element: T) -> Bool {
		guard bucketArray[element] != nil else {
			return false
		}
		return true
	}

	/// Converts the collection into a flat array
	/// - Returns: Collection as flat array
	func flatArray() -> [T] {
		Array(bucketArray.keys)
	}
}

/// Adds the ability to get count and check whether
/// the collection is empty
extension HashSet {

	/// Count
	var count: Int {
		bucketArray.count
	}

	/// `true` if empty
	var isEmpty: Bool {
		bucketArray.isEmpty
	}
}

/// Subscripting capabilities
extension HashSet {

	/// Subscript
	/// - Parameter element: Collection's element
	/// - Returns: Collection's element, if any
	subscript(_ element: T) -> T? {
		guard bucketArray[element] != nil else {
			return nil
		}
		return bucketArray[element] as? T
	}
}
