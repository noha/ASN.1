visiting
visitPrimitiveType: aPrimitiveType
	(currentValue type class = aPrimitiveType class) ifFalse: [ Error signal: 'primitive types do not match' ].
	^ currentValue encodedValue "aPrimitive encodedValue: currentValue value"