typealias MatrixDimension = (rows: Int, columns: Int)
typealias ElementPosition = (x: Int, y: Int)
typealias MatrixDataField = [[Int]]

enum MatrixType {

	case square
	case rectangular
}

protocol MatrixElement {

	var value: Int { get set }
	var position: ElementPosition { get set }
}

struct MatrixElementImp: MatrixElement {

	var value: Int

	var position: ElementPosition
}


protocol Matrix {

	var dataField: MatrixDataField { get set }

	var type: MatrixType { get set }

	var dimensions: MatrixDimension { get set }
}

struct MatrixObject: Matrix {

	var dataField: MatrixDataField

	var type: MatrixType

	var dimensions: MatrixDimension
}

extension MatrixObject {

	init(dimensions: MatrixDimension) {
		self.dimensions = dimensions
		self.dataField = MatrixDataField.init(
			repeating: [Int].init(repeating: 3, count: dimensions.rows),
			count: dimensions.columns
		)
		dimensions.columns == dimensions.rows ? (type = .square) : (type = .square)
	}
}

extension MatrixObject: CustomDebugStringConvertible {

	var debugDescription: String {
		var output = ""
		for column in dataField {
			output += "\(column)\n"
		}
		return output
	}
}

var a = MatrixObject(dimensions: (3,3))
a.dataField[2][1] = 4
print(a.debugDescription)


