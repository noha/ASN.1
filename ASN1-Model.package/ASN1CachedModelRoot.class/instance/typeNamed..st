accessing
typeNamed: aString 
	| type |
	type := types at: aString asSymbol ifPresent: [ :v | ^ v ].
	type := super typeNamed: aString.
	type ifNotNil: [ 
		types at: aString asSymbol put: type ].
	^ type 