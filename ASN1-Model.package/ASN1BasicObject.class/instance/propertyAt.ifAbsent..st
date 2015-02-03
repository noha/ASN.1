accessing
propertyAt: aString ifAbsent: aBlock
	^ self properties at: aString asSymbol ifAbsent: aBlock