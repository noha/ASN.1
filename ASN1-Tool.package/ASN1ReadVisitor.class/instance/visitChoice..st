visiting
visitChoice: aChoice
	| slot result |
	slot := aChoice elementWithTag: stack top tag ifNone: [
		^ self 
			error: (ASN1ElementNotFound new messageText: 'cannot find element for tag ', stack top tag printString)
			on: ASN1Dictionary new ].
	result :=  self visit: slot value.
	^ ASN1Dictionary new
		type: aChoice;
		at: slot key put: result value;
		yourself