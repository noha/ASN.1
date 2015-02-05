visiting
visitSequence: aSequence 
	|  encoded dict |
	encoded := ASN1ConstructedTaggedValue new
		tag: aSequence universalTag.
	aSequence hasElements ifFalse: [ ^ encoded ].
	dict := currentValue.
	aSequence elements associations do:  [ :each |
		(each value class = ASN1Extension) ifFalse: [   
			(dict includesKey: each key) 
				ifTrue: [ 
					self 
						push: (dict at: each key)
						during: [ encoded elements add: (self visit: (aSequence elementAt: each key) value) ]]
				ifFalse: [
					each value isOptional
						ifTrue: [ each value hasDefaultValue ifTrue: [ 
							self 
								push: each value defaultValue 
								during: [ encoded elements add: (self visit: (aSequence elementAt: each key) value) ] ] ]
						ifFalse: [ self mandatoryElementNotFound ] ] ] ].
	^ encoded