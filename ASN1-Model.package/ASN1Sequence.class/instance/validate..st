validating
validate: anObject
	elements associations do: [ :binding | | fieldType |
		binding isExtension ifFalse: [  
			fieldType := binding value.
			fieldType isOptional ifFalse: [ 
				(anObject includesKey: binding key) ifFalse: [ ASN1MandatoryElementNotFound signal: binding key, ' not found' ] ].
			(anObject includesKey: binding key) ifTrue: [ | val |
				val := (anObject basicAt: binding key).
				self validateType: fieldType value: val ] ] ]