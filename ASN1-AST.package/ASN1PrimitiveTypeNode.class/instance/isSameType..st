testing
isSameType: aType
	aType isPrimitiveNode ifFalse: [
		^ false ].
	^ name = aType name