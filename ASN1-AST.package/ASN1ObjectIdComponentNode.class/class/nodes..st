instance creation
nodes: anObject
	anObject isAsn1Node ifTrue: [ ^ anObject ].
	anObject isNumber ifTrue: [
		^ self number: anObject ].
	self definedNumbers
		at: anObject
		ifPresent: [:num|
			 ^ self new
				name: anObject;
				number: num ].
	^ anObject asn1Reference 