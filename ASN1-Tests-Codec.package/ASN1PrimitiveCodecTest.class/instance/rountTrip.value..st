as yet unclassified
rountTrip: aType value: anObject 
	self assert: (ASN1PrimitiveCodec 
		perform: ((#decode,aType) asSymbol asMutator) 
		with: (
			ASN1PrimitiveCodec 
				perform: ((#encode,aType) asSymbol asMutator)
				with: anObject)) = anObject
	