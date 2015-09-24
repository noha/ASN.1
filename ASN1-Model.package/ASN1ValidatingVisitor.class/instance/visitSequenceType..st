visiting
visitSequenceType: aSequence
	aSequence elements do: [ :binding | | fieldType |
		binding isExtension ifFalse: [  
			fieldType := binding value.
			fieldType isOptional ifFalse: [ 
				(value includesKey: binding key) ifFalse: [ ASN1MandatoryElementNotFound signal: binding key, ' not found' ] ].
			(value includesKey: binding key) ifTrue: [
				self validateType: fieldType value: (value privAt: binding key) ] ] ].