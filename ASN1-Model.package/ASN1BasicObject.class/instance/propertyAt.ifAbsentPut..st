accessing
propertyAt: aString ifAbsentPut: aBlock
	^ self properties at: aString asSymbol ifAbsentPut: aBlock