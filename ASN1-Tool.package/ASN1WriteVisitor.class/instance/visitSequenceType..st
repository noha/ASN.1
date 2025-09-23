visiting
visitSequenceType: aSequence 
	|  encoded object |
	encoded := ASN1EncodedConstructedValue new
		tag: aSequence universalTag.
	aSequence hasElements ifFalse: [ ^ encoded ].
	object := currentValue "basicValue".
	aSequence elements associations do:  [ :each |
		(each value class = ASN1Extension) ifFalse: [   
			(skipAddedDefaults and: [ object wasAddedByDefault: each key ]) ifFalse:  [  
				(object includesKey: each key)
					ifTrue: [ 
						self 
							push: (object privAt: each key)
							during: [ encoded elements add: (self visit: (aSequence elementAt: each key)) ]]
					ifFalse: [
						each value isOptional
							ifTrue: [ each value hasDefaultValue ifTrue: [ 
								self 
									push: each value defaultValue 
									during: [ encoded elements add: (self visit: (aSequence elementAt: each key) defaultValue type ) ] ] ]
							ifFalse: [ self mandatoryElementNotFound ] ] ] ] ].
	^ encoded