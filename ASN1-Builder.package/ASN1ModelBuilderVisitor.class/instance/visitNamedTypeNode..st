visiting
visitNamedTypeNode: aNode
	| assoc |
	assoc := ASN1Association new
		key: aNode name;
		value: (self visit: aNode type ).
	aNode modifiers notNil ifTrue: [
		assoc modifiers: (
			(aNode modifiers = 'OPTIONAL') 
				ifTrue: [ ASN1ModifierOptional new ]
				ifFalse: [ ASN1ModifierDefaultValue new value: aNode modifiers second ])].
	^ assoc