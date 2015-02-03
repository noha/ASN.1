accessing
propertyAt: aString 
	^ properties at: aString asSymbol ifAbsent: [ nil ]