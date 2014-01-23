X.680 grammar
componentType
	^ super componentType ==> [:nodes|
		(nodes first = 'COMPONENTS OF') 
			ifTrue: [ ASN1ComponentsOfNode new type: nodes second ]
			ifFalse: [ | component |
				component := ASN1ComponentTypeNode new 
					type: nodes first.
				nodes second ifNotNil: [ 
					component modifiers: ((nodes second = 'OPTIONAL')
						ifTrue: [ ASN1ModifierOptionalNode new ]
						ifFalse: [ ASN1ModifierDefaultValueNode new value: nodes second second ])].
				component ]]