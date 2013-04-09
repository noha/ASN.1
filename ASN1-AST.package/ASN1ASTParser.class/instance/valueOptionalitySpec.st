X.680 grammar
valueOptionalitySpec
	^ super valueOptionalitySpec ==> [:nodes|
		(nodes = 'OPTIONAL')
			ifTrue: [ ASN1ModifierOptionalNode new ]
			ifFalse: [ ASN1ModifierDefaultValueNode new value: nodes second]]