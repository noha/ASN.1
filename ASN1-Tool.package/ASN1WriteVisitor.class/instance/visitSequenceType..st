visiting
visitSequenceType: aSequence 
	|  encoded object |
	encoded := ASN1EncodedConstructedValue new
		tag: aSequence universalTag.
	aSequence hasElements ifFalse: [ ^ encoded ].
	object := currentValue basicValue.
	aSequence elements associations do:  [ :each |
		(each value class = ASN1Extension) ifFalse: [   
			(object includesKey: each key) 
				ifTrue: [ 
					self 
						push: (object basicAt: each key)
						during: [ encoded elements add: (self visit: (aSequence elementAt: each key)) ]]
				ifFalse: [
					each value isOptional
						ifTrue: [ each value hasDefaultValue ifTrue: [ 
							self 
								push: each value defaultValue 
								during: [ encoded elements add: (self visit: (aSequence elementAt: each key) value) ] ] ]
						ifFalse: [ self mandatoryElementNotFound ] ] ] ].
	^ encoded