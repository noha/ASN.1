visiting
visitChoice: aChoice
	| slot result value |
	value := self objectFor: aChoice.
	slot := aChoice elementWithTag: currentTaggedValue tag ifNone: [
		^ self 
			error: (ASN1ElementNotFound new messageText: 'cannot find element for tag ', currentTaggedValue tag printString)
			on:  value ].
	
	(self objectFor: slot key type: slot value basicType in: value) ifNotNil: [ :fieldValue |
		typeMap at: slot value basicType put: fieldValue ].
	result := self 
		push: currentTaggedValue
		during: [ self visit: slot value ].
	^ value
		type: aChoice;
		at: slot key put: result value;
		yourself