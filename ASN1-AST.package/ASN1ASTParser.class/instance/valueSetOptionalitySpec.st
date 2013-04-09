X.680 grammar
valueSetOptionalitySpec
	^ super valueSetOptionalitySpec ==> [:nodes|
		(nodes = 'OPTIONAL')
			ifTrue: [ ASN1ModifierOptionalNode new ]
			ifFalse: [ ASN1ModifierDefaultValueNode new value: nodes second]]