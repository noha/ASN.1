visiting
visit: aType
	(aType isNil ifTrue: [ self halt ]).
	"we need either a ASN.1 value object or an already encoded value"
	(currentValue isAsn1Value or: [ currentValue isAsn1EncodedValue ]) ifFalse: [ 
		Error signal: 'currentValue is not an ASN.1 value' ].
	( aType matchesValue: currentValue ) ifFalse: [ 
		Error signal: 'mismatch in type hierarchy: got ', aType class name, ' but got ', currentValue class name ].
	^ super visit: aType