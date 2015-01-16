validating
validateType: aType value: aValue
	(aValue isAsn1Value and: [ aValue type notNil ])
		ifTrue: [  
			(aType acceptsType: aValue type) ifFalse: [ Error signal: 'type mismatch' ].
			aValue validate  ]
		ifFalse: [ 
			aType validate: aValue ] 