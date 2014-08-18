as yet unclassified
rountTrip: aType value: anObject 
	| cls |
	cls := Smalltalk at: ('ASN1',aType,'Type') asSymbol.
	self assert: (cls decode: (cls encode: anObject)) = anObject
		