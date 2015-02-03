accessing
propertyAt: aString ifAbsent: aBlock
	^ properties at: aString asSymbol ifAbsent: aBlock