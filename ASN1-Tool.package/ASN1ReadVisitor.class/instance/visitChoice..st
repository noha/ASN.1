visiting
visitChoice: aChoice
	| slot result |
	slot := aChoice elementWithTag: stack top tag.
	result := self visitEncoded: slot value.
	^ ASN1Dictionary new
		type: aChoice;
		at: slot key put: result value;
		yourself