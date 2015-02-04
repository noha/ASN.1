visiting
visitChoice: aChoice
	| slot result value |
	value := aChoice newValue.
	slot := aChoice elementWithTag: currentTaggedValue tag ifNone: [
		^ self 
			error: (ASN1ElementNotFound new messageText: 'cannot find element for tag ', currentTaggedValue tag printString)
			on:  value ].
	
	result :=self 
		push: currentTaggedValue
		during: [ self visit: slot value ].
	^ value
		type: aChoice;
		at: slot key put: result;
		yourself