accessing
propertyAt: aString ifAbsentPut: aBlock
	^ properties at: aString asSymbol ifAbsentPut: aBlock