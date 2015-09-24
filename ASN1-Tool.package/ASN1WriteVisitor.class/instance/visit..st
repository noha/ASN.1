visiting
visit: aType
	currentValue isAsn1Value ifFalse: [ Error signal: 'currentValue is not an ASN.1 value' ].
	(aType isNil ifTrue: [ self halt ]).
	( aType matchesValue: currentValue ) ifFalse: [ Error signal: 'mismatch in type hierarchy: got ', aType class name, ' but got ', currentValue class name ].
	^ super visit: aType