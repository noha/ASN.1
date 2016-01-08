validating
newBaseValue: aPrimitiveValue 
	(aPrimitiveValue type class = self class) ifFalse: [ Error signal: 'mismatch in type for existing base value' ].
	^ aPrimitiveValue 