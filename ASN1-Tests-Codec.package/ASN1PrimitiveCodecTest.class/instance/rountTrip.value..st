as yet unclassified
rountTrip: aType value: anObject 
	| cls |
	cls := ('ASN1',aType,'Type') asClass.
	self assert: (cls decode: (cls encode: anObject)) = anObject
		