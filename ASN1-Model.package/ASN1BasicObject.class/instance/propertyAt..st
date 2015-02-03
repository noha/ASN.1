accessing
propertyAt: aString 
	^ self properties at: aString asSymbol ifAbsent: [ nil ]