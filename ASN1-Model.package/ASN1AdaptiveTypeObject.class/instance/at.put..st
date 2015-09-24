accessing
at: aKey put: anObject
	| typeForKey |
	anObject isAsn1 
		ifTrue: [ Error signal: 'no ASN.1 values allowed here' ].
	
	typeForKey := type 
		elementAt: aKey 
		ifNone: [ NotFound signal: 'no field ', aKey asString,' found' ].
	
	(self expandFieldNamed: aKey type: typeForKey) contents: anObject.
	
	^ anObject