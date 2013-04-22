accessing
at: aKey put: anObject
	(keys includes: aKey)
		ifTrue: [ 
			values 
				at: (keys indexOf: aKey asn1Normalized ) 
				put: anObject ]
		ifFalse: [
			keys add: aKey asn1Normalized.
			values add: anObject ]